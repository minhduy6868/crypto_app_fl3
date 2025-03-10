import 'package:flutter/material.dart';
import '/app_common_data/app_colors.dart';

class CircularLoadingAnimation extends StatelessWidget {
  final Color color;
  const CircularLoadingAnimation({
    super.key,
    this.color = AppColors.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: color,
      strokeWidth: 4,
    );
  }
}
