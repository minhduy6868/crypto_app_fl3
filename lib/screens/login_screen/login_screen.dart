
import 'package:crypto_app/shared_customization/extensions/build_context.ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../app_common_data/routes/app_routes.dart';
import '../../services/service_repositories/authentication_reponsitiory_firebase.dart';
import '../../shared_customization/helpers/utilizations/validators.dart';
import '../../shared_customization/widgets/app_container.dart';
import '../../shared_customization/widgets/app_layout.dart';
import '../../shared_customization/widgets/buttons/app_button.dart';
import '../../shared_customization/widgets/buttons/app_text_button.dart';
import '../../shared_customization/widgets/form_fields/app_form.dart';
import '../../shared_customization/widgets/form_fields/app_text_form_field.dart';
import '../../shared_customization/widgets/texts/app_text.dart';
import 'cubit/login_screen_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginScreenCubit(AuthenticationRepositoryFirebase()),
      child: Scaffold(
        body: AppLayout.scrollableView(
          showAppBar: false,
          paddingAll: const EdgeInsets.all(16),
          child: BlocConsumer<LoginScreenCubit, LoginScreenState>(
            listener: (context, state) {
              if (state.isLoggedIn == true) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Đăng nhập thành công!')),
                );
                context.popAndPushNamed(Routes.mainScreen);
              } else if (state.errorMessage != null) {


                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Lỗi: ${state.errorMessage}')),
                );
              }
            },
            builder: (context, state) {
              final cubit = context.read<LoginScreenCubit>();

              return AppForm(
                child: (formKey) => Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    AppContainer(
                      color: const Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.circular(40),
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AppText(
                            'Đăng nhập',
                            padding: EdgeInsets.only(bottom: 40),
                          ),
                          AppTextFormField(
                            label: 'Email',
                            onChanged: (value) => cubit.updateEmail(value),
                            validations: const [Validators.validateEmail],
                          ),
                          const SizedBox(height: 20),
                          AppTextFormField(
                            label: 'Mật khẩu',
                            obscureText: true,
                            onChanged: (value) => cubit.updatePassword(value),
                            validations: const [Validators.validatePassword],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              AppTextButton(
                                onPressed: () {
                                  context.pushNamed(Routes.forgotPasswordScreen);
                                },
                                text: AppText('Quên mật khẩu'),
                              ),
                            ],
                          ),
                          const SizedBox(height: 32),
                          state.isLoading == true
                              ? const CircularProgressIndicator()
                              : AppButton(
                            onPressed: () {
                              context.unfocus();
                              if (formKey.currentState?.validate() ?? false) {
                                cubit.login();
                              }
                            },
                            label: 'Đăng nhập',
                          ),
                          const SizedBox(height: 16),
                           AppText('Chưa có tài khoản'),
                          AppTextButton(
                            onPressed: () {
                              context.popAndPushNamed(Routes.registerScreen);
                            },
                            text: AppText(
                              'Đăng ký',
                              color: Colors.blue,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
