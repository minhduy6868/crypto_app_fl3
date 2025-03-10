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
  final CustomSharedPreferences sp = CustomSharedPreferences(); // Khởi tạo SharedPreferences

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
      body: Stack(
        children: [
          PageView(
            controller: _controllerPage,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: [
              PageView1Screen(),
              PageView2Screen(),
              PageView3Screen(),
            ],
          ),
          Container(
            alignment: Alignment(0, 0.9),
            child: onLastPage
                ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.orange,
                ),
                child: AppButton(
                  onPressed: () async {
                   _checkFirstLaunch();
                  },
                  child: AppText(
                    "Get Started",
                    style: AppTextStyle.buttonText,
                  ),
                  width: double.infinity,
                  height: MAX_HEIGHT_SCREEN / 16,
                ),
              ),
            )
                : Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Back button
                GestureDetector(
                  child: AppText('Back'),
                  onTap: () {
                    _controllerPage.previousPage(
                      duration: Duration(milliseconds: 100),
                      curve: Curves.bounceIn,
                    );
                  },
                ),
                // Smooth Page Indicator
                SmoothPageIndicator(
                  effect: ScrollingDotsEffect(),
                  controller: _controllerPage,
                  count: 3,
                ),
                // Next button
                GestureDetector(
                  child: AppText('Next'),
                  onTap: () {
                    _controllerPage.nextPage(
                      duration: Duration(milliseconds: 100),
                      curve: Curves.bounceIn,
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
