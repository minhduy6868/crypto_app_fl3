import 'package:bloc/bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bip39/bip39.dart' as bip39;
import 'package:ed25519_hd_key/ed25519_hd_key.dart';
import 'package:hex/hex.dart';
import 'package:web3dart/web3dart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../public_providers/config/bloc_base_state.dart';
import '../../../public_providers/config/update_bloc_base_state.dart';
import '../../../services/service_repositories/authentication_reponsitiory_firebase.dart';
import '../../../shared_customization/data/screen_value.dart';

part 'wallet_state.dart';
part 'wallet_cubit.freezed.dart';

class WalletCubit extends Cubit<WalletState> with UpdateBlocBaseState<WalletState> {
  WalletCubit({required this.isTestNet}) : super(const WalletState.initial()) {
    moralisApiKey = dotenv.env['API_KEY_WALLET'] ?? '';
    _loadWallet();
  }

  final bool isTestNet;
  late final AuthenticationRepositoryFirebase authRepo = AuthenticationRepositoryFirebase();
  late final String moralisApiKey;

  String get _rpcUrl => isTestNet
      ? 'https://sepolia.infura.io/v3/cc41858ca503485480329d6849d7456b'
      : 'https://mainnet.infura.io/v3/cc41858ca503485480329d6849d7456b';

  String get _chain => isTestNet ? 'sepolia' : 'eth';

  ///  **Tải thông tin ví từ SharedPreferences hoặc Firestore**
  Future<void> _loadWallet() async {
    final prefs = await SharedPreferences.getInstance();
    var privateKey = prefs.getString('wallet_private_key');
    var publicKey = prefs.getString('wallet_public_key');

    if (privateKey == null || publicKey == null) {
      final userData = await authRepo.getUserInfo();
      privateKey = userData['walletPrivateKey'];
      publicKey = userData['walletPublicKey'];

      if (privateKey != null && publicKey != null) {
        await savePrivateKey(privateKey);
        await savePublicKey(publicKey);
      }
    }

    if (privateKey != null && publicKey != null) {
      emit(state.copyWith(
        privateKey: privateKey,
        publicKey: EthereumAddress.fromHex(publicKey),
      ));
      getWalletBalance();
      getTransactionHistory();
    }
  }

  /// **Gửi ETH đến một địa chỉ khác**
  Future<void> sendTransaction(String toAddress, double amountInEth, {int? customNonce}) async {
    if (state.privateKey == null || state.publicKey == null) {
      throw Exception("Wallet not initialized");
    }

    final privateKey = EthPrivateKey.fromHex(state.privateKey!);
    final web3client = Web3Client(_rpcUrl, http.Client());

    try {
      // Fetch gas price from Firestore
      final gasPriceInGwei = await authRepo.getGasPrice(); // Returns double (e.g., 9.0)
      final gasPriceInGweiInt = gasPriceInGwei.truncate(); // Convert to int (e.g., 9)
      final gasPrice = EtherAmount.fromUnitAndValue(EtherUnit.gwei, gasPriceInGweiInt);
      final gasLimit = BigInt.from(21000);
      final estimatedFee = gasPrice.getInWei * gasLimit;
      final amountInWei = BigInt.from(amountInEth * 1e18);
      final balanceInWei = (await web3client.getBalance(state.publicKey!)).getInWei;

      if (balanceInWei < (amountInWei + estimatedFee)) {
        throw Exception("Insufficient balance: $balanceInWei < ${amountInWei + estimatedFee}");
      }

      final nonce = customNonce ?? await web3client.getTransactionCount(
        EthereumAddress.fromHex(state.publicKey!.hex),
        atBlock: BlockNum.pending(),
      );

      final transaction = Transaction(
        to: EthereumAddress.fromHex(toAddress),
        value: EtherAmount.fromBigInt(EtherUnit.wei, amountInWei),
        gasPrice: gasPrice,
        maxGas: 21000,
        nonce: nonce,
      );

      final txHash = await web3client.sendTransaction(
        privateKey,
        transaction,
        chainId: isTestNet ? 11155111 : 1,
      );

      // Save transaction to Firestore with pending status
      await authRepo.saveTransaction(
        txHash: txHash,
        fromAddress: state.publicKey!.hex,
        toAddress: toAddress,
        amountInEth: amountInEth,
        gasFeeInWei: estimatedFee,
        status: 'pending',
        chain: _chain,
      );

      // Wait for transaction confirmation
      TransactionReceipt? receipt;
      for (var i = 0; i < 30; i++) {
        receipt = await web3client.getTransactionReceipt(txHash);
        if (receipt != null) break;
        await Future.delayed(const Duration(seconds: 2));
      }

      if (receipt == null) {
        await authRepo.updateTransactionStatus(txHash, 'failed');
        throw Exception("Transaction not confirmed within timeout");
      }

      // Update transaction status
      await authRepo.updateTransactionStatus(txHash, receipt.status == true ? 'confirmed' : 'failed');
      await Future.delayed(const Duration(seconds: 1));
      await getWalletBalance();
      await getTransactionHistory();
    } catch (e) {
      print("Error sending transaction: $e");
      emit(state.copyWith(errorMessage: "Failed to send transaction: $e"));
      rethrow;
    } finally {
      web3client.dispose();
    }
  }

