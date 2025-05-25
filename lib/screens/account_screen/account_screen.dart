import 'dart:io';
import 'package:crypto_app/generated/translations.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
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
            return Scaffold(
              body: Center(
                child: LoadingAnimationWidget.flickr(
                  leftDotColor: Colors.greenAccent,
                  rightDotColor: Colors.white,
                  size: 40,
                ),
              ),
            );
          }

          if (state.errorMessage != null) {
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error_outline, size: 50, color: Colors.blue.shade400),
                    const SizedBox(height: 12),
                    Text(
                      "Error: ${state.errorMessage}",
                      style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          }

          return Scaffold(
            body: SafeArea(
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.white,
                          Colors.cyan,
                          Colors.white,
                          Colors.white,
                        ],
                      ),
                    ),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: MediaQuery.of(context).size.height -
                              MediaQuery.of(context).padding.top,
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 16),
                            _buildProfileHeader(context, state),
                            const SizedBox(height: 24),
                            _buildMenuSection(context),
                            const SizedBox(height: 120),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -10, // Shifted slightly upward
                    right: -10,
                    child: Transform.rotate(
                      angle: -0.4,
                      child: Image.asset(
                        'assets/images/robotcoin.png',
                        width: 150, // Increased size
                        height: 150, // Increased size
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context, AccountScreenState state) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              GestureDetector(
                onTap: () => context.read<AccountScreenCubit>().pickAndUpdateAvatar(),
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: state.profileImageUrl != null && state.profileImageUrl!.isNotEmpty
                      ? (state.profileImageUrl!.startsWith('http')
                      ? NetworkImage(state.profileImageUrl!)
                      : FileImage(File(state.profileImageUrl!))) as ImageProvider<Object>
                      : const AssetImage('assets/images/user_avatar.png'),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () => context.read<AccountScreenCubit>().pickAndUpdateAvatar(),
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.greenAccent,
                    ),
                    child: const Icon(Icons.camera_alt, color: Colors.white, size: 16),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${state.firstName ?? ''} ${state.lastName ?? ''}".trim(),
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () => _showEditNameDialog(context, state.firstName ?? '', state.lastName ?? ''),
                child: const Icon(Icons.edit, size: 18, color: Colors.greenAccent),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            state.email ?? '',
            style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          _buildMenuCard(
            context,
            icon: Icons.security,
            title: _getTranslation(context, LocaleKeys.AccountScreen_Security),
            onTap: () => _showSecurityOptions(context),
            iconColor: Colors.greenAccent,
          ),
          const SizedBox(height: 12),
          _buildMenuCard(
            context,
            icon: Icons.settings,
            title: tr(LocaleKeys.CommonData_Setting),
            onTap: () => Navigator.pushNamed(context, Routes.settingScreen),
            iconColor: Colors.blueAccent,
          ),
          const SizedBox(height: 12),
          _buildMenuCard(
            context,
            icon: Icons.logout,
            title: tr(LocaleKeys.CommonAction_Logout),
            onTap: () async {
              await context.read<AccountScreenCubit>().logout();
              Navigator.popAndPushNamed(context, Routes.loginScreen);
            },
            iconColor: Colors.redAccent,
            isDestructive: true,
          ),
        ],
      ),
    );
  }

  Widget _buildMenuCard(
      BuildContext context, {
        required IconData icon,
        required String title,
        required VoidCallback onTap,
        required Color iconColor,
        bool isDestructive = false,
      }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: iconColor.withOpacity(0.2),
              ),
              child: Icon(icon, color: iconColor, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: isDestructive ? Colors.redAccent : Colors.black87,
                ),
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey.shade400),
          ],
        ),
      ),
    );
  }

  String _getTranslation(BuildContext context, String key) {
    try {
      return tr(key);
    } catch (e) {
      switch (key) {
        case LocaleKeys.AccountScreen_Security:
          return "Security";
        case LocaleKeys.AccountScreen_SecurityOptions:
          return "Security Options";
        case LocaleKeys.AccountScreen_ChangePassword:
          return "Change Password";
        case LocaleKeys.AccountScreen_ResetPasswordViaEmail:
          return "Reset Password via Email";
        case LocaleKeys.AccountScreen_DeleteAccount:
          return "Delete Account";
        case LocaleKeys.AccountScreen_EditName:
          return "Edit Name";
        case LocaleKeys.AccountScreen_FirstName:
          return "First Name";
        case LocaleKeys.AccountScreen_LastName:
          return "Last Name";
        case LocaleKeys.AccountScreen_Save:
          return "Save";
        case LocaleKeys.AccountScreen_EnterNewPassword:
          return "Enter new password";
        default:
          return key;
      }
    }
  }

  void _showSecurityOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.white.withOpacity(0.95),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                _getTranslation(context, LocaleKeys.AccountScreen_SecurityOptions),
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              _buildSecurityOption(
                context,
                icon: Icons.lock_outline,
                title: _getTranslation(context, LocaleKeys.AccountScreen_ChangePassword),
                onTap: () {
                  Navigator.pop(context);
                  _showChangePasswordDialog(context);
                },
                iconColor: Colors.greenAccent,
              ),
              _buildSecurityOption(
                context,
                icon: Icons.email_outlined,
                title: _getTranslation(context, LocaleKeys.AccountScreen_ResetPasswordViaEmail),
                onTap: () async {
                  Navigator.pop(context);
                  await context.read<AccountScreenCubit>().resetPassword();
                },
                iconColor: Colors.blueAccent,
              ),
              _buildSecurityOption(
                context,
                icon: Icons.delete_forever_outlined,
                title: _getTranslation(context, LocaleKeys.AccountScreen_DeleteAccount),
                onTap: () {
                  Navigator.pop(context);
                  _showDeleteAccountConfirmation(context);
                },
                iconColor: Colors.redAccent,
                isDestructive: true,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSecurityOption(
      BuildContext context, {
        required IconData icon,
        required String title,
        required VoidCallback onTap,
        required Color iconColor,
        bool isDestructive = false,
      }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: iconColor.withOpacity(0.2),
        ),
        child: Icon(icon, color: iconColor, size: 20),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: isDestructive ? Colors.redAccent : Colors.black87,
        ),
      ),
      trailing: Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey.shade400),
      onTap: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    );
  }

  void _showDeleteAccountConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Row(
            children: [
              Icon(Icons.warning, color: Colors.redAccent, size: 24),
              const SizedBox(width: 8),
              const Text("Confirm Delete", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
          content: const Text(
            "Are you sure you want to delete your account? This action cannot be undone.",
            style: TextStyle(fontSize: 14),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel", style: TextStyle(color: Colors.grey.shade600)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              onPressed: () async {
                Navigator.pop(context);
                await context.read<AccountScreenCubit>().deleteAccount();
              },
              child: Text(
                _getTranslation(context, LocaleKeys.AccountScreen_DeleteAccount),
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showChangePasswordDialog(BuildContext context) {
    final TextEditingController passwordController = TextEditingController();
    bool obscureText = true;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              title: Row(
                children: [
                  Icon(Icons.lock_outline, color: Colors.greenAccent, size: 24),
                  const SizedBox(width: 8),
                  Text(
                    _getTranslation(context, LocaleKeys.AccountScreen_ChangePassword),
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              content: TextField(
                controller: passwordController,
                obscureText: obscureText,
                decoration: InputDecoration(
                  hintText: _getTranslation(context, LocaleKeys.AccountScreen_EnterNewPassword),
                  prefixIcon: Icon(Icons.lock_outline, color: Colors.greenAccent),
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscureText ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey.shade600,
                    ),
                    onPressed: () => setState(() => obscureText = !obscureText),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancel", style: TextStyle(color: Colors.grey.shade600)),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  onPressed: () async {
                    final newPassword = passwordController.text.trim();
                    if (newPassword.isNotEmpty) {
                      await context.read<AccountScreenCubit>().changePassword(newPassword);
                    }
                    Navigator.pop(context);
                  },
                  child: Text(
                    _getTranslation(context, LocaleKeys.AccountScreen_Save),
                    style: const TextStyle(color: Colors.black87),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showEditNameDialog(BuildContext context, String currentFirstName, String currentLastName) {
    final TextEditingController firstNameController = TextEditingController(text: currentFirstName);
    final TextEditingController lastNameController = TextEditingController(text: currentLastName);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Row(
            children: [
              Icon(Icons.person_outline, color: Colors.greenAccent, size: 24),
              const SizedBox(width: 8),
              Text(
                _getTranslation(context, LocaleKeys.AccountScreen_EditName),
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: firstNameController,
                decoration: InputDecoration(
                  labelText: _getTranslation(context, LocaleKeys.AccountScreen_FirstName),
                  prefixIcon: Icon(Icons.person_outline, color: Colors.greenAccent),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: lastNameController,
                decoration: InputDecoration(
                  labelText: _getTranslation(context, LocaleKeys.AccountScreen_LastName),
                  prefixIcon: Icon(Icons.person_outline, color: Colors.greenAccent),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel", style: TextStyle(color: Colors.grey.shade600)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              onPressed: () async {
                final newFirstName = firstNameController.text.trim();
                final newLastName = lastNameController.text.trim();
                if (newFirstName.isNotEmpty && newLastName.isNotEmpty) {
                  await context.read<AccountScreenCubit>().updateUserName(newFirstName, newLastName);
                }
                Navigator.pop(context);
              },
              child: Text(
                _getTranslation(context, LocaleKeys.AccountScreen_Save),
                style: const TextStyle(color: Colors.black87),
              ),
            ),
          ],
        );
      },
    );
  }
}