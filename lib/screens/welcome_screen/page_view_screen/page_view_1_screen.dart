import 'package:flutter/material.dart';
import '../../../app_common_data/app_text_sytle.dart';
import '../../../shared_customization/widgets/texts/app_text.dart';

class PageView1Screen extends StatelessWidget {
  const PageView1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [ Color(0xFFFFFFFF), Color(0xFF2DB1EC)], // Pink-white gradient
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
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5), // Glassmorphism effect
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white.withOpacity(0.3)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 20,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Column(
                children: [
                  AppText(
                    'Welcome to CryptoHub',
                    style: AppTextStyle.titleText.copyWith(
                      fontSize: 30,
                      color: Colors.blue,
                      fontWeight: FontWeight.w800,
                      shadows: [
                        Shadow(
                          color: Colors.black.withOpacity(0.2),
                          offset: const Offset(2, 2),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  AppText(
                    'Seamless crypto payments at your fingertips',
                    style: AppTextStyle.bodyText.copyWith(
                      fontSize: 16,
                      color: Colors.blue.withOpacity(0.9),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          Image.asset(
            'assets/images/wallet.png',
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