  ///  **Lấy lịch sử giao dịch**
  Future<void> getTransactionHistory() async {
    if (state.publicKey == null) return;

    emit(state.copyWith(errorMessage: null));

    final address = state.publicKey!.hex;
    final url = Uri.parse('https://deep-index.moralis.io/api/v2/$address?chain=$_chain');

    try {
      final response = await http.get(
        url,
        headers: {'X-API-Key': moralisApiKey, 'accept': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final transactions = data['result'] as List<dynamic>? ?? [];
        emit(state.copyWith(transactions: transactions));
      } else {
        throw Exception("Failed to load transaction history: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching transaction history: $e");
      emit(state.copyWith(
        transactions: [],
        errorMessage: "Không thể tải lịch sử giao dịch: $e",
      ));
    }
  }

  ///  **Lấy số dư khả dụng (trừ các giao dịch đang pending)**
  Future<void> getAvailableBalance() async {
    if (state.publicKey == null) return;

    emit(state.copyWith(errorMessage: null));

    final address = state.publicKey!.hex;
    final web3client = Web3Client(_rpcUrl, http.Client());

    try {
      final totalBalance = await web3client.getBalance(state.publicKey!);
      final totalBalanceInEth = double.parse(totalBalance.getInWei.toString()) / 1e18;

      final pendingTxUrl = Uri.parse(
          'https://deep-index.moralis.io/api/v2/$address?chain=$_chain&pending=true');
      final response = await http.get(
        pendingTxUrl,
        headers: {'X-API-Key': moralisApiKey, 'accept': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final pendingTransactions = data['result'] as List<dynamic>? ?? [];

        BigInt totalPendingValue = BigInt.zero;
        BigInt totalPendingGasFee = BigInt.zero;
        var gasLimit = BigInt.from(21000);
        final gasPrice = EtherAmount.fromUnitAndValue(EtherUnit.gwei, 10);

        for (var tx in pendingTransactions) {
          final value = BigInt.parse(tx['value']?.toString() ?? '0');
          totalPendingValue += value;
          totalPendingGasFee += gasPrice.getInWei * gasLimit;
        }

        final pendingValueInEth = totalPendingValue / BigInt.from(1e18);
        final pendingGasFeeInEth = totalPendingGasFee / BigInt.from(1e18);
        final availableBalance = totalBalanceInEth - (pendingValueInEth + pendingGasFeeInEth);

        emit(state.copyWith(
          balance: totalBalanceInEth,
          availableBalance: availableBalance >= 0 ? availableBalance : 0.0,
        ));
      } else {
        throw Exception("Failed to load pending transactions: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching available balance: $e");
      emit(state.copyWith(
        errorMessage: "Không thể tải số dư khả dụng: $e",
      ));
    } finally {
      web3client.dispose();
    }
  }

  /// 🎯 **Lấy số dư ví**
  Future<void> getWalletBalance() async {
    if (state.publicKey == null) return;

    emit(state.copyWith(errorMessage: null));

    final address = state.publicKey!.hex;
    final url = Uri.parse('https://deep-index.moralis.io/api/v2/$address/balance?chain=$_chain');

    try {
      final response = await http.get(
        url,
        headers: {'X-API-Key': moralisApiKey, 'accept': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data.containsKey('balance')) {
          final balance = double.parse(data['balance']) / 1e18;
          emit(state.copyWith(balance: balance));
          await getAvailableBalance();
        } else {
          throw Exception("Balance not found in response");
        }
      } else {
        throw Exception("Failed to load balance: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching balance: $e");
      emit(state.copyWith(
        errorMessage: "Không thể tải số dư: $e",
      ));
    }
  }

  /// 🎯 **Tạo ví mới**
  Future<void> generateWallet() async {
    if (state.privateKey != null && state.publicKey != null) return;

    final mnemonic = bip39.generateMnemonic();
    final privateKey = await getPrivateKey(mnemonic);
    final publicKey = await getPublicKey(privateKey);
    final publicKeyHex = publicKey.hex;

    await savePrivateKey(privateKey);
    await savePublicKey(publicKeyHex);

    await authRepo.updateWallet(privateKey, publicKeyHex);

    emit(state.copyWith(
      mnemonic: mnemonic,
      privateKey: privateKey,
      publicKey: publicKey,
      balance: 0.0,
    ));

    getWalletBalance();
  }

  /// 🔑 **Lấy private key từ mnemonic**
  Future<String> getPrivateKey(String mnemonic) async {
    final seed = bip39.mnemonicToSeed(mnemonic);
    final master = await ED25519_HD_KEY.getMasterKeyFromSeed(seed);
    return HEX.encode(master.key);
  }

  /// 🔓 **Lấy địa chỉ ví từ private key**
  Future<EthereumAddress> getPublicKey(String privateKey) async {
    final private = EthPrivateKey.fromHex(privateKey);
    return private.address;
  }

  /// 💾 **Lưu private key vào SharedPreferences**
  Future<void> savePrivateKey(String privateKey) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('wallet_private_key', privateKey);
  }

  /// 💾 **Lưu public key vào SharedPreferences**
  Future<void> savePublicKey(String publicKey) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('wallet_public_key', publicKey);
  }

  @override
  void resetErrorMessage() {
    emit(state.copyWith(errorMessage: null));
  }

  @override
  void resetStatus() {
    emit(state.copyWith(status: null));
  }
}