import 'package:flutter/material.dart';

import '/app_common_data/app_colors.dart';
import '/app_common_data/common_data/global_variable.dart';
import 'app_container.dart';

class AppCard extends StatelessWidget {
  final Color backgroundColor;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final BorderRadius borderRadius;
  final VoidCallback? onTap;
  final Widget child;
  final Border? border;
  final double elevation;
  final Color? shadowColor;

  const AppCard({
    super.key,
    this.backgroundColor = AppColors.white,
    this.padding = const EdgeInsets.all(16),
    this.margin = EdgeInsets.zero,
    this.borderRadius =
        const BorderRadius.all(Radius.circular(BORDER_RADIUS_VALUE)),
    this.onTap,
    this.border,
    required this.child,
    this.elevation = 6,
    this.shadowColor = AppColors.black,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: elevation,
        shadowColor: shadowColor,
        child: AppContainer(
          border: border,
          color: backgroundColor,
          padding: padding,
          margin: margin,
          borderRadius: borderRadius,
          child: child,
        ),
      ),
    );
  }
}
