import 'package:crypto_app/screens/wallet_screen/wallet_cubit/wallet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:crypto_app/screens/bloc_base_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypto_app/shared_customization/widgets/buttons/app_button.dart';
import 'package:crypto_app/shared_customization/widgets/texts/app_text.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = WalletCubit();
    return BlocBaseScreen<WalletCubit, WalletState>(
      cubitInstance: cubit,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: AppText("Ví của bạn"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                if (state.publicKey == null) ...[
                  AppButton(
                    onPressed: () => context.read<WalletCubit>().generateWallet(),
                    child: AppText("Tạo ví mới"),
                  ),
                ] else ...[
                  const Icon(Icons.account_balance_wallet, size: 80, color: Colors.blue),
                  const SizedBox(height: 20),
                  AppText(
                    "Số dư:",
                    size: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  AppText(
                    state.balance != null ? "${state.balance} ETH" : "Đang tải...",
                    size: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                  const SizedBox(height: 30),
                  AppButton(
                    onPressed: () => context.read<WalletCubit>().getWalletBalance(),
                    child: AppText("Làm mới số dư"),
                  ),
                  const SizedBox(height: 20),
                  AppButton(
                    onPressed: () => _showSendDialog(context),
                    child: AppText("Gửi ETH"),
                  ),
                  const SizedBox(height: 20),
                  AppButton(
                    onPressed: () => _showReceiveDialog(context),
                    child: AppText("Nhận ETH"),
                  ),
                  const SizedBox(height: 20),
                  AppButton(
                    onPressed: () => context.read<WalletCubit>().getTransactionHistory(),
                    child: AppText("Lịch sử giao dịch"),
                  ),
                  const SizedBox(height: 20),
                  if (state.transactions != null) ...[
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.transactions!.length,
                        itemBuilder: (context, index) {
                          final tx = state.transactions![index];
                          return ListTile(
                            title: AppText("Giao dịch #${index + 1}"),
                            subtitle: AppText("Hash: ${tx['hash']}"),
                          );
                        },
                      ),
                    ),
                  ],
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  void _showSendDialog(BuildContext context) {
    final _amountController = TextEditingController();
    final _addressController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: AppText("Gửi ETH"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _addressController,
                decoration: InputDecoration(labelText: "Địa chỉ nhận"),
              ),
              TextField(
                controller: _amountController,
                decoration: InputDecoration(labelText: "Số lượng ETH"),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: AppText("Hủy"),
            ),
            TextButton(
              onPressed: () {
                final amount = double.tryParse(_amountController.text);
                final address = _addressController.text;
                if (amount != null && address.isNotEmpty) {
                  context.read<WalletCubit>().sendTransaction(address, amount);
                  Navigator.pop(context);
                }
              },
              child: AppText("Gửi"),
            ),
          ],
        );
      },
    );
  }

  void _showReceiveDialog(BuildContext context) {
    final publicKey = context.read<WalletCubit>().state.publicKey?.hex ?? "Không có địa chỉ";

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: AppText("Nhận ETH"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppText("Địa chỉ ví của bạn:"),
              AppText(publicKey, fontWeight: FontWeight.bold),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: AppText("Đóng"),
            ),
          ],
        );
      },
    );
  }
}