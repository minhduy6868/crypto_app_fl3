import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_app/generated/translations.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../app_common_data/routes/app_routes.dart';
import '../../services/service_repositories/authentication_reponsitiory_firebase.dart';
import '../user_transactions_screen/UserTransactionsScreen.dart';
import 'cubit/admin_management_screen_cubit.dart';

class AdminManagementScreen extends StatelessWidget {
  const AdminManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AdminManagementScreenCubit(AuthenticationRepositoryFirebase())..getAdminInfo(),
      child: BlocBuilder<AdminManagementScreenCubit, AdminManagementScreenState>(
        builder: (context, state) {
          if (state.isLoading == true) {
            return Scaffold(
              body: Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                  color: Colors.greenAccent.shade700,
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
                    Icon(Icons.error_outline, size: 50, color: Colors.red.shade400),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        "Error: ${state.errorMessage}",
                        style: TextStyle(fontSize: 16, color: Colors.grey.shade700, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _CustomButton(
                      text: "Retry",
                      onPressed: () => context.read<AdminManagementScreenCubit>().getAdminInfo(),
                    ),
                  ],
                ),
              ),
            );
          }

          return DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                title: const Text(
                  'Admin Dashboard',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20, color: Colors.white),
                ),
                backgroundColor: Colors.indigo.shade800,
                elevation: 0,
                bottom: TabBar(
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.white.withOpacity(0.7),
                  indicatorColor: Colors.greenAccent.shade700,
                  indicatorWeight: 3,
                  labelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                  tabs: const [
                    Tab(text: 'Users'),
                    Tab(text: 'Transactions'),
                  ],
                ),
              ),
              body: SafeArea(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.indigo.shade50,
                        Colors.white,
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 12),
                      _buildProfileHeader(context, state),
                      const SizedBox(height: 12),
                      Expanded(
                        child: TabBarView(
                          children: [
                            _buildUserManagementTab(context),
                            _buildTransactionManagementTab(context),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () => context.read<AdminManagementScreenCubit>().getAdminInfo(),
                backgroundColor: Colors.greenAccent.shade700,
                child: const Icon(Icons.refresh, color: Colors.black87),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context, AdminManagementScreenState state) {
    final TextEditingController gasPriceController = TextEditingController();
    final ValueNotifier<String?> gasPriceError = ValueNotifier<String?>(null);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => context.read<AdminManagementScreenCubit>().pickAndUpdateAvatar(),
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 32,
                          backgroundImage: state.profileImageUrl != null && state.profileImageUrl!.isNotEmpty
                              ? (state.profileImageUrl!.startsWith('http')
                              ? NetworkImage(state.profileImageUrl!)
                              : FileImage(File(state.profileImageUrl!))) as ImageProvider<Object>
                              : const AssetImage('assets/images/user_avatar.png'),
                          backgroundColor: Colors.grey.shade200,
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.greenAccent.shade700,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                            child: const Icon(Icons.camera_alt, color: Colors.black87, size: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () => _showEditNameDialog(context, state.firstName ?? '', state.lastName ?? ''),
                          child: Row(
                            children: [
                              Text(
                                "${state.firstName ?? ''} ${state.lastName ?? ''}".trim(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Icon(Icons.edit, size: 18, color: Colors.greenAccent.shade700),
                            ],
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          state.email ?? '',
                          style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.indigo.shade100,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            'Admin',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.indigo,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      IconButton(
                        icon: Icon(Icons.security, color: Colors.greenAccent.shade700, size: 28),
                        onPressed: () => _showSecurityOptions(context),
                      ),
                      IconButton(
                        icon: Icon(Icons.logout, color: Colors.red.shade400, size: 28),
                        onPressed: () async {
                          await context.read<AdminManagementScreenCubit>().logout();
                          Navigator.popAndPushNamed(context, Routes.loginScreen);
                        },
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ValueListenableBuilder<String?>(
                valueListenable: gasPriceError,
                builder: (context, error, _) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: gasPriceController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Gas Price (1-100 Gwei)',
                              labelStyle: TextStyle(color: Colors.grey.shade600),
                              prefixIcon: Icon(Icons.local_gas_station, color: Colors.greenAccent.shade700),
                              filled: true,
                              fillColor: Colors.grey.shade100,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                              errorText: error,
                              errorStyle: TextStyle(color: Colors.red.shade400),
                            ),
                            onChanged: (_) => gasPriceError.value = null,
                          ),
                        ),
                        const SizedBox(width: 12),
                        _CustomButton(
                          text: 'Set',
                          onPressed: () {
                            final gasPrice = double.tryParse(gasPriceController.text.trim());
                            if (gasPrice == null || gasPrice < 1 || gasPrice > 100) {
                              gasPriceError.value = 'Enter a value between 1 and 100 Gwei';
                              return;
                            }
                            context.read<AdminManagementScreenCubit>().setGasPrice(gasPrice);
                            gasPriceController.clear();
                            gasPriceError.value = null;
                          },
                        ),
                      ],
                    ),
                    if (state.currentGasPrice != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          'Current Gas Price: ${state.currentGasPrice} Gwei',
                          style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserManagementTab(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('users').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator(color: Colors.greenAccent));
        }
        if (snapshot.hasError) {
          return Center(
            child: Text(
              'Error: ${snapshot.error}',
              style: TextStyle(color: Colors.red.shade400, fontSize: 16),
            ),
          );
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(
            child: Text(
              'No users found.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          );
        }
        final users = snapshot.data!.docs;
        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index].data() as Map<String, dynamic>;
            final userId = users[index].id;
            return UserCard(
              user: user,
              userId: userId,
              onDelete: () async {
                final confirm = await showDialog<bool>(
                  context: context,
                  builder: (context) => _CustomAlertDialog(
                    title: 'Delete Account',
                    content: 'Are you sure you want to delete ${user['email']}?',
                    confirmText: 'Delete',
                    onConfirm: () => Navigator.pop(context, true),
                    onCancel: () => Navigator.pop(context, false),
                  ),
                );
                if (confirm == true) {
                  try {
                    await context.read<AdminManagementScreenCubit>().deleteUserAccount(userId);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Deleted ${user['email']}'),
                        backgroundColor: Colors.greenAccent.shade700,
                      ),
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Error: $e'),
                        backgroundColor: Colors.red.shade400,
                      ),
                    );
                  }
                }
              },
            );
          },
        );
      },
    );
  }

  Widget _buildTransactionManagementTab(BuildContext context) {
    return _TransactionFilterTab(authRepo: AuthenticationRepositoryFirebase());
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
      backgroundColor: Colors.white,
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
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
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
                iconColor: Colors.greenAccent.shade700,
              ),
              _buildSecurityOption(
                context,
                icon: Icons.email_outlined,
                title: _getTranslation(context, LocaleKeys.AccountScreen_ResetPasswordViaEmail),
                onTap: () async {
                  Navigator.pop(context);
                  await context.read<AdminManagementScreenCubit>().resetPassword();
                },
                iconColor: Colors.blueAccent,
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
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: iconColor.withOpacity(0.15),
        ),
        child: Icon(icon, color: iconColor, size: 24),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: isDestructive ? Colors.red.shade400 : Colors.black87,
        ),
      ),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey.shade400),
      onTap: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
            return _CustomAlertDialog(
              title: _getTranslation(context, LocaleKeys.AccountScreen_ChangePassword),
              contentWidget: TextField(
                controller: passwordController,
                obscureText: obscureText,
                decoration: InputDecoration(
                  hintText: _getTranslation(context, LocaleKeys.AccountScreen_EnterNewPassword),
                  prefixIcon: Icon(Icons.lock_outline, color: Colors.greenAccent.shade700),
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
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              confirmText: _getTranslation(context, LocaleKeys.AccountScreen_Save),
              onConfirm: () async {
                final newPassword = passwordController.text.trim();
                if (newPassword.isNotEmpty) {
                  await context.read<AdminManagementScreenCubit>().changePassword(newPassword);
                }
                Navigator.pop(context);
              },
              onCancel: () => Navigator.pop(context),
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
        return _CustomAlertDialog(
          title: _getTranslation(context, LocaleKeys.AccountScreen_EditName),
          contentWidget: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: firstNameController,
                decoration: InputDecoration(
                  labelText: _getTranslation(context, LocaleKeys.AccountScreen_FirstName),
                  prefixIcon: Icon(Icons.person_outline, color: Colors.greenAccent.shade700),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: lastNameController,
                decoration: InputDecoration(
                  labelText: _getTranslation(context, LocaleKeys.AccountScreen_LastName),
                  prefixIcon: Icon(Icons.person_outline, color: Colors.greenAccent.shade700),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ],
          ),
          confirmText: _getTranslation(context, LocaleKeys.AccountScreen_Save),
          onConfirm: () async {
            final newFirstName = firstNameController.text.trim();
            final newLastName = lastNameController.text.trim();
            if (newFirstName.isNotEmpty && newLastName.isNotEmpty) {
              await context.read<AdminManagementScreenCubit>().updateUserName(newFirstName, newLastName);
            }
            Navigator.pop(context);
          },
          onCancel: () => Navigator.pop(context),
        );
      },
    );
  }
}

