import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:crypto_app/app_common_data/app_colors.dart';
import 'package:crypto_app/app_common_data/app_text_sytle.dart';
import 'package:crypto_app/app_common_data/routes/app_routes.dart';
import 'package:crypto_app/models/exchange/exchange/exchange.dart';
import 'package:crypto_app/screens/bloc_base_screen.dart';
import 'package:crypto_app/screens/home_screen/cubit/home_screen_cubit.dart';
import 'package:crypto_app/shared_customization/extensions/build_context.ext.dart';
import 'package:crypto_app/shared_customization/widgets/custom_widgets/app_dismiss_keyboard.dart';
import 'package:crypto_app/shared_customization/widgets/texts/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared_customization/helpers/string_helper.dart';
import '../detail_coin_screen/detail_coin_screen.dart';
import '../detail_exchange_screen/detail_exchange_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  InterstitialAd? _interstitialAd; // Quảng cáo Interstitial
  bool _isInterstitialAdReady = false; // Kiểm tra xem quảng cáo đã sẵn sàng chưa



  // Hàm tải quảng cáo Interstitial
  void _loadAndShowInterstitialAd() {
    InterstitialAd.load(
      adUnitId: 'ca-app-pub-1621248632569820/8708977106', // Thay thế bằng ID quảng cáo của bạn
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (InterstitialAd ad) {
              ad.dispose(); // Hủy quảng cáo để tránh rò rỉ bộ nhớ
              context.pushNamed(Routes.ggAdsScreen); // Gọi hàm xử lý sau khi đóng quảng cáo
            },
            onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
              ad.dispose();
              context.pushNamed(Routes.ggAdsScreen);// Nếu quảng cáo lỗi, vẫn tiếp tục xử lý tiếp theo
            },
          );

          ad.show();
        },
        onAdFailedToLoad: (LoadAdError error) {
          print('Failed to load interstitial ad: $error');
          _navigateToNextScreen(); // Nếu không tải được quảng cáo, vẫn tiếp tục xử lý tiếp theo
        },
      ),
    );
  }

