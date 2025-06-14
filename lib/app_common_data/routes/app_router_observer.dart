// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '/public_providers/providers/page_router_cubit/page_router_cubit.dart';
import '/app_common_data/routes/app_routes.dart';

class AppRouteObserver extends RouteObserver<PageRoute<dynamic>> {
  BuildContext context;
  AppRouteObserver(this.context);

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    context
        .read<PageRouterCubit>()
        .updatePage(name: route.settings.name, args: route.settings.arguments);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    if (previousRoute?.settings.name == Routes.loginScreen) {
      Future.delayed(const Duration(milliseconds: 200), () {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
        });
      });
    }
    context.read<PageRouterCubit>().updatePage(
        name: previousRoute?.settings.name,
        args: previousRoute?.settings.arguments);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    context.read<PageRouterCubit>().updatePage(
        name: newRoute?.settings.name, args: newRoute?.settings.arguments);
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    super.didRemove(route, previousRoute);
    context
        .read<PageRouterCubit>()
        .updatePage(name: route.settings.name, args: route.settings.arguments);
  }
}
