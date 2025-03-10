import 'package:flutter/material.dart';

import '/shared_customization/extensions/string_ext.dart';
import '../app_container.dart';
import '../texts/app_required_text.dart';
import '/app_common_data/app_colors.dart';
import '/app_common_data/app_text_sytle.dart';
import '/generated/assets.gen.dart';

class AppField extends StatelessWidget {
  final String? errorLabel;
  final String? label;
  final bool isRequired;
  final Widget child;

  const AppField({
    super.key,
    required this.errorLabel,
    required this.label,
    required this.isRequired,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        (label != null && label.isNotEmptyOrNull)
            ? AppRequiredText(label!,
                isRequired: isRequired,
                padding: const EdgeInsets.only(bottom: 6))
            : const SizedBox.shrink(),
        child,
        if (errorLabel.isNotEmptyOrNull)
          ...([
            const SizedBox(height: 4),
            RichText(
                text: TextSpan(children: [
              WidgetSpan(
                  child: AppContainer(
                      margin: const EdgeInsets.only(right: 4),
                      child: Assets.icons.icErrorTextField.svg())),
              TextSpan(
                  text: errorLabel ?? '',
                  style: AppTextStyle.defaultStyle
                      .copyWith(color: AppColors.red, fontSize: 12))
            ])),
            const SizedBox(height: 2),
          ])
      ],
    );
  }
}
