import 'package:flutter/material.dart';

import '/app_common_data/app_colors.dart';

class AppRefreshIndicator extends StatelessWidget {
  const AppRefreshIndicator({
    super.key,
    required this.child,
    required this.onRefresh,
    this.backgroundColor = AppColors.white,
    this.color = AppColors.primaryColor,
  });
  final Future<void> Function() onRefresh;
  final Widget child;
  final Color backgroundColor;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      backgroundColor: backgroundColor,
      color: color,
      onRefresh: onRefresh,
      child: child,
    );
  }
}
