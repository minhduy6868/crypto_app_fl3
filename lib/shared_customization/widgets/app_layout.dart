import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/shared_customization/extensions/build_context.ext.dart';
import 'buttons/app_icon_button.dart';
import 'texts/app_text.dart';
import 'buttons/app_button.dart';
import 'app_container.dart';
import '/app_common_data/routes/app_routes.dart';
import '/app_common_data/app_colors.dart';

class AppLayout extends StatefulWidget {
  final bool useSafeArea;
  final Widget body;
  final String? title;
  final Widget? titleWidget;
  final bool showAppBar;
  final double elevation;
  final bool resizeToAvoidBottomInset;
  final List<Widget>? actions;
  final Widget? leading;
  final Color backgroundColor;
  final Color? appbarShadowColor;
  final Color appBarColor;
  final Color statusBarColor;
  final Color? titleColor;
  final Widget? bottomNavigationBar;
  final Widget? drawer;
  final Future<bool> Function()? onWillPop;
  final FloatingActionButton? floatingActionButton;
  final FloatingActionButtonLocation floatingActionButtonLocation;
  final double? leadingWidth;

  const AppLayout({
    super.key,
    required this.body,
    this.useSafeArea = true,
    this.title,
    this.titleWidget,
    this.showAppBar = true,
    this.elevation = 0,
    this.resizeToAvoidBottomInset = true,
    this.actions,
    this.leading,
    this.backgroundColor = AppColors.primaryBackground,
    this.appbarShadowColor,
    this.appBarColor = AppColors.primaryColor,
    this.statusBarColor = AppColors.primaryBackground,
    this.titleColor,
    this.bottomNavigationBar,
    this.drawer,
    this.onWillPop,
    this.floatingActionButton,
    this.floatingActionButtonLocation =
        FloatingActionButtonLocation.centerDocked,
    this.leadingWidth,
  });

  AppLayout.scrollableView({
    super.key,
    this.title,
    this.titleWidget,
    this.showAppBar = true,
    this.elevation = 0,
    this.resizeToAvoidBottomInset = true,
    this.actions,
    this.leading,
    this.backgroundColor = AppColors.primaryBackground,
    this.appbarShadowColor,
    this.appBarColor = AppColors.primaryColor,
    this.statusBarColor = AppColors.primaryBackground,
    this.titleColor,
    this.bottomNavigationBar,
    this.drawer,
    this.onWillPop,
    this.floatingActionButton,
    this.floatingActionButtonLocation =
        FloatingActionButtonLocation.centerDocked,
    this.leadingWidth,
    required Widget child,
    EdgeInsetsGeometry paddingAll = const EdgeInsets.all(16),
  })  : useSafeArea = true,
        body = LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: AppContainer(
                padding: paddingAll,
                constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                    minWidth: constraints.maxWidth),
                child: child,
              ),
            );
          },
        );

  AppLayout.buttonNextPage({
    super.key,
    this.title,
    this.titleWidget,
    this.showAppBar = true,
    this.elevation = 0,
    this.resizeToAvoidBottomInset = true,
    this.actions,
    this.leading,
    this.backgroundColor = AppColors.primaryBackground,
    this.appbarShadowColor,
    this.appBarColor = AppColors.primaryColor,
    this.statusBarColor = AppColors.primaryBackground,
    this.titleColor,
    this.bottomNavigationBar,
    this.drawer,
    this.onWillPop,
    this.floatingActionButton,
    this.floatingActionButtonLocation =
        FloatingActionButtonLocation.centerDocked,
    this.leadingWidth,
    required Widget child,
    required VoidCallback onButtonTap,
    String? buttonLabel,
    EdgeInsetsGeometry paddingAll = const EdgeInsets.all(16),
  })  : useSafeArea = true,
        body = LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: AppContainer(
                padding: paddingAll,
                constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                    minWidth: constraints.maxWidth),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    child,
                    AppButton(
                        label: buttonLabel,
                        onPressed: onButtonTap,
                        width: constraints.maxWidth,
                        margin: const EdgeInsets.only(top: 16))
                  ],
                ),
              ),
            );
          },
        );

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: widget.backgroundColor,
        systemNavigationBarDividerColor: widget.backgroundColor,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarColor: widget.statusBarColor,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemStatusBarContrastEnforced: true,
      ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.backgroundColor,
      drawer: widget.drawer,
      resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
      appBar: !widget.showAppBar
          ? null
          : AppBar(
              toolbarHeight: widget.showAppBar ? null : 0,
              shadowColor: widget.appbarShadowColor ?? AppColors.transparent,
              elevation: widget.elevation,
              backgroundColor: widget.appBarColor,
              systemOverlayStyle: SystemUiOverlayStyle(
                systemNavigationBarColor: widget.backgroundColor,
                systemNavigationBarDividerColor: widget.backgroundColor,
                systemNavigationBarIconBrightness: Brightness.dark,
                statusBarColor: widget.statusBarColor,
                statusBarBrightness: Brightness.light,
                statusBarIconBrightness: Brightness.dark,
                systemStatusBarContrastEnforced: true,
              ),
              leadingWidth: widget.leadingWidth,
              leading: Builder(
                builder: (context) {
                  Widget widgetBuilder = const SizedBox.shrink();
                  if (widget.leading != null) {
                    widgetBuilder = widget.leading!;
                  } else if (widget.drawer != null) {
                    widgetBuilder = AppIconButton(
                      onPressed: context.openDrawer,
                      icon: Icons.menu_rounded,
                      size: 23,
                      color: [
                        AppColors.primaryDarkColor,
                        AppColors.primaryLightColor,
                        AppColors.primaryColor
                      ].contains(widget.appBarColor)
                          ? AppColors.white
                          : AppColors.primaryColor,
                    );
                  } else {
                    widgetBuilder = AppIconButton(
                      onPressed: () {
                        widget.onWillPop?.call().then((value) {
                          if (value != false) {
                            Navigator.of(context).canPop()
                                ? Navigator.of(context).pop()
                                : Navigator.of(context)
                                    .pushReplacementNamed(Routes.loginScreen);
                          }
                        });
                      },
                      size: 23,
                      color: [
                        AppColors.primaryDarkColor,
                        AppColors.primaryLightColor,
                        AppColors.primaryColor
                      ].contains(widget.appBarColor)
                          ? AppColors.white
                          : AppColors.primaryColor,
                      icon: Icons.arrow_back_ios,
                    );
                  }
                  return widgetBuilder;
                },
              ),
              titleSpacing: 0,
              centerTitle: true,
              title: widget.titleWidget ??
                  AppText(
                    widget.title ?? "",
                    textAlign: TextAlign.center,
                    size: 18,
                    fontWeight: FontWeight.w500,
                    maxLines: 1,
                    color: widget.titleColor ??
                        ([
                          AppColors.primaryDarkColor,
                          AppColors.primaryLightColor,
                          AppColors.primaryColor
                        ].contains(widget.appBarColor)
                            ? AppColors.white
                            : AppColors.primaryColor),
                  ),
              actions: widget.actions,
            ),
      body: SafeArea(
        top: widget.useSafeArea,
        bottom: widget.useSafeArea,
        child: widget.body,
      ),
      bottomNavigationBar: widget.bottomNavigationBar,
      floatingActionButton: widget.floatingActionButton,
      floatingActionButtonLocation: widget.floatingActionButtonLocation,
    );
  }
}
