import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/shared_customization/extensions/string_ext.dart';
import 'app_container.dart';
import 'app_divider.dart';
import 'app_list_tile.dart';
import 'texts/app_text.dart';
import '/shared_customization/data/basic_types.dart';
import '/app_common_data/app_colors.dart';
import '/app_common_data/app_text_sytle.dart';
import '/generated/translations.g.dart';

class DrawerModel {
  final String label;
  final IconData? icon;
  final String? svgUrl;
  final VoidCallback? onPressed;
  final bool showBottomDivider;
  final UpdateStyleCallBack? onStyleUpdate;

  DrawerModel({
    required this.label,
    this.onPressed,
    this.icon,
    this.svgUrl,
    this.showBottomDivider = false,
    this.onStyleUpdate,
  });
}

class AppDrawer extends StatelessWidget {
  final double? drawerWidth;
  final Widget? drawerHeader;
  final Widget? drawerFooter;
  final List<DrawerModel> items;
  final Color backgroundColor;
  final String? title;
  final IconData? closeIcon;
  final ScrollPhysics? scrollPhysics;
  final VoidCallback? onSignOut;
  final TextStyle? textStyle;

  const AppDrawer({
    super.key,
    this.drawerWidth,
    this.drawerHeader,
    this.drawerFooter,
    required this.items,
    this.backgroundColor = AppColors.primaryColor,
    this.title,
    this.closeIcon,
    this.scrollPhysics = const NeverScrollableScrollPhysics(),
    this.onSignOut,
    this.textStyle = AppTextStyle.defaultStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        width: drawerWidth,
        backgroundColor: backgroundColor,
        child: Column(
          children: [
            drawerHeader ??
                AppContainer(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(title ?? tr(LocaleKeys.CommonData_Menu),
                            size: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColors.white),
                        GestureDetector(
                          onTap: Navigator.of(context).pop,
                          child: Icon(
                            closeIcon ?? Icons.close,
                            size: 24,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    )),
            Expanded(
                child: ListView(
              physics: scrollPhysics,
              children: [
                AppContainer(
                  height: MediaQuery.of(context).size.height,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  color: AppColors.primaryBackground,
                  child: Wrap(
                    runSpacing: 8,
                    children: items
                        .map((e) => Column(
                              children: [
                                AppListTile(
                                  iconWidget: e.svgUrl.isNotEmptyOrNull
                                      ? SvgPicture.asset(e.svgUrl!)
                                      : null,
                                  icon: e.icon,
                                  leadingHorizontalSpace: 10,
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 16),
                                  titleWidget: AppText(
                                    e.label,
                                    style: (e.onStyleUpdate?.call(
                                            AppTextStyle.defaultStyle)) ??
                                        (textStyle?.copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600)),
                                  ),
                                  onTap: e.onPressed,
                                ),
                                if (e.showBottomDivider)
                                  const AppDivider.horizontal(thinkness: 1),
                              ],
                            ))
                        .toList(),
                  ),
                )
              ],
            )),
            drawerFooter ??
                AppContainer(
                  color: AppColors.primaryBackground,
                  padding: const EdgeInsets.all(50),
                  child: GestureDetector(
                    onTap: onSignOut,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.power_settings_new,
                                  color: AppColors.primaryColor,
                                ),
                                const SizedBox(width: 12),
                                AppText(tr(LocaleKeys.CommonAction_Logout),
                                    size: 16,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primaryColor),
                              ]),
                        ],
                      ),
                    ),
                  ),
                )
          ],
        ),
      ),
    );
  }
}
