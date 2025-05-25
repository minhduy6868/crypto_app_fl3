import 'package:crypto_app/app_common_data/app_colors.dart';
import 'package:crypto_app/app_common_data/app_text_sytle.dart';
import 'package:crypto_app/app_common_data/common_data/global_variable.dart';
import 'package:crypto_app/app_common_data/routes/app_routes.dart';
import 'package:crypto_app/screens/welcome_screen/page_view_screen/page_view_1_screen.dart';
import 'package:crypto_app/screens/welcome_screen/page_view_screen/page_view_2_screen.dart';
import 'package:crypto_app/screens/welcome_screen/page_view_screen/page_view_3_screen.dart';
import 'package:crypto_app/shared_customization/helpers/utilizations/storages.dart';
import 'package:crypto_app/shared_customization/widgets/buttons/app_button.dart';
import 'package:crypto_app/shared_customization/widgets/texts/app_text.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final PageController _controllerPage = PageController();
  bool onLastPage = false;
  final CustomSharedPreferences sp = CustomSharedPreferences();

  @override
  void initState() {
    super.initState();
  }

  Future<void> _checkFirstLaunch() async {
    await sp.init();
    sp.isFirstLaunch = false;
    Navigator.pushReplacementNamed(context, Routes.loginScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900], // Solid dark background, no gradient
      body: Stack(
        children: [
          PageView(
            controller: _controllerPage,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: const [
              PageView1Screen(),
              PageView2Screen(),
              PageView3Screen(),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.92),
            child: onLastPage
                ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: AppButton(
                onPressed: _checkFirstLaunch,
                child: AppText(
                  "Get Started",
                  style: AppTextStyle.buttonText.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                width: double.infinity,
                height: MAX_HEIGHT_SCREEN / 14,
                radius: BorderRadius.circular(12),
                color: AppColors.orange.withOpacity(0.9),
              ),
            )
                : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: GestureDetector(
                    onTap: () {
                      _controllerPage.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: AppText(
                      'Back',
                      style: AppTextStyle.bodyText.copyWith(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                SmoothPageIndicator(
                  controller: _controllerPage,
                  count: 3,
                  effect: WormEffect(
                    dotColor: Colors.grey[700]!,
                    activeDotColor: AppColors.orange,
                    dotHeight: 8,
                    dotWidth: 8,
                    spacing: 8,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: GestureDetector(
                    onTap: () {
                      _controllerPage.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: AppText(
                      'Next',
                      style: AppTextStyle.bodyText.copyWith(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}