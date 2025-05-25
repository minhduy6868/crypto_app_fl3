import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypto_app/app_common_data/enums/main_tabs.dart';
import 'package:crypto_app/app_common_data/common_data/global_variable.dart';
import 'package:crypto_app/shared_customization/widgets/app_layout.dart';
import 'package:crypto_app/shared_customization/widgets/app_container.dart';
import 'package:crypto_app/screens/bloc_base_screen.dart';
import 'package:crypto_app/screens/main_screen/cubit/main_screen_cubit.dart';
import 'package:animate_do/animate_do.dart';
import '/screens/drawer_screen/drawer_screen.dart';
import '/shared_customization/widgets/custom_widgets/app_dismiss_keyboard.dart';
import '/app_common_data/app_colors.dart';
import '/app_common_data/routes/app_routes.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late BannerAd _bannerAd;
  bool _isBannerAdReady = false;

  @override
  void initState() {
    super.initState();
    // Initialize AdMob and banner ad
    // _bannerAd = BannerAd(
    //   adUnitId: 'ca-app-pub-1621248632569820/7699331541', // Placeholder ID
    //   size: AdSize.banner,
    //   request: const AdRequest(),
    //   listener: BannerAdListener(
    //     onAdLoaded: (_) {
    //       setState(() {
    //         _isBannerAdReady = true;
    //       });
    //     },
    //     onAdFailedToLoad: (ad, error) {
    //       print('Failed to load banner ad: ${error.message}');
    //       ad.dispose();
    //     },
    //   ),
    // );
    // _bannerAd.load();
  }

  @override
  void dispose() {
    //_bannerAd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBaseScreen<MainScreenCubit, MainScreenState>.multiProvider(
      providers: const [],
      cubitInstance: MainScreenCubit(),
      builder: (context, state) {
        return AppDismissKeyboard(
          child: AppLayout(
            resizeToAvoidBottomInset: true,
            onWillPop: () => Future.value(false),
            drawer: const DrawerScreen(),
            showAppBar: false,
            body: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFE8F5E9), // Light green
                    Color(0xFF44C1CC), // Emerald green
                  ],
                ),
              ),
              child: Column(
                children: [
                  // Main content
                  Expanded(
                    child: FadeInUp(
                      duration: const Duration(milliseconds: 600),
                      child: state.currentTabs.widget,
                    ),
                  ),

                  // Banner ad placeholder (commented out due to tab-switching issue)
                  /*
                  if (_isBannerAdReady)
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: AdWidget(ad: _bannerAd),
                      width: _bannerAd.size.width.toDouble(),
                      height: _bannerAd.size.height.toDouble(),
                    ),
                  */
                ],
              ),
            ),
            bottomNavigationBar: FadeInUp(
              duration: const Duration(milliseconds: 600),
              child: _buildBottomNavigationBar(context, state),
            ),
          ),
        );
      },
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context, MainScreenState state) {
    return Container(
      height: 70,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: Colors.green.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: MainTabs.values.map((tab) {
          final isActive = tab == state.currentTabs;
          return Expanded(
            child: InkWell(
              onTap: () => context.read<MainScreenCubit>().changeTab(tab),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Animated indicator
                  if (isActive)
                    Container(
                      width: 40,
                      height: 4,
                      margin: const EdgeInsets.only(bottom: 60),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF3DB9D5), Color(0xFFA2CEEA)],
                        ),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        isActive ? tab.activeIcon : tab.icon,
                        size: 26,
                        color: isActive ? const Color(0xFF289BDA) : Colors.grey[600],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        tab.toString().split('.').last, // Simplified tab name
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                          color: isActive ? const Color(0xFF2DB1EC) : Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}