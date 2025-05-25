import 'dart:ui';
import 'dart:math';
import 'package:crypto_app/shared_customization/extensions/build_context.ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../app_common_data/app_colors.dart';
import '../../app_common_data/routes/app_routes.dart';
import '../../services/service_repositories/authentication_reponsitiory_firebase.dart';
import '../../shared_customization/helpers/utilizations/validators.dart';
import '../../shared_customization/widgets/app_layout.dart';
import '../../shared_customization/widgets/buttons/app_text_button.dart';
import '../../shared_customization/widgets/form_fields/app_form.dart';
import '../../shared_customization/widgets/form_fields/app_text_form_field.dart';
import '../../shared_customization/widgets/texts/app_text.dart';
import '../bloc_base_screen.dart';
import 'cubit/register_screen_cubit.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  // Method to build a spotted circle with irregular shape
  Widget _buildSpottedCircle({
    required double left,
    required double top,
    required double radius,
    required Color color,
  }) {
    return Positioned(
      left: left,
      top: top,
      child: CustomPaint(
        size: Size(radius * 2, radius * 2),
        painter: _SpottedCirclePainter(color: color, radius: radius),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final random = Random();
    final screenSize = MediaQuery.of(context).size;

    return BlocBaseScreen<RegisterScreenCubit, RegisterScreenState>(
      cubitInstance: RegisterScreenCubit(AuthenticationRepositoryFirebase()),
      onShowSuccess: () async {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Registration successful! Please log in.'),
            backgroundColor: Color(0xFF4CAF50),
          ),
        );
        await Future.delayed(const Duration(seconds: 1));
        context.popAndPushNamed(Routes.loginScreen);
      },
      onShowError: () async {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Registration failed: ${context.read<RegisterScreenCubit>().state.errorMessage ?? 'Please try again.'}'),
            backgroundColor: Colors.red,
          ),
        );
      },
      builder: (context, state) {
        final cubit = context.read<RegisterScreenCubit>();

        return Scaffold(
          body: Stack(
            children: [
              // Background gradient
              Container(
                decoration: const BoxDecoration(
                  gradient: RadialGradient(
                    colors: [
                      Color(0xFF1B5E20), // Dark green
                      Color(0xFF4CAF50), // Medium green
                    ],
                    center: Alignment.center,
                    radius: 1.5,
                  ),
                ),
              ),
              // Spotted circles
              _buildSpottedCircle(
                left: random.nextDouble() * (screenSize.width - 100),
                top: random.nextDouble() * (screenSize.height - 100),
                radius: 50 + random.nextDouble() * 50,
                color: Colors.cyan.withOpacity(0.2),
              ),
              _buildSpottedCircle(
                left: random.nextDouble() * (screenSize.width - 100),
                top: random.nextDouble() * (screenSize.height - 100),
                radius: 50 + random.nextDouble() * 50,
                color: Colors.yellow.withOpacity(0.2),
              ),
              _buildSpottedCircle(
                left: random.nextDouble() * (screenSize.width - 100),
                top: random.nextDouble() * (screenSize.height - 100),
                radius: 50 + random.nextDouble() * 50,
                color: Colors.pink.withOpacity(0.2),
              ),
              _buildSpottedCircle(
                left: random.nextDouble() * (screenSize.width - 100),
                top: random.nextDouble() * (screenSize.height - 100),
                radius: 50 + random.nextDouble() * 50,
                color: Colors.white.withOpacity(0.2),
              ),
              _buildSpottedCircle(
                left: random.nextDouble() * (screenSize.width - 100),
                top: random.nextDouble() * (screenSize.height - 100),
                radius: 50 + random.nextDouble() * 50,
                color: Colors.blue.withOpacity(0.2),
              ),
              // Register form
              AppLayout.scrollableView(
                showAppBar: false,
                paddingAll: const EdgeInsets.all(12),
                child: AppForm(
                  child: (formKey) => Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white.withOpacity(0.2)),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ScaleTransition(
                                  scale: Tween<double>(begin: 0.8, end: 1.0).animate(
                                    CurvedAnimation(
                                      parent: ModalRoute.of(context)!.animation!,
                                      curve: Curves.easeOut,
                                    ),
                                  ),
                                  child: Image.asset(
                                    'assets/images/robotcoin.png',
                                    width: 100,
                                    height: 100,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                 AppText(
                                  'Register',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black87,
                                  ),
                                  padding: EdgeInsets.only(bottom: 24),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: AppTextFormField(
                                        label: 'First Name',
                                        prefixIcon: const Icon(Icons.person_outline, color: Colors.black54),
                                        maxLines: 1,
                                        onChanged: (value) => cubit.updateFirstName(value),
                                        validations: [
                                              (data) => Validators.validateNotEmptyListOrString(
                                            data,
                                            fieldName: 'First Name',
                                          ),
                                        ],
                                        textStyle: const TextStyle(color: Colors.black87),
                                        backgroundColor: Colors.white.withOpacity(0.85),
                                        borderRadius: BorderRadius.circular(14),
                                        activeBorderColor: AppColors.blue,
                                        defaultBorderColor: Colors.grey.shade300,
                                        contentPadding: const EdgeInsets.symmetric(
                                          vertical: 14,
                                          horizontal: 12,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: AppTextFormField(
                                        label: 'Last Name',
                                        prefixIcon: const Icon(Icons.person_outline, color: Colors.black54),
                                        maxLines: 1,
                                        onChanged: (value) => cubit.updateLastName(value),
                                        validations: [
                                              (data) => Validators.validateNotEmptyListOrString(
                                            data,
                                            fieldName: 'Last Name',
                                          ),
                                        ],
                                        textStyle: const TextStyle(color: Colors.black87),
                                        backgroundColor: Colors.white.withOpacity(0.85),
                                        borderRadius: BorderRadius.circular(14),
                                        activeBorderColor: AppColors.blue,
                                        defaultBorderColor: Colors.grey.shade300,
                                        contentPadding: const EdgeInsets.symmetric(
                                          vertical: 14,
                                          horizontal: 12,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                AppTextFormField(
                                  label: 'Email',
                                  prefixIcon: const Icon(Icons.email_outlined, color: Colors.black54),
                                  onChanged: (value) => cubit.updateEmail(value),
                                  validations: [Validators.validateEmail],
                                  textStyle: const TextStyle(color: Colors.black87),
                                  backgroundColor: Colors.white.withOpacity(0.85),
                                  borderRadius: BorderRadius.circular(14),
                                  activeBorderColor: AppColors.blue,
                                  defaultBorderColor: Colors.grey.shade300,
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 14,
                                    horizontal: 12,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                AppTextFormField(
                                  label: 'Password',
                                  prefixIcon: const Icon(Icons.lock_outline, color: Colors.black54),
                                  obscureText: true,
                                  onChanged: (value) => cubit.updatePassword(value),
                                  validations: [Validators.validatePassword],
                                  textStyle: const TextStyle(color: Colors.black87),
                                  backgroundColor: Colors.white.withOpacity(0.85),
                                  borderRadius: BorderRadius.circular(14),
                                  activeBorderColor: AppColors.blue,
                                  defaultBorderColor: Colors.grey.shade300,
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 14,
                                    horizontal: 12,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                AppTextFormField(
                                  label: 'Confirm Password',
                                  prefixIcon: const Icon(Icons.lock_outline, color: Colors.black54),
                                  obscureText: true,
                                  onChanged: (value) => cubit.updateConfirmPassword(value),
                                  validations: [Validators.validatePassword],
                                  textStyle: const TextStyle(color: Colors.black87),
                                  backgroundColor: Colors.white.withOpacity(0.85),
                                  borderRadius: BorderRadius.circular(14),
                                  activeBorderColor: AppColors.blue,
                                  defaultBorderColor: Colors.grey.shade300,
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 14,
                                    horizontal: 12,
                                  ),
                                ),
                                const SizedBox(height: 24),
                                state.isLoading == true
                                    ? LoadingAnimationWidget.threeRotatingDots(
                                  color: AppColors.blue,
                                  size: 32,
                                )
                                    : ElevatedButton(
                                  onPressed: () {
                                    context.unfocus();
                                    if (formKey.currentState?.validate() ?? false) {
                                      cubit.register();
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(double.infinity, 50),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                    elevation: 0,
                                    padding: EdgeInsets.zero,
                                  ).copyWith(
                                    backgroundBuilder: (context, states, child) {
                                      return Container(
                                        decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Color(0xFF58ABEC),
                                              Color(0xFF81C784),
                                            ],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                          ),
                                          borderRadius: BorderRadius.all(Radius.circular(14)),
                                        ),
                                        child: child,
                                      );
                                    },
                                  ),
                                  child: const Text(
                                    'Register',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        // cubit.registerWithGoogle();
                                      },
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: const Size(50, 50),
                                        backgroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(14),
                                        ),
                                        side: BorderSide(color: Colors.grey.shade300),
                                        elevation: 0,
                                      ),
                                      child: const FaIcon(FontAwesomeIcons.google, color: Colors.black87),
                                    ),
                                    const SizedBox(width: 16),
                                    ElevatedButton(
                                      onPressed: () {
                                        // cubit.registerWithAppStore();
                                      },
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: const Size(50, 50),
                                        backgroundColor: Colors.black,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(14),
                                        ),
                                        side: BorderSide(color: Colors.grey.shade300),
                                        elevation: 0,
                                      ),
                                      child: const FaIcon(FontAwesomeIcons.apple, color: Colors.white),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                     AppText(
                                      'Already have an account? ',
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 13,
                                      ),
                                    ),
                                    AppTextButton(
                                      onPressed: () {
                                        context.popAndPushNamed(Routes.loginScreen);
                                      },
                                      text:  AppText(
                                        'Login',
                                        style: TextStyle(
                                          color: AppColors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// Custom painter for irregular, spotted circles
class _SpottedCirclePainter extends CustomPainter {
  final Color color;
  final double radius;

  _SpottedCirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final random = Random();
    final path = Path();

    // Create an irregular shape by combining multiple offset points
    for (int i = 0; i < 10; i++) {
      final angle = (i / 10) * 2 * pi;
      final irregularity = 0.8 + random.nextDouble() * 0.4;
      final x = radius + radius * cos(angle) * irregularity;
      final y = radius + radius * sin(angle) * irregularity;
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}