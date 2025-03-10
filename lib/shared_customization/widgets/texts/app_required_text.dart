import 'package:flutter/material.dart';

import '/app_common_data/app_colors.dart';
import '/app_common_data/app_text_sytle.dart';

class AppRequiredText extends StatelessWidget {
  final String label;
  final Color textColor;
  final bool isRequired;
  final EdgeInsetsGeometry padding;
  const AppRequiredText(
    this.label, {
    Key? key,
    required this.isRequired,
    this.padding = EdgeInsets.zero,
    this.textColor = AppColors.primaryFieldLabelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: RichText(
          text: TextSpan(children: [
        TextSpan(
          text: label,
          style: AppTextStyle.fieldLabel.copyWith(color: textColor),
        ),
        if (isRequired)
          TextSpan(
              text: " *",
              style: AppTextStyle.fieldLabel.copyWith(
                color: AppColors.red,
                fontWeight: FontWeight.w500,
              ))
      ])),
    );
  }
}
