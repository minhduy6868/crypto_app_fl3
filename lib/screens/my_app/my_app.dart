import 'package:bot_toast/bot_toast.dart';
import 'package:crypto_app/screens/wallet_screen/wallet_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypto_app/app_common_data/common_data/global_key_variable.dart';

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
    final first_time = sp.isFirstLaunch;
    final wasLogin = (sp.email != null);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppUserCubit()),
        BlocProvider(create: (context) => PageRouterCubit()),
        BlocProvider(create: (context) => WalletCubit()),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AppUserCubit, AppUserState>(
            listener: (context, state) {},
          ),
        ],
        child: Builder(builder: (context) {
          return MaterialApp(
            title: 'Flutter App',
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            // theme: ThemeData(),
            // darkTheme: ,
            themeMode: ThemeMode.system,
            //initialRoute: (first_time ? Routes.welcomeScreen: (wasLogin? Routes.mainScreen : Routes.loginScreen)),
            initialRoute: Routes.walletScreen,
            routes: Routes.routes,
            navigatorObservers: [
              AppRouteObserver(context),
              BotToastNavigatorObserver()
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