class _CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const _CustomButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.greenAccent.shade700,
        foregroundColor: Colors.black87,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }
}

class _CustomAlertDialog extends StatelessWidget {
  final String title;
  final String? content;
  final Widget? contentWidget;
  final String confirmText;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const _CustomAlertDialog({
    required this.title,
    this.content,
    this.contentWidget,
    required this.confirmText,
    required this.onConfirm,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Row(
        children: [
          Icon(Icons.info_outline, color: Colors.greenAccent.shade700, size: 24),
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
        ],
      ),
      content: content != null
          ? Text(content!, style: TextStyle(color: Colors.grey.shade700))
          : contentWidget,
      actions: [
        TextButton(
          onPressed: onCancel,
          child: Text("Cancel", style: TextStyle(color: Colors.grey.shade600)),
        ),
        TextButton(
          onPressed: onConfirm,
          child: Text(
            confirmText,
            style: TextStyle(color: Colors.red.shade400),
          ),
        ),
      ],
    );
  }
}

class UserCard extends StatefulWidget {
  final Map<String, dynamic> user;
  final String userId;
  final VoidCallback onDelete;

  const UserCard({
    Key? key,
    required this.user,
    required this.userId,
    required this.onDelete,
  }) : super(key: key);

  @override
  _UserCardState createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _controller.forward(),
      onTapUp: (_) {
        _controller.reverse();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserTransactionsScreen(
              userId: widget.userId,
              userName: '${widget.user['firstName'] ?? ''} ${widget.user['lastName'] ?? ''}'.trim(),
              userEmail: widget.user['email'] ?? 'No email',
            ),
          ),
        );
      },
      onTapCancel: () => _controller.reverse(),
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Card(
          elevation: 4,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(16),
            leading: CircleAvatar(
              radius: 26,
              backgroundImage: widget.user['profileImageUrl'] != null && widget.user['profileImageUrl'].isNotEmpty
                  ? NetworkImage(widget.user['profileImageUrl'])
                  : const AssetImage('assets/images/user_avatar.png') as ImageProvider,
              backgroundColor: Colors.grey.shade200,
            ),
            title: Text(
              '${widget.user['firstName'] ?? ''} ${widget.user['lastName'] ?? ''}'.trim(),
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
            subtitle: Text(
              widget.user['email'] ?? 'No email',
              style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete, color: Colors.red.shade400),
              onPressed: widget.onDelete,
            ),
          ),
        ),
      ),
    );
  }
}

