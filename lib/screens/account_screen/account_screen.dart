import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../app_common_data/routes/app_routes.dart';
import '../../services/service_repositories/authentication_reponsitiory_firebase.dart';
import 'cubit/account_screen_cubit.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AccountScreenCubit(AuthenticationRepositoryFirebase())..getUserInfo(),
      child: BlocBuilder<AccountScreenCubit, AccountScreenState>(
        builder: (context, state) {
          if (state.isLoading == true) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.errorMessage != null) {
            return Center(child: Text("Error: ${state.errorMessage}"));
          }

          return Scaffold(
            backgroundColor: Colors.grey[100],
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Avatar và thông tin người dùng
                  GestureDetector(
                    onTap: () {
                      context.read<AccountScreenCubit>().pickAndUpdateAvatar();
                    },
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: state.profileImageUrl != null && state.profileImageUrl!.isNotEmpty
                          ? (state.profileImageUrl!.startsWith('http')
                          ? NetworkImage(state.profileImageUrl!) as ImageProvider<Object>
                          : FileImage(File(state.profileImageUrl!)) as ImageProvider<Object>)
                          : const AssetImage('assets/images/user_avatar.png') as ImageProvider<Object>,
                    ),
                  ),

                  const SizedBox(height: 12),
                  // Hiển thị họ tên và nút chỉnh sửa
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${state.firstName ?? ''} ${state.lastName ?? ''}",
                        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: const Icon(Icons.edit, size: 20),
                        onPressed: () {
                          _showEditNameDialog(context, state.firstName ?? '', state.lastName ?? '');
                        },
                      ),
                    ],
                  ),
                  Text(
                    state.email ?? '',
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 24),

                  // Các nút Cài đặt, Bảo mật và Đăng xuất
                  ListTile(
                    leading: const Icon(Icons.security),
                    title: const Text("Security"),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      _showSecurityOptions(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.logout, color: Colors.red),
                    title: const Text("Logout", style: TextStyle(color: Colors.red)),
                    onTap: () async {
                      await context.read<AccountScreenCubit>().logout();
                      Navigator.popAndPushNamed(context, Routes.loginScreen);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // Hiển thị các tùy chọn bảo mật
  void _showSecurityOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Security Options",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ListTile(
                leading: const Icon(Icons.lock_open),
                title: const Text("Change Password"),
                onTap: () {
                  Navigator.pop(context);
                  _showChangePasswordDialog(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.refresh),
                title: const Text("Reset Password via Email"),
                onTap: () async {
                  Navigator.pop(context);
                  await context.read<AccountScreenCubit>().resetPassword();
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete_forever, color: Colors.red),
                title: const Text("Delete Account", style: TextStyle(color: Colors.red)),
                onTap: () async {
                  Navigator.pop(context);
                  await context.read<AccountScreenCubit>().deleteAccount();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // Hiển thị hộp thoại đổi mật khẩu
  void _showChangePasswordDialog(BuildContext context) {
    final TextEditingController passwordController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Change Password"),
          content: TextField(
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration(hintText: "Enter new password"),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () async {
                final newPassword = passwordController.text.trim();
                if (newPassword.isNotEmpty) {
                  await context.read<AccountScreenCubit>().changePassword(newPassword);
                }
                Navigator.pop(context);
              },
              child: const Text("Update"),
            ),
          ],
        );
      },
    );
  }

  // Hiển thị hộp thoại chỉnh sửa họ tên
  void _showEditNameDialog(BuildContext context, String currentFirstName, String currentLastName) {
    final TextEditingController firstNameController = TextEditingController(text: currentFirstName);
    final TextEditingController lastNameController = TextEditingController(text: currentLastName);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Edit Name"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: firstNameController,
                decoration: const InputDecoration(labelText: "First Name"),
              ),
              TextField(
                controller: lastNameController,
                decoration: const InputDecoration(labelText: "Last Name"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () async {
                final newFirstName = firstNameController.text.trim();
                final newLastName = lastNameController.text.trim();
                if (newFirstName.isNotEmpty && newLastName.isNotEmpty) {
                  await context.read<AccountScreenCubit>().updateUserName(newFirstName, newLastName);
                }
                Navigator.pop(context);
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }
}
