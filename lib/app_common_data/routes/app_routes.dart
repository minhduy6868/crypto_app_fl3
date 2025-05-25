import 'package:crypto_app/screens/account_screen/account_screen.dart';
import 'package:crypto_app/screens/detail_coin_screen/detail_coin_screen.dart';
import 'package:crypto_app/screens/detail_exchange_screen/detail_exchange_screen.dart';
import 'package:crypto_app/screens/favorite_coins_screen/favorite_coins_screen.dart';
import 'package:crypto_app/screens/forgot_password_screen/forgot_password_screen.dart';
import 'package:crypto_app/screens/gg_ads_screen/gg_add_screen.dart';
import 'package:crypto_app/screens/login_screen/login_screen.dart';
import 'package:crypto_app/screens/news_detail_screen/news_detail_screen.dart';
import 'package:crypto_app/screens/register_screen/register_screen.dart';
import 'package:crypto_app/screens/setting_screen/setting_screen.dart';
import 'package:crypto_app/screens/view_all_list_screen/view_all_list_screen.dart';
import 'package:crypto_app/screens/wallet_screen/wallet_screen.dart';
import 'package:crypto_app/screens/welcome_screen/welcome_screen.dart';
import 'package:crypto_app/shared_customization/extensions/build_context.ext.dart';
import 'package:crypto_app/shared_customization/widgets/custom_widgets/screens/app_image_full_screen.dart';
import 'package:crypto_app/screens/main_screen/main_screen.dart';
import 'package:flutter/material.dart';

import '../../models/news_crypto/news_crypto.dart';
import '../../screens/admin_managent_screen/admin_management_screen.dart';
import '../../screens/favorite_news_screen/favorite_news_screen.dart';
import '../../screens/list_news_screen/list_new_screen.dart';

class Routes {
  static String mainScreen = '/main-screen';
  static String loginScreen = '/login-screen';
  static String accountScreen = '/account-screen';
  static String settingScreen = '/setting-screen';
  static String registerScreen = '/register-screen';
  static String forgotPasswordScreen = '/forgot-password-screen';
  static String imageFullScreen = '/image-full-screen';
  static String welcomeScreen = '/welcome-screen';
  static String detailCoinScreen = '/detail-coin-screen';
  static String detailExchangeScreen = '/detail-exchange-screen';
  static String viewAllListScreen = '/view-all-list-screen';
  static String ggAdsScreen = '/gg-ads-screen';
  static String walletScreen = '/wallet-screen';
  static String listNewsScreen = '/list-news-screen';
  static String newsDetailScreen = '/news-detail-screen';
  static String adminManagementScreen = '/admin-management-screen';
  static String transactionDetailsScreen = '/transaction-details-screen';
  static String favoriteCoinsScreen = '/favorite-coins-screen';
  static String favoriteNewsScreen = '/favorite-news-screen';

  static final Map<String, Widget Function(BuildContext context)> routes = {
    mainScreen: (context) => const MainScreen(),
    loginScreen: (context) => LoginScreen(),
    accountScreen: (context) => const AccountScreen(),
    settingScreen: (context) => const SettingScreen(),
    registerScreen: (context) => const RegisterScreen(),
    forgotPasswordScreen: (context) => const ForgotPasswordScreen(),
    imageFullScreen: (context) => AppImageFullScreen(
      params: context.getArguments<AppImageFullScreenParams>()!,
    ),
    welcomeScreen: (context) => const WelcomeScreen(),
    detailCoinScreen: (context) => DetailCoinScreen(
      args: context.getArguments<DetailCoinScreenArgs>()!,
    ),
    detailExchangeScreen: (context) => DetailExchangeScreen(
      args: context.getArguments<DetailExchangeScreenArgs>()!,
    ),
    viewAllListScreen: (context) => ViewAllListScreen(
      isExchange: context.getArguments(),
    ),
    ggAdsScreen: (context) => const GgAddScreen(),
    walletScreen: (context) => const WalletScreen(),
    listNewsScreen: (context) => const ListNewsScreen(),
    favoriteCoinsScreen: (context) => FavoriteCoinsScreen(),
    favoriteNewsScreen: (context) => FavoriteNewsScreen(),
    adminManagementScreen: (context) => const AdminManagementScreen(),
    newsDetailScreen: (context) => NewsDetailScreen(
      news: context.getArguments<NewsCrypto>()!,
    ),
    // transactionDetailsScreen: (context) => TransactionDetailsScreen(
    //   txHash: context.getArguments<String>()!,
    // ),
  };
}