class TransactionCard extends StatefulWidget {
  final String txId;
  final AuthenticationRepositoryFirebase authRepo;

  const TransactionCard({
    Key? key,
    required this.txId,
    required this.authRepo,
  }) : super(key: key);

  @override
  _TransactionCardState createState() => _TransactionCardState();
}

class _TransactionCardState extends State<TransactionCard> {
  Map<String, dynamic>? txData;
  bool isLoading = false;
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance.collection('transactions').doc(widget.txId).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator(color: Colors.greenAccent));
        }
        if (snapshot.hasError) {
          return Card(
            elevation: 6,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Error: ${snapshot.error}',
                style: TextStyle(color: Colors.red.shade400),
              ),
            ),
          );
        }
        if (!snapshot.hasData || !snapshot.data!.exists) {
          return const SizedBox.shrink();
        }

        txData = snapshot.data!.data() as Map<String, dynamic>;
        final bool hasWarning = txData!['warning'] != null && txData!['warning'].isNotEmpty;

        return Card(
          elevation: 4,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: hasWarning ? Colors.red.shade400.withOpacity(0.3) : Colors.grey.shade200),
          ),
          child: ExpansionTile(
            leading: CircleAvatar(
              backgroundColor: Colors.indigo.shade100,
              child: Icon(
                Icons.swap_horiz,
                color: Colors.indigo.shade800,
                size: 20,
              ),
            ),
            title: Text(
              'Tx: ${txData!['txHash'].substring(0, 6)}...${txData!['txHash'].substring(txData!['txHash'].length - 4)}',
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
            subtitle: Text(
              'Amount: ${txData!['amountInEth']} ETH • ${txData!['status']}',
              style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
            ),
            trailing: hasWarning
                ? Icon(Icons.warning_amber, color: Colors.red.shade400, size: 24)
                : const Icon(Icons.expand_more, color: Colors.grey),
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInfoRow('From', txData!['fromAddress'], isAddress: true),
                    _buildInfoRow('To', txData!['toAddress'], isAddress: true),
                    _buildInfoRow('Amount', '${txData!['amountInEth']} ETH'),
                    _buildInfoRow('Gas Fee', '${BigInt.parse(txData!['gasFeeInWei'])} Wei'),
                    _buildInfoRow('Status', txData!['status']),
                    _buildInfoRow('Chain', txData!['chain']),
                    _buildInfoRow('User ID', txData!['userId'], isAddress: true),
                    if (txData!['timestamp'] != null)
                      _buildInfoRow('Time', txData!['timestamp'].toDate().toString()),
                    if (hasWarning) ...[
                      const Divider(),
                      Text(
                        'Warning: ${txData!['warning']}',
                        style: TextStyle(
                          color: Colors.red.shade400,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                      _buildInfoRow('Warned by', txData!['warnedBy']),
                      _buildInfoRow('Warned at', txData!['warnedAt']?.toDate().toString() ?? 'N/A'),
                    ],
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton.icon(
                          onPressed: isLoading ? null : () => _showWarningDialog(context),
                          icon: const Icon(Icons.warning, size: 18),
                          label: const Text('Add Warning'),
                          style: TextButton.styleFrom(foregroundColor: Colors.red.shade400),
                        ),
                        TextButton.icon(
                          onPressed: isLoading ? null : () => _confirmDeleteUser(context, txData!['userId']),
                          icon: const Icon(Icons.delete, size: 18),
                          label: const Text('Delete User'),
                          style: TextButton.styleFrom(foregroundColor: Colors.red.shade400),
                        ),
                      ],
                    ),
                    if (errorMessage != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          errorMessage!,
                          style: TextStyle(color: Colors.red.shade400, fontSize: 14),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildInfoRow(String label, String value, {bool isAddress = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '$label:',
              style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.black87),
            ),
          ),
          Expanded(
            child: Text(
              isAddress ? '${value.substring(0, 6)}...${value.substring(value.length - 4)}' : value,
              style: TextStyle(color: Colors.grey.shade700),
            ),
          ),
        ],
      ),
    );
  }

  void _showWarningDialog(BuildContext context) async {
    final controller = TextEditingController();
    Map<String, dynamic>? userInfo;

    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      if (txData == null || txData!['userId'] == null) {
        throw Exception('Transaction data or user ID is missing');
      }
      final cubit = context.read<AdminManagementScreenCubit>();
      userInfo = await cubit.fetchUserInfoForWarning(txData!['userId']);
    } catch (e) {
      setState(() {
        isLoading = false;
        errorMessage = 'Failed to load user info: $e';
      });
      return;
    } finally {
      if (!mounted) return;
      setState(() => isLoading = false);
    }

    if (!mounted) return;

    showDialog(
      context: context,
      builder: (context) => _CustomAlertDialog(
        title: 'Add Warning to Transaction',
        contentWidget: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Transaction Hash: ${txData!['txHash'].substring(0, 6)}...${txData!['txHash'].substring(txData!['txHash'].length - 4)}',
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 12),
              if (userInfo != null) ...[
                Text('User: ${userInfo['firstName'] ?? ''} ${userInfo['lastName'] ?? ''}'.trim()),
                Text('Email: ${userInfo['email'] ?? 'No email'}'),
                const SizedBox(height: 12),
              ] else ...[
                Text('User: Not found', style: TextStyle(color: Colors.grey.shade600)),
                const SizedBox(height: 12),
              ],
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  labelText: 'Reason for Warning',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                ),
                maxLines: 3,
              ),
            ],
          ),
        ),
        confirmText: 'Confirm',
        onConfirm: () async {
          if (controller.text.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('Warning reason cannot be empty'),
                backgroundColor: Colors.red.shade400,
              ),
            );
            return;
          }

          setState(() {
            isLoading = true;
            errorMessage = null;
          });

          try {
            await context.read<AdminManagementScreenCubit>().addTransactionWarning(widget.txId, controller.text);
            setState(() {
              txData!['warning'] = controller.text;
              txData!['warnedBy'] = 'Admin'; // Replace with actual admin ID or name if available
              txData!['warnedAt'] = Timestamp.now();
              isLoading = false;
            });
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('Warning Added'),
                backgroundColor: Colors.greenAccent.shade700,
              ),
            );
          } catch (e) {
            setState(() {
              isLoading = false;
              errorMessage = 'Failed to add warning: $e';
            });
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Error: $e'),
                backgroundColor: Colors.red.shade400,
              ),
            );
          }
        },
        onCancel: () => Navigator.pop(context),
      ),
    );
  }
  void _confirmDeleteUser(BuildContext context, String userId) {
    showDialog(
      context: context,
      builder: (context) => _CustomAlertDialog(
        title: 'Delete User Account',
        content: 'Are you sure you want to delete this user account? This action cannot be undone.',
        confirmText: 'Delete',
        onConfirm: () async {
          try {
            await context.read<AdminManagementScreenCubit>().deleteUserAccount(userId);
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('User Account Deleted'),
                backgroundColor: Colors.greenAccent.shade700,
              ),
            );
          } catch (e) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Error: $e'),
                backgroundColor: Colors.red.shade400,
              ),
            );
          }
        },
        onCancel: () => Navigator.pop(context),
      ),
    );
  }
}

