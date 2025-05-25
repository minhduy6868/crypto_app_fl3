import 'package:crypto_app/generated/translations.g.dart';
import 'package:crypto_app/screens/wallet_screen/wallet_cubit/wallet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:crypto_app/screens/bloc_base_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypto_app/shared_customization/widgets/buttons/app_button.dart';
import 'package:crypto_app/shared_customization/widgets/texts/app_text.dart';
import 'package:animate_do/animate_do.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:clipboard/clipboard.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:easy_localization/easy_localization.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = WalletCubit(isTestNet: true);
    return BlocBaseScreen<WalletCubit, WalletState>(
      cubitInstance: cubit,
      builder: (context, state) {
        return Theme(
          data: Theme.of(context).copyWith(
            scaffoldBackgroundColor: Colors.transparent,
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.indigo,
              elevation: 0,
              titleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              iconTheme: IconThemeData(color: Colors.white),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
                textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          child: Scaffold(
            body: Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.indigoAccent,
                    Colors.cyanAccent,
                    Colors.white,
                  ],
                ),
              ),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FadeInDown(
                          duration: const Duration(milliseconds: 600),
                          child: _buildWalletCard(context, state),
                        ),
                        const SizedBox(height: 24),
                        if (state.publicKey != null) ...[
                          FadeInUp(
                            delay: const Duration(milliseconds: 100),
                            duration: const Duration(milliseconds: 600),
                            child: _buildQuickActions(context),
                          ),
                          const SizedBox(height: 24),
                          FadeInUp(
                            delay: const Duration(milliseconds: 200),
                            duration: const Duration(milliseconds: 600),
                            child: _buildTransactionHistory(state),
                          ),
                        ],
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildWalletCard(BuildContext context, WalletState state) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      margin: EdgeInsets.zero,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.indigo, Colors.blueAccent],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.indigo.withOpacity(0.3),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (state.publicKey == null) ...[
                const Icon(Icons.account_balance_wallet, size: 64, color: Colors.white70),
                const SizedBox(height: 16),
                AppText(
                  tr(LocaleKeys.WalletScreen_NoWalletFound),
                  size: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                const SizedBox(height: 8),
                AppText(
                  tr(LocaleKeys.WalletScreen_CreateWalletPrompt),
                  size: 14,
                  color: Colors.white70,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => context.read<WalletCubit>().generateWallet(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.indigo,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 14),
                    elevation: 4,
                  ),
                  child: AppText(
                    tr(LocaleKeys.WalletScreen_CreateWallet),
                    size: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ] else ...[
                AppText(
                  tr(LocaleKeys.WalletScreen_TotalBalance),
                  size: 16,
                  color: Colors.white70,
                ),
                const SizedBox(height: 12),
                AppText(
                  state.balance != null
                      ? "${state.balance!.toStringAsFixed(4)} ETH"
                      : tr(LocaleKeys.WalletScreen_Loading),
                  size: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                const SizedBox(height: 12),
                AppText(
                  tr(LocaleKeys.WalletScreen_AvailableBalance),
                  size: 16,
                  color: Colors.white70,
                ),
                const SizedBox(height: 8),
                AppText(
                  state.availableBalance != null
                      ? "${state.availableBalance!.toStringAsFixed(4)} ETH"
                      : tr(LocaleKeys.WalletScreen_Loading),
                  size: 28,
                  fontWeight: FontWeight.w600,
                  color: Colors.white70,
                ),
                const SizedBox(height: 28),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: GestureDetector(
                        onTap: () {
                          FlutterClipboard.copy(state.publicKey!.hex);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(tr(LocaleKeys.WalletScreen_AddressCopied))),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.white30),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.account_balance_wallet, size: 18, color: Colors.white70),
                              const SizedBox(width: 8),
                              Flexible(
                                child: AppText(
                                  "${state.publicKey!.hex.substring(0, 6)}...${state.publicKey!.hex.substring(state.publicKey!.hex.length - 4)}",
                                  size: 14,
                                  color: Colors.white,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      icon: const Icon(Icons.qr_code, size: 28, color: Colors.white),
                      onPressed: () => _showAddressQR(context, state.publicKey!.hex),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildActionButton(
          context: context,
          label: tr(LocaleKeys.WalletScreen_Send),
          icon: Icons.arrow_upward_rounded,
          colors: [Colors.redAccent, Colors.red.shade400],
          onPressed: () => _showSendOptions(context),
        ),
        const SizedBox(width: 12),
        _buildActionButton(
          context: context,
          label: tr(LocaleKeys.WalletScreen_Receive),
          icon: Icons.arrow_downward_rounded,
          colors: [Colors.green, Colors.green.shade400],
          onPressed: () => _showReceiveOptions(context),
        ),
        const SizedBox(width: 12),
        _buildActionButton(
          context: context,
          label: tr(LocaleKeys.WalletScreen_Swap),
          icon: Icons.swap_horiz,
          colors: [Colors.amber, Colors.amber.shade400],
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildTransactionHistory(WalletState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          tr(LocaleKeys.WalletScreen_RecentTransactions),
          size: 22,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
        const SizedBox(height: 16),
        if (state.transactions == null)
          const Center(child: CircularProgressIndicator(color: Colors.indigo))
        else if (state.transactions!.isEmpty)
          _buildEmptyTransactionState()
        else
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.transactions!.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final tx = state.transactions![index];
              final isSent = (tx['from'] as String?)?.toLowerCase() == state.publicKey?.hex.toLowerCase();
              return _buildTransactionItem(context, tx, isSent, index);
            },
          ),
      ],
    );
  }

  Widget _buildEmptyTransactionState() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(Icons.hourglass_empty, size: 56, color: Colors.grey[400]),
          const SizedBox(height: 12),
          AppText(
            tr(LocaleKeys.WalletScreen_NoTransactionsYet),
            size: 16,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
          const SizedBox(height: 8),
          AppText(
            tr(LocaleKeys.WalletScreen_TransactionsPrompt),
            size: 14,
            color: Colors.grey,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionItem(
      BuildContext context, Map<String, dynamic> tx, bool isSent, int index) {
    final value = double.tryParse(tx['value']?.toString() ?? '0') ?? 0;
    final ethValue = value / 1e18;
    final usdValue = ethValue * 1800; // Assuming 1 ETH = 1800 USD

    String formattedDate = tr(LocaleKeys.WalletScreen_UnknownDate);
    if (tx['block_timestamp'] != null) {
      try {
        final dateString = tx['block_timestamp'] as String;
        formattedDate = dateString.length >= 10
            ? dateString.substring(0, 10)
            : DateTime.tryParse(dateString)?.toString().substring(0, 10) ??
            tr(LocaleKeys.WalletScreen_UnknownDate);
      } catch (e) {
        formattedDate = tr(LocaleKeys.WalletScreen_UnknownDate);
      }
    }

    final txHash = tx['hash'] as String? ?? '...';
    final shortHash = txHash.length > 8 ? '${txHash.substring(0, 8)}...' : txHash;

    return FadeInUp(
      duration: Duration(milliseconds: 400 + (index * 150)), // Tăng thời gian animation
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: isSent ? Colors.red[50] : Colors.green[50], // Nền khác nhau
            border: Border.all(
              color: isSent ? Colors.redAccent : Colors.green,
              width: 1.5, // Viền đậm hơn
            ),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            leading: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: isSent
                      ? [Colors.redAccent, Colors.red.shade300]
                      : [Colors.green, Colors.green.shade300],
                ),
                shape: BoxShape.circle,
              ),
              child: Icon(
                isSent ? Icons.north_east_rounded : Icons.south_west_rounded,
                color: Colors.white,
                size: 28,
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  isSent ? tr(LocaleKeys.WalletScreen_SentETH) : tr(LocaleKeys.WalletScreen_ReceivedETH),
                  size: 18, // Tăng kích thước nhãn
                  fontWeight: FontWeight.bold, // Đậm hơn
                  color: isSent ? Colors.redAccent : Colors.green,
                ),
                AppText(
                  "${ethValue.toStringAsFixed(4)} ETH",
                  size: 18,
                  fontWeight: FontWeight.bold,
                  color: isSent ? Colors.redAccent : Colors.green,
                ),
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                AppText(
                  "$formattedDate • $shortHash",
                  size: 12,
                  color: Colors.grey[600],
                ),
                const SizedBox(height: 4),
                AppText(
                  "\$${usdValue.toStringAsFixed(2)}",
                  size: 12,
                  color: Colors.grey[500],
                ),
              ],
            ),
            onTap: () {
              _showTransactionDetails(context, tx, isSent);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required BuildContext context,
    required String label,
    required IconData icon,
    required List<Color> colors,
    required VoidCallback onPressed,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          height: 100,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: colors,
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: colors.first.withOpacity(0.4),
                spreadRadius: 2,
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 32, color: Colors.white),
              const SizedBox(height: 8),
              AppText(
                label,
                size: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showWalletOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      backgroundColor: Colors.white,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.refresh, color: Colors.indigo),
                title: Text(tr(LocaleKeys.WalletScreen_RefreshBalance)),
                onTap: () {
                  context.read<WalletCubit>().getWalletBalance();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.visibility, color: Colors.indigo),
                title: Text(tr(LocaleKeys.WalletScreen_ViewPrivateKey)),
                onTap: () {
                  Navigator.pop(context);
                  _showPrivateKeyWarning(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.backup, color: Colors.indigo),
                title: Text(tr(LocaleKeys.WalletScreen_BackupWallet)),
                onTap: () {
                  Navigator.pop(context);
                  // Implement backup functionality
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings, color: Colors.indigo),
                title: Text(tr(LocaleKeys.WalletScreen_WalletSettings)),
                onTap: () {
                  Navigator.pop(context);
                  // Navigate to settings
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.close, color: Colors.red),
                title: Text(tr(LocaleKeys.WalletScreen_Close)),
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showSendOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      backgroundColor: Colors.white,
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppText(
                  tr(LocaleKeys.WalletScreen_SendEthereum),
                  size: 20,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 16),
                ListTile(
                  leading: const Icon(Icons.edit, color: Colors.indigo),
                  title: Text(tr(LocaleKeys.WalletScreen_EnterAddressManually)),
                  onTap: () {
                    Navigator.pop(context);
                    _showSendDialog(context, initialAddress: '');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.qr_code_scanner, color: Colors.indigo),
                  title: Text(tr(LocaleKeys.WalletScreen_ScanToReceive)),
                  onTap: () async {
                    Navigator.pop(context);
                    final scannedAddress = await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const QRScanScreen()),
                    );
                    if (scannedAddress != null) {
                      _showSendDialog(context, initialAddress: scannedAddress);
                    }
                  },
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    tr(LocaleKeys.WalletScreen_Cancel),
                    style: const TextStyle(fontSize: 16, color: Colors.red),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showReceiveOptions(BuildContext context) {
    final publicKey = context.read<WalletCubit>().state.publicKey?.hex ??
        tr(LocaleKeys.WalletScreen_NoAddressAvailable);

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      backgroundColor: Colors.white,
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppText(
                  tr(LocaleKeys.WalletScreen_Receive),
                  size: 20,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () => _showAddressQR(context, publicKey),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        QrImageView(
                          data: publicKey,
                          version: QrVersions.auto,
                          size: 160,
                          backgroundColor: Colors.white,
                        ),
                        const SizedBox(height: 16),
                        AppText(
                          tr(LocaleKeys.WalletScreen_ScanToReceive),
                          size: 16,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                ListTile(
                  leading: const Icon(Icons.content_copy, color: Colors.indigo),
                  title: Text(tr(LocaleKeys.WalletScreen_Copy)),
                  onTap: () {
                    FlutterClipboard.copy(publicKey);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(tr(LocaleKeys.WalletScreen_AddressCopied))),
                    );
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    tr(LocaleKeys.WalletScreen_Close),
                    style: const TextStyle(fontSize: 16, color: Colors.red),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showAddressQR(BuildContext context, String address) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppText(
                  tr(LocaleKeys.WalletScreen_MyWalletAddress),
                  size: 20,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: QrImageView(
                    data: address,
                    version: QrVersions.auto,
                    size: 220,
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.all(12),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: AppText(
                          address,
                          size: 14,
                          fontWeight: FontWeight.w500,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.content_copy, size: 22),
                        onPressed: () {
                          FlutterClipboard.copy(address);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(tr(LocaleKeys.WalletScreen_AddressCopied))),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(tr(LocaleKeys.WalletScreen_Close)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showSendDialog(BuildContext context, {required String initialAddress}) {
    final _amountController = TextEditingController();
    final _addressController = TextEditingController(text: initialAddress);
    final cubit = context.read<WalletCubit>();

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  tr(LocaleKeys.WalletScreen_SendEthereum),
                  size: 20,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _addressController,
                  decoration: InputDecoration(
                    labelText: tr(LocaleKeys.WalletScreen_RecipientAddress),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    prefixIcon: const Icon(Icons.account_circle, color: Colors.indigo),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.qr_code_scanner, color: Colors.indigo),
                      onPressed: () async {
                        final scannedAddress = await Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const QRScanScreen()),
                        );
                        if (scannedAddress != null) {
                          _addressController.text = scannedAddress;
                        }
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _amountController,
                  decoration: InputDecoration(
                    labelText: tr(LocaleKeys.WalletScreen_AmountETH),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    prefixIcon: const Icon(Icons.attach_money, color: Colors.indigo),
                  ),
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                ),
                const SizedBox(height: 8),
                BlocBuilder<WalletCubit, WalletState>(
                  builder: (context, state) {
                    return GestureDetector(
                      onTap: () {
                        if (state.balance != null) {
                          _amountController.text = state.balance!.toStringAsFixed(4);
                        }
                      },
                      child: AppText(
                        state.balance != null
                            ? "Balance: ${state.balance!.toStringAsFixed(4)} ETH"
                            : "Balance: Loading...",
                        size: 14,
                        color: Colors.indigo,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 24),
                BlocBuilder<WalletCubit, WalletState>(
                  builder: (context, state) {
                    return Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => Navigator.pop(context),
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              side: const BorderSide(color: Colors.red),
                            ),
                            child: Text(
                              tr(LocaleKeys.WalletScreen_Cancel),
                              style: const TextStyle(color: Colors.red),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              final amountText = _amountController.text.trim();
                              final address = _addressController.text.trim();

                              final amount = double.tryParse(amountText);
                              if (amount == null || amount <= 0 || amount.isNaN) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(tr(LocaleKeys.WalletScreen_InvalidAmount))),
                                );
                                return;
                              }

                              if (cubit.state.balance != null && amount > cubit.state.balance!) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(tr(LocaleKeys.WalletScreen_InsufficientBalance))),
                                );
                                return;
                              }

                              if (address.isEmpty ||
                                  !address.startsWith('0x') ||
                                  address.length != 42 ||
                                  !RegExp(r'^0x[a-fA-F0-9]{40}$').hasMatch(address)) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(tr(LocaleKeys.WalletScreen_InvalidAddress))),
                                );
                                return;
                              }

                              cubit.sendTransaction(address, amount);
                              Navigator.pop(context);
                            },
                            child: Text(tr(LocaleKeys.WalletScreen_SendEthereum)),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showPrivateKeyWarning(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Text(tr(LocaleKeys.WalletScreen_Warning)),
          content: Text(
            tr(LocaleKeys.WalletScreen_PrivateKeyWarning),
            style: const TextStyle(color: Colors.red),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(tr(LocaleKeys.WalletScreen_Cancel), style: const TextStyle(color: Colors.red)),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _showPrivateKey(context);
              },
              child: Text(tr(LocaleKeys.WalletScreen_IUnderstand), style: const TextStyle(color: Colors.indigo)),
            ),
          ],
        );
      },
    );
  }

  void _showPrivateKey(BuildContext context) {
    final privateKey = context.read<WalletCubit>().state.privateKey ??
        tr(LocaleKeys.WalletScreen_NoPrivateKeyAvailable);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Text(tr(LocaleKeys.WalletScreen_YourPrivateKey)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                tr(LocaleKeys.WalletScreen_PrivateKeyWarning),
                style: const TextStyle(color: Colors.red),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SelectableText(
                  privateKey,
                  style: const TextStyle(fontFamily: 'monospace', fontSize: 14),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                FlutterClipboard.copy(privateKey);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(tr(LocaleKeys.WalletScreen_PrivateKeyCopied))),
                );
              },
              child: Text(tr(LocaleKeys.WalletScreen_Copy), style: const TextStyle(color: Colors.indigo)),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(tr(LocaleKeys.WalletScreen_Close), style: const TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  void _showTransactionDetails(BuildContext context, Map<String, dynamic> tx, bool isSent) {
    final value = double.tryParse(tx['value']?.toString() ?? '0') ?? 0;
    final ethValue = value / 1e18;
    final usdValue = ethValue * 1800;
    final txHash = tx['hash'] as String? ?? '...';
    final fromAddress = tx['from'] as String? ?? '...';
    final toAddress = tx['to'] as String? ?? '...';
    final blockTimestamp = tx['block_timestamp'] as String? ?? tr(LocaleKeys.WalletScreen_UnknownDate);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Text(
            isSent ? tr(LocaleKeys.WalletScreen_SentETH) : tr(LocaleKeys.WalletScreen_ReceivedETH),
            style: TextStyle(color: isSent ? Colors.redAccent : Colors.green),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDetailRow('Amount', "${ethValue.toStringAsFixed(4)} ETH"),
                _buildDetailRow('USD Value', "\$${usdValue.toStringAsFixed(2)}"),
                _buildDetailRow('Transaction Hash', txHash, isCopyable: true, context: context),
                _buildDetailRow('From', fromAddress, isCopyable: true, context: context),
                _buildDetailRow('To', toAddress, isCopyable: true, context: context),
                _buildDetailRow('Date', blockTimestamp),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(tr(LocaleKeys.WalletScreen_Close), style: const TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  Widget _buildDetailRow(String label, String value, {bool isCopyable = false, BuildContext? context}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: AppText(
              label,
              size: 14,
              fontWeight: FontWeight.w600,
              color: Colors.grey[700],
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  child: AppText(
                    value,
                    size: 14,
                    color: Colors.black87,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (isCopyable && context != null)
                  IconButton(
                    icon: const Icon(Icons.content_copy, size: 18, color: Colors.indigo),
                    onPressed: () {
                      FlutterClipboard.copy(value);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('$label copied')),
                      );
                    },
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class QRScanScreen extends StatefulWidget {
  const QRScanScreen({super.key});

  @override
  QRScanScreenState createState() => QRScanScreenState();
}

class QRScanScreenState extends State<QRScanScreen> {
  MobileScannerController controller = MobileScannerController(
    detectionSpeed: DetectionSpeed.normal,
    facing: CameraFacing.back,
    torchEnabled: false,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr(LocaleKeys.WalletScreen_ScanToReceive)),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          MobileScanner(
            controller: controller,
            onDetect: (BarcodeCapture capture) {
              final String? code = capture.barcodes.first.rawValue;
              if (code != null && code.startsWith('0x')) {
                controller.stop();
                Navigator.pop(context, code);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(tr(LocaleKeys.WalletScreen_InvalidAddress))),
                );
              }
            },
          ),
          Positioned(
            bottom: 24,
            left: 24,
            right: 24,
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: AppText(
                tr(LocaleKeys.WalletScreen_Cancel),
                size: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}