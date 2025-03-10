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
import '../bloc_base_screen.dart';
import 'cubit/register_screen_cubit.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBaseScreen<RegisterScreenCubit, RegisterScreenState>(
      cubitInstance: RegisterScreenCubit(AuthenticationRepositoryFirebase()),

      /// ✅ Hiển thị thông báo thành công
      onShowSuccess: () async {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Đăng ký thành công! Vui lòng đăng nhập.')),
        );
        await Future.delayed(const Duration(seconds: 1));
        context.popAndPushNamed(Routes.loginScreen);
      },

      /// ❌ Hiển thị thông báo lỗi
      onShowError: () async {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Đăng ký thất bại! Vui lòng thử lại.')),
        );
      },

      builder: (context, state) {
        final cubit = context.read<RegisterScreenCubit>();

        return AppLayout.scrollableView(
          showAppBar: false,
          paddingAll: const EdgeInsets.all(16),
          child: AppForm(
            child: (formKey) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppContainer(
                  color: const Color(0xFFF5F5F5),
                  padding: const EdgeInsets.all(24),
                  borderRadius: BorderRadius.circular(20),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    runSpacing: 16,
                    children: [
                      AppText('Đăng ký'),

                      /// ✅ Cập nhật tên và họ người dùng khi nhập dữ liệu
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: AppTextFormField(
                              label: "Tên",
                              maxLines: 1,
                              onChanged: (value) {
                                cubit.updateFirstName(value); // Cập nhật firstName
                              },
                              validations: [
                                    (data) => Validators.validateNotEmptyListOrString(
                                  data,
                                  fieldName: "Tên",
                                )
                              ],
                            ),
                          ),
                          const SizedBox(width: 6),
                          Expanded(
                            child: AppTextFormField(
                              label: "Họ",
                              maxLines: 1,
                              onChanged: (value) {
                                cubit.updateLastName(value); // Cập nhật lastName
                              },
                              validations: [
                                    (data) => Validators.validateNotEmptyListOrString(
                                  data,
                                  fieldName: "Họ",
                                )
                              ],
                            ),
                          ),
                        ],
                      ),

                      /// ✅ Nhập Email và mật khẩu
                      AppTextFormField(
                        label: "Email",
                        onChanged: (value) => cubit.updateEmail(value),
                        validations: [Validators.validateEmail],
                      ),
                      AppTextFormField(
                        label: "Mật khẩu",
                        obscureText: true,
                        onChanged: (value) => cubit.updatePassword(value),
                        validations: [Validators.validatePassword],
                      ),
                      AppTextFormField(
                        label: "Xác nhận mật khẩu",
                        obscureText: true,
                        onChanged: (value) => cubit.updateConfirmPassword(value),
                        validations: [Validators.validatePassword],
                      ),

                      /// ✅ Hiển thị tiến trình đăng ký
                      state.isLoading == true
                          ? const CircularProgressIndicator()
                          : AppButton(
                        onPressed: () {
                          context.unfocus();
                          if (formKey.currentState?.validate() ?? false) {
                            cubit.register(); // Gọi hàm đăng ký
                          }
                        },
                        width: double.infinity,
                        label: "Đăng ký",
                      ),

                      /// ✅ Chuyển hướng nếu đã có tài khoản
                      Column(
                        children: [
                          AppText("Đã có tài khoản?"),
                          AppTextButton(
                            onPressed: () {
                              context.popAndPushNamed(Routes.loginScreen);
                            },
                            text: AppText(
                              'Đăng nhập',
                              color: Colors.blue,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
