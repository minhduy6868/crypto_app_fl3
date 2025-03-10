import 'package:flutter/material.dart';

import '/app_common_data/app_colors.dart';
import '/shared_customization/enums/divider_direction.dart';

class AppDivider extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final DividerDirection direction;
  final Color color;
  final double thinkness;
  final double? indent;
  final double? endIndent;

  const AppDivider({
    super.key,
    required this.direction,
    this.padding = EdgeInsets.zero,
    this.color = AppColors.primaryBorderColor,
    this.thinkness = 0.5,
    this.indent,
    this.endIndent,
  });

  const AppDivider.vertical({
    super.key,
    this.color = AppColors.primaryBorderColor,
    this.padding = EdgeInsets.zero,
    this.thinkness = 0.5,
    this.indent,
    this.endIndent,
  }) : direction = DividerDirection.vertical;

  const AppDivider.horizontal({
    super.key,
    this.color = AppColors.primaryBorderColor,
    this.padding = EdgeInsets.zero,
    this.thinkness = 0.5,
    this.indent,
    this.endIndent,
  }) : direction = DividerDirection.horizontal;

  @override
  Widget build(BuildContext context) {
    Widget widget = const SizedBox.shrink();
    switch (direction) {
      case DividerDirection.horizontal:
        widget = Divider(
          color: color,
          thickness: thinkness,
          height: thinkness,
          indent: indent,
          endIndent: endIndent,
        );
        break;
      case DividerDirection.vertical:
        widget = VerticalDivider(
          color: color,
          indent: indent,
          endIndent: endIndent,
          thickness: thinkness,
          width: thinkness,
        );
        break;
    }
    return Padding(padding: padding, child: widget);
  }
}