// Hàm xử lý sau khi đóng quảng cáo
  void _navigateToNextScreen() {
    print("Chuyển sang màn hình tiếp theo hoặc xử lý logic khác...");
    // Ví dụ: Navigator.push(...)
  }


  // Hàm hiển thị quảng cáo Interstitial
  Future<void> _showInterstitialAd() async {
    if (_isInterstitialAdReady) {
      try {
        // Đảm bảo quảng cáo đã được tải và hiển thị
        await _interstitialAd!.show();
        print("Ad displayed successfully");
      } catch (e) {
        // Bắt lỗi nếu quảng cáo không thể hiển thị
        print("Error showing ad: $e");
      }
    } else {
      print("Ad not ready, navigating anyway");
    }
  }


  @override
  void dispose() {
    super.dispose();
    _interstitialAd?.dispose(); // Giải phóng tài nguyên khi không còn cần quảng cáo
  }

  @override
  Widget build(BuildContext context) {
    return BlocBaseScreen<HomeScreenCubit, HomeScreenState>(
      cubitInstance: HomeScreenCubit()..loadData(),
      builder: (context, state) {
        return AppDismissKeyboard(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _headerHome(),
                  const SizedBox(height: 16),
                  _buildSectionTitle(
                    context,
                    title: "Top 5 Coins",
                    onSeeAllPressed: () {
                      // Hiển thị quảng cáo trước khi điều hướng
                      _showInterstitialAd();
                      Future.delayed(const Duration(seconds: 1), () {
                        context.pushNamed(Routes.viewAllListScreen, arguments: false);
                      });
                    },
                  ),
                  _buildCoinMarketList(state),
                  const SizedBox(height: 16),
                  _buildSectionTitle(
                    context,
                    title: "Top 5 Exchanges",
                    onSeeAllPressed: () {
                      // Hiển thị quảng cáo trước khi điều hướng
                      _showInterstitialAd();
                      Future.delayed(const Duration(seconds: 1), () {
                        context.pushNamed(Routes.viewAllListScreen, arguments: true);
                      });
                    },
                  ),
                  _buildExchangeList(state),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSectionTitle(BuildContext context, {
    required String title,
    required VoidCallback onSeeAllPressed,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(
          title,
          style: AppTextStyle.titleText.copyWith(fontSize: 20),
        ),
        GestureDetector(
          onTap: onSeeAllPressed,
          child: AppText(
            "See All",
            style: AppTextStyle.description.copyWith(
              fontSize: 14,
              color: AppColors.black,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCoinMarketList(HomeScreenState state) {
    if (state.listcoinMarket == null) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.errorMessage != null) {
      return Center(
        child: Text(
          state.errorMessage ?? 'An error occurred',
          style: const TextStyle(color: Colors.red),
        ),
      );
    }

    final coins = state.listcoinMarket?.take(5).toList() ?? [];

    if (coins.isEmpty) {
      return const Center(
        child: Text('No coins available'),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: coins.length,
      itemBuilder: (context, index) {
        final coin = coins[index];
        return GestureDetector(
            onTap: () {
              final coin = state.listcoinMarket![index];
              context.pushNamed(Routes.detailCoinScreen, arguments: DetailCoinScreenArgs(coinId: coin.id ?? ""));
            },
            child: _buildCoinItem(coin));
      },
    );
  }

  Widget _buildExchangeList(HomeScreenState state) {
    if (state.listExchange == null) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.errorMessage != null) {
      return Center(
        child: Text(
          state.errorMessage ?? 'An error occurred',
          style: const TextStyle(color: Colors.red),
        ),
      );
    }

    final exchanges = state.listExchange?.take(5).toList() ?? [];

    if (exchanges.isEmpty) {
      return const Center(
        child: Text('No exchanges available'),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: exchanges.length,
      itemBuilder: (context, index) {
        final exchange = exchanges[index];
        return GestureDetector(
          onTap: () {
            final exchangeid = state.listExchange![index];
            context.pushNamed(
              Routes.detailExchangeScreen,
              arguments: DetailExchangeScreenArgs(exchangeId: exchangeid.id ?? ""),
            );
          },
          child: _buildExchangeItem(exchange),
        );
      },
    );
  }

  Widget _buildCoinItem(dynamic coin) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Image.network(
            coin.image ?? 'https://via.placeholder.com/50',
            height: 50,
            width: 50,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  coin.name ?? 'No Name Available',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  coin.symbol ?? 'No Symbol',
                  style: const TextStyle(color: Colors.grey),
                ),
                Text(
                  '\$${coin.currentPrice?.toStringAsFixed(2)}',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (coin.sparklineIn7d?.price != null)
                SizedBox(
                  width: 100,
                  height: 40,
                  child: Sparkline(
                    data: coin.sparklineIn7d!.price,
                    lineWidth: 2.0,
                    lineColor: coin.marketCapChangePercentage24h! >= 0
                        ? AppColors.green
                        : AppColors.red,
                    fillMode: FillMode.below,
                    fillGradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: coin.marketCapChangePercentage24h! >= 0
                          ? [AppColors.green, Colors.green.shade200]
                          : [AppColors.red, Colors.red.shade200],
                    ),
                  ),
                ),
              Text(
                '${coin.priceChangePercentage24h?.toStringAsFixed(2)}%',
                style: TextStyle(
                  color: coin.priceChangePercentage24h! >= 0
                      ? AppColors.green
                      : AppColors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildExchangeItem(Exchange exchange) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Image.network(
            exchange.image ?? 'https://via.placeholder.com/50',
            height: 50,
            width: 50,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      exchange.name ?? 'No Name Available',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      exchange.country ?? 'No Country',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                Text(
                  'Trade volume 24h: \$${exchange.tradeVolume24hBtc!.toStringAsFixed(2)}',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _headerHome() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                StringHelper.isMorning() ? "Good Morning!" : "Welcome!",
                style: AppTextStyle.titleText.copyWith(fontSize: 24),
              ),
              AppText('Let’s explore the market!'),
            ],
          ),
          GestureDetector(
            onTap: () {
_loadAndShowInterstitialAd();
            },
            child: const CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage('assets/icons/music_app_icon.png'),
            ),
          ),
        ],
      ),
    );
  }
}
