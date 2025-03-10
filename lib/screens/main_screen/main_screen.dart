import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypto_app/app_common_data/enums/main_tabs.dart';
import 'package:crypto_app/app_common_data/common_data/global_variable.dart';
import 'package:crypto_app/shared_customization/widgets/app_layout.dart';
import 'package:crypto_app/shared_customization/widgets/app_container.dart';
import 'package:crypto_app/screens/bloc_base_screen.dart';
import 'package:crypto_app/screens/main_screen/cubit/main_screen_cubit.dart';
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
    // Khởi tạo AdMob và quảng cáo banner
    _bannerAd = BannerAd(
      adUnitId: 'ca-app-pub-1621248632569820/7699331541', // Thay bằng ID quảng cáo của bạn
      size: AdSize.banner,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isBannerAdReady = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          print('Failed to load a banner ad: ${error.message}');
          ad.dispose();
        },
      ),
    );
    _bannerAd.load();
  }

  @override
  void dispose() {
    // Dọn dẹp tài nguyên quảng cáo khi không cần thiết
    _bannerAd.dispose();
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
            body: Column(
              children: [
                // Body content của MainScreen
                Expanded(child: state.currentTabs.widget),
                // Quảng cáo banner sẽ được hiển thị dưới cùng
                if (_isBannerAdReady)
                  Container(
                    alignment: Alignment.center,
                    child: AdWidget(ad: _bannerAd),
                    width: _bannerAd.size.width.toDouble(),
                    height: _bannerAd.size.height.toDouble(),
                  ),
              ],
            ),
            bottomNavigationBar: AppContainer(
              alignment: Alignment.center,
              height: 65,
              color: AppColors.white,
              child: Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: MainTabs.values.map((tab) {
                    return Expanded(
                      child: Center(
                        child: InkWell(
                          onTap: () {
                            context
                                .read<MainScreenCubit>()
                                .changeTab(tab);
                          },
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 0, left: 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AppContainer(
                                      padding: const EdgeInsets.only(
                                          bottom: 3,
                                          top: 4,
                                          left: 0,
                                          right: 0),
                                      border: Border(
                                          top: BorderSide(
                                              width: 1.5,
                                              color: tab == state.currentTabs
                                                  ? AppColors.primaryColor
                                                  : AppColors.transparent)),
                                      child: Icon(
                                          tab != state.currentTabs //stack
                                              ? tab.icon
                                              : tab.activeIcon,
                                          size: 24,
                                          color: tab != state.currentTabs
                                              ? AppColors.black
                                              : AppColors.primaryColor),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
