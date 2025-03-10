import 'package:flutter/material.dart';

import '/shared_customization/data/basic_types.dart';
import '/app_common_data/common_data/global_variable.dart';
import '/app_common_data/app_text_sytle.dart';
import '/app_common_data/app_colors.dart';
import '/shared_customization/enums/divider_direction.dart';
import '/shared_customization/extensions/string_ext.dart';
import 'app_divider.dart';
import 'texts/app_text.dart';

class PopupMenuItemModel<T> {
  T value;
  String label;
  Widget? icon;
  final UpdateStyleCallBack? onUpdateStyle;
  PopupMenuItemModel({
    required this.value,
    required this.label,
    this.onUpdateStyle,
    this.icon,
  });
}

class AppPopUpMenuButton<T> extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Widget? child;
  final List<PopupMenuItemModel<T>> items;
  final OnItemTap<T> onItemSelected;
  final VoidCallback? disableTapping;
  final bool showDivider;

  const AppPopUpMenuButton({
    super.key,
    this.icon = Icons.expand_more,
    this.iconColor = AppColors.primaryIconColor,
    this.child,
    required this.items,
    required this.onItemSelected,
    this.showDivider = true,
    this.disableTapping,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox.shrink();
    return GestureDetector(
      onTap: disableTapping,
      child: PopupMenuButton<T>(
          position: PopupMenuPosition.under,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(BORDER_RADIUS_VALUE)),
          splashRadius: 20,
          onSelected: onItemSelected,
          enabled: disableTapping == null,
          onOpened: disableTapping,
          itemBuilder: (context) => items.asMap().entries.toList().fold(
              [],
              (previousValue, entry) => [
                    ...previousValue,
                    if (showDivider && entry.key > 0)
                      PopupMenuItem<T>(
                        enabled: false,
                        padding: EdgeInsets.zero,
                        height: 1,
                        child: const AppDivider(
                            direction: DividerDirection.horizontal),
                      ),
                    PopupMenuItem<T>(
                      value: entry.value.value,
                      child: PopUpMenuItemWidget(
                        label: entry.value.label,
                        icon: entry.value.icon,
                        onUpdateStyle: entry.value.onUpdateStyle,
                      ),
                    ),
                  ]),
          child: child ??
              Container(
                color: Colors.transparent,
                padding: const EdgeInsets.fromLTRB(12, 8, 4, 8),
                child: Icon(
                  Icons.expand_more,
                  color: iconColor,
                  size: 24,
                ),
              )),
    );
  }
}

class PopUpMenuItemWidget extends StatelessWidget {
  final String? label;
  final Widget? icon;
  final UpdateStyleCallBack? onUpdateStyle;

  const PopUpMenuItemWidget({
    required this.label,
    this.icon,
    this.onUpdateStyle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (icon != null) icon!,
        if (icon != null) const SizedBox(width: 10),
        if (label.isNotEmptyOrNull)
          AppText(
            label,
            style: onUpdateStyle?.call(AppTextStyle.defaultStyle) ??
                AppTextStyle.defaultStyle,
          ),
      ],
    );
  }
}
