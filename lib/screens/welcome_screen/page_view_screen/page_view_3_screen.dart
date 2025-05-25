import 'package:flutter/material.dart';
import '../../../app_common_data/app_colors.dart';
import '../../../app_common_data/app_text_sytle.dart';
import '../../../shared_customization/widgets/texts/app_text.dart';

class PageView3Screen extends StatelessWidget {
  const PageView3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF2DB1EC), Color(0xFFFFFFFF)], // Pink-white gradient
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 2),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.white,
                    AppColors.white.withOpacity(0.7),
                  ], // Vibrant orange gradient
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 15,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: AppText(
                'Join the Global Crypto Revolution!',
                style: AppTextStyle.titleText.copyWith(
                  fontSize: 26,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      color: Colors.black.withOpacity(0.3),
                      offset: const Offset(2, 2),
                      blurRadius: 4,
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Image.asset(
            'assets/images/Currency_earth.png',
            height: 280,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 280,
                width: 280,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.white.withOpacity(0.2)),
                ),
                child: Center(
                  child: AppText(
                    'Image Not Found',
                    style: AppTextStyle.bodyText.copyWith(
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                ),
              );
            },
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}