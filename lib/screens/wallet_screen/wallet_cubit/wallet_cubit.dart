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
  WalletCubit() : super(const WalletState.initial()) {
    moralisApiKey = dotenv.env['API_KEY_WALLET'] ?? '';
    _loadWallet();
  }

  late final AuthenticationRepositoryFirebase authRepo = AuthenticationRepositoryFirebase();
  late final String moralisApiKey;

  /// 🛠 **Tải thông tin ví từ SharedPreferences hoặc Firestore**
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

  /// 🚀 **Gửi ETH đến một địa chỉ khác**
  Future<void> sendTransaction(String toAddress, double amountInEth) async {
    if (state.privateKey == null || state.publicKey == null) {
      throw Exception("Wallet not initialized");
    }

    final privateKey = EthPrivateKey.fromHex(state.privateKey!);
    final web3client = Web3Client("https://mainnet.infura.io/v3/cc41858ca503485480329d6849d7456b", http.Client());

    final amountInWei = EtherAmount.fromUnitAndValue(EtherUnit.ether, amountInEth);

    final transaction = Transaction(
      to: EthereumAddress.fromHex(toAddress),
      value: amountInWei,
      gasPrice: EtherAmount.fromUnitAndValue(EtherUnit.gwei, 20),
      maxGas: 21000,
    );

    try {
      final txHash = await web3client.sendTransaction(privateKey, transaction);
      print("Transaction sent with hash: $txHash");

      // Cập nhật số dư và lịch sử giao dịch
      getWalletBalance();
      getTransactionHistory();
    } catch (e) {
      print("Error sending transaction: $e");
      throw e;
    }
  }

  /// 📜 **Lấy lịch sử giao dịch**
  Future<void> getTransactionHistory() async {
    if (state.publicKey == null) return;

    final address = state.publicKey!.hex;
    final url = Uri.parse('https://deep-index.moralis.io/api/v2/$address?chain=eth');

    try {
      final response = await http.get(
        url,
        headers: {'X-API-Key': moralisApiKey, 'accept': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final transactions = data['result'] as List<dynamic>;
        emit(state.copyWith(transactions: transactions));
      } else {
        throw Exception("Failed to load transaction history");
      }
    } catch (e) {
      print("Error fetching transaction history: $e");
    }
  }

  /// 🎯 **Lấy số dư ví**
  Future<void> getWalletBalance() async {
    if (state.publicKey == null) return;

    final address = state.publicKey!.hex;
    final url = Uri.parse('https://deep-index.moralis.io/api/v2/$address/balance?chain=eth');

    try {
      final response = await http.get(
        url,
        headers: {'X-API-Key': moralisApiKey, 'accept': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data.containsKey('balance')) {
          final balance = double.parse(data['balance']) / 1e18; // Chuyển từ Wei sang ETH
          emit(state.copyWith(balance: balance));
        }
      } else {
        throw Exception("Failed to load balance");
      }
    } catch (e) {
      print("Error fetching balance: $e");
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