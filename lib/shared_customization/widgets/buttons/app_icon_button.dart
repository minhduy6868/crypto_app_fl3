import 'package:flutter/material.dart';

import '../app_container.dart';
import '/app_common_data/app_colors.dart';

class AppIconButton extends StatelessWidget {
  final Color color;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final IconData icon;
  final double size;
  final Color? backgroundColor;

  const AppIconButton({
    super.key,
    this.color = AppColors.primaryIconColor,
    this.padding = const EdgeInsets.all(4),
    this.margin = EdgeInsets.zero,
    required this.onPressed,
    this.onLongPress,
    required this.icon,
    this.size = 28,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      onLongPress: onLongPress,
      child: AppContainer(
          padding: padding,
          margin: margin,
          borderRadius: BorderRadius.circular(100),
          color: backgroundColor,
          child: Icon(icon, size: size, color: color)),
    );
  }
}
