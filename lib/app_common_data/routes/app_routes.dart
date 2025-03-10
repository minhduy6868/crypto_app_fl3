import 'package:crypto_app/screens/account_screen/account_screen.dart';
import 'package:crypto_app/screens/detail_coin_screen/detail_coin_screen.dart';
import 'package:crypto_app/screens/forgot_password_screen/forgot_password_screen.dart';
import 'package:crypto_app/screens/gg_ads_screen/gg_add_screen.dart';
import 'package:crypto_app/screens/login_screen/login_screen.dart';
import 'package:crypto_app/screens/register_screen/register_screen.dart';
import 'package:crypto_app/screens/view_all_list_screen/view_all_list_screen.dart';
import 'package:crypto_app/screens/wallet_screen/wallet_screen.dart';
import 'package:crypto_app/screens/welcome_screen/welcome_screen.dart';
import 'package:flutter/material.dart';

import '../../screens/detail_exchange_screen/detail_exchange_screen.dart';
import '/shared_customization/extensions/build_context.ext.dart';
import '/screens/main_screen/main_screen.dart';
import '../../shared_customization/widgets/app_container.dart';
import '../../shared_customization/widgets/custom_widgets/screens/app_image_full_screen.dart';

class Routes {
  static String mainScreen = '/main-screen';
  static String loginScreen = '/login-screen';
  static String accountScreen = '/account-screen';
  static String registerScreen = '/register-screen';
  static String forgotPasswordScreen = '/forgot-password-screen';
  static String imageFullScreen = '/image-full-screen';
  static String welcomeScreen = '/welcome-screen';
  static String detailCoinScreen = '/detail-coin-screen';
  static String detailExchangeScreen = '/detail-exchange-screen';
  static String viewAllListScreen = '/view-all-list-screen';
  static String ggAdsScreen = '/gg-ads-screen';
  static String walletScreen = '/wallet-screen';

  static final Map<String, Widget Function(BuildContext context)> routes = {
    mainScreen: (context) => const MainScreen(),
    loginScreen: (context) => const LoginScreen(),
    accountScreen: (context) => const AccountScreen(),
    registerScreen: (context) => const RegisterScreen(),
    forgotPasswordScreen: (context) => const ForgotPasswordScreen(),
    imageFullScreen: (context) => AppImageFullScreen(
        params: context.getArguments<AppImageFullScreenParams>()!),
    welcomeScreen: (context) => const WelcomeScreen(),
    detailCoinScreen: (context) =>  DetailCoinScreen(args: context.getArguments<DetailCoinScreenArgs>()!),
    detailExchangeScreen: (context) =>  DetailExchangeScreen(args: context.getArguments<DetailExchangeScreenArgs>()!),
    viewAllListScreen: (context) =>  ViewAllListScreen(isExchange: context.getArguments(),),
    ggAdsScreen: (context) => const GgAddScreen(),
    walletScreen: (context) => const WalletScreen(),
  };
}