class _TransactionFilterTab extends StatefulWidget {
  final AuthenticationRepositoryFirebase authRepo;

  const _TransactionFilterTab({required this.authRepo});

  @override
  __TransactionFilterTabState createState() => __TransactionFilterTabState();
}

class __TransactionFilterTabState extends State<_TransactionFilterTab> {
  String _warningFilter = 'All';
  String _timeSort = 'Newest';
  String _statusFilter = 'All';

  Stream<QuerySnapshot> _buildTransactionStream() {
    Query query = FirebaseFirestore.instance.collection('transactions');

    if (_warningFilter == 'Warned') {
      query = query.where('warning', isNotEqualTo: '');
    } else if (_warningFilter == 'Not Warned') {
      query = query.where('warning', isEqualTo: null);
    }

    if (_statusFilter != 'All') {
      query = query.where('status', isEqualTo: _statusFilter.toLowerCase());
    }

    query = query.orderBy('timestamp', descending: _timeSort == 'Newest');

    return query.snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.indigo.shade50,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: _buildFilterDropdown(
                  label: 'Warn',
                  value: _warningFilter,
                  items: ['All', 'Warned', 'Not Warned'],
                  onChanged: (value) => setState(() => _warningFilter = value!),
                ),
              ),
              const SizedBox(width: 8),
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: _buildFilterDropdown(
                  label: 'Time',
                  value: _timeSort,
                  items: ['Newest', 'Oldest'],
                  onChanged: (value) => setState(() => _timeSort = value!),
                ),
              ),
              const SizedBox(width: 8),
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: _buildFilterDropdown(
                  label: 'Status',
                  value: _statusFilter,
                  items: ['All', 'Pending', 'Completed', 'Failed'],
                  onChanged: (value) => setState(() => _statusFilter = value!),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: StreamBuilder<QuerySnapshot>(
            stream: _buildTransactionStream(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator(color: Colors.greenAccent));
              }
              if (snapshot.hasError) {
                if (snapshot.error.toString().contains('FAILED_PRECONDITION')) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        'The data is being prepared. Please try again in a few minutes.',
                        style: TextStyle(color: Colors.red, fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                }
                return Center(
                  child: Text(
                    'Error: ${snapshot.error}',
                    style: TextStyle(color: Colors.red.shade400, fontSize: 16),
                  ),
                );
              }
              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return const Center(
                  child: Text(
                    'No transactions found.',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                );
              }
              final transactionIds = snapshot.data!.docs.map((doc) => doc.id).toList();
              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: transactionIds.length,
                itemBuilder: (context, index) {
                  final txId = transactionIds[index];
                  return TransactionCard(
                    txId: txId,
                    authRepo: widget.authRepo,
                    key: ValueKey(txId),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildFilterDropdown({
    required String label,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.indigo.shade800, fontSize: 12),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
      items: items.map((item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item, style: const TextStyle(fontSize: 14), overflow: TextOverflow.ellipsis),
        );
      }).toList(),
      onChanged: onChanged,
      dropdownColor: Colors.white,
      icon: Icon(Icons.arrow_drop_down, color: Colors.indigo.shade800, size: 20),
      isExpanded: true,
    );
  }
}