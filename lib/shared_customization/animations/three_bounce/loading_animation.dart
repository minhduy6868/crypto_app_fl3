import 'package:flutter/material.dart';
import 'package:crypto_app/app_common_data/app_colors.dart';
import 'package:crypto_app/shared_customization/animations/three_bounce/three_bounce.dart';

import 'fade_in_out.dart';

class LoadingAnimation extends StatelessWidget {
  final Color color;

  const LoadingAnimation({Key? key, this.color = AppColors.primaryIconColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: FadeInOut(
          visible: true,
          child: Center(child: ThreeBounce(color: color, size: 20.0))),
    );
  }
}
