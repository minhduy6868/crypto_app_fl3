import 'package:flutter/material.dart';

import '../app_container.dart';
import '../texts/app_text.dart';
import '/app_common_data/common_data/global_variable.dart';

class AppTextButton extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final Color? backgroundColor;
  final AppText text;

  const AppTextButton({
    super.key,
    this.padding = const EdgeInsets.all(8),
    this.margin = EdgeInsets.zero,
    required this.onPressed,
    this.onLongPress,
    this.backgroundColor,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      onLongPress: onLongPress,
      child: AppContainer(
          padding: padding,
          margin: margin,
          borderRadius: BorderRadius.circular(BORDER_RADIUS_VALUE),
          color: backgroundColor,
          child: text),
    );
  }
}
