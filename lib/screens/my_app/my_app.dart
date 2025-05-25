import 'package:bot_toast/bot_toast.dart';
import 'package:crypto_app/public_providers/providers/coin_price_cubit/coin_price_cubit.dart';
import 'package:crypto_app/screens/home_screen/cubit/home_screen_cubit.dart';
import 'package:crypto_app/screens/wallet_screen/wallet_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypto_app/app_common_data/common_data/global_key_variable.dart';

import '../../services/service_repositories/authentication_reponsitiory_firebase.dart';
import '../../shared_customization/helpers/utilizations/storages.dart';
import '../setting_screen/cubit/setting_screen_cubit.dart';
import '../wallet_screen/wallet_cubit/wallet_cubit.dart';
import '/shared_customization/extensions/build_context.ext.dart';
import '/app_common_data/routes/app_routes.dart';
import '/public_providers/providers/app_user_cubit/app_user_cubit.dart';
import '/public_providers/providers/page_router_cubit/page_router_cubit.dart';
import '/app_common_data/common_data/global_variable.dart';
import '/app_common_data/routes/app_router_observer.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final botToastBuilder = BotToastInit();
    PADDING_BOTTOM = context.viewPadding.bottom;
    PADDING_TOP = context.viewPadding.top;
    MAX_WIDTH_SCREEN = context.screenSize.width;
    MAX_HEIGHT_SCREEN = context.screenSize.height;

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppUserCubit()),
        BlocProvider(create: (context) => HomeScreenCubit()),
        BlocProvider(create: (context) => PageRouterCubit()),
        BlocProvider(create: (context) => WalletCubit(isTestNet: true)),
        BlocProvider(create: (context) => SettingScreenCubit()),
        BlocProvider(create: (context) => CoinPriceCubit()),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AppUserCubit, AppUserState>(
            listener: (context, state) {},
          ),
        ],
        child: Builder(builder: (context) {
          // Check authentication state
          final authRepo = AuthenticationRepositoryFirebase();
          final isLoggedIn = authRepo.currentUser != null;
          final isAdmin = authRepo.currentUser?.email == "admin@gmail.com";
          print("in ra check admin: $isAdmin");
          final firstTime = sp.isFirstLaunch;

          // Determine initial route
          String initialRoute;
          if (firstTime) {
            initialRoute = Routes.welcomeScreen;
          } else if (isLoggedIn) {
            initialRoute = isAdmin ? Routes.adminManagementScreen : Routes.mainScreen;
          } else {
            initialRoute = Routes.loginScreen;
          }

          return MaterialApp(
            title: 'Flutter App',
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            themeMode: ThemeMode.system,
            initialRoute: initialRoute,
            routes: Routes.routes,
            navigatorObservers: [
              AppRouteObserver(context),
              BotToastNavigatorObserver(),
            ],
            builder: (context, child) => botToastBuilder(context, child),
            navigatorKey: GlobalKeyVariable.navigatorState,
            scaffoldMessengerKey: GlobalKeyVariable.scaffoldMessengerState,
          );
        }),
      ),
    );
  }
}