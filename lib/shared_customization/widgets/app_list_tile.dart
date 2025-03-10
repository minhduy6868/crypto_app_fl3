import 'package:flutter/material.dart';

import '/app_common_data/app_colors.dart';
import 'texts/app_text.dart';

class AppListTile extends StatelessWidget {
  final Widget? iconWidget;
  final IconData? icon;
  final double? iconSize;
  final Color? iconColor;
  final Widget? leading;
  final Widget? trailing;
  final String? title;
  final Widget? subTitle;
  final Widget? titleWidget;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? margin;
  final double leadingHorizontalSpace;
  final double subTitleSpace;
  final bool showBottomDivider;
  final CrossAxisAlignment crossAxisAlignment;

  const AppListTile({
    super.key,
    this.iconWidget,
    this.icon,
    this.iconSize,
    this.iconColor,
    this.leading,
    this.trailing,
    this.title,
    this.subTitle,
    this.titleWidget,
    this.onTap,
    this.contentPadding,
    this.margin,
    this.leadingHorizontalSpace = 12,
    this.subTitleSpace = 8,
    this.showBottomDivider = false,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: AppColors.transparent,
        margin: margin,
        padding: contentPadding ?? EdgeInsets.zero,
        child: Row(
          crossAxisAlignment: crossAxisAlignment,
          children: [
            if (icon != null || iconWidget != null) ...[
              iconWidget ??
                  Icon(
                    icon,
                    size: iconSize,
                    color: iconColor ?? AppColors.primaryIconColor,
                  ),
              const SizedBox(width: 4)
            ],
            if (leading != null) leading!,
            if ((icon ?? leading) != null)
              SizedBox(
                width: leadingHorizontalSpace,
              ),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    titleWidget ?? AppText(title),
                    if (subTitle != null)
                      SizedBox(
                        height: subTitleSpace,
                      ),
                    subTitle ?? const SizedBox.shrink()
                  ]),
            ),
            trailing ?? const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
