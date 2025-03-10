import 'package:flutter/material.dart';

import '/app_common_data/app_colors.dart';

class AppCheckBox extends StatelessWidget {
  final String? lable;
  final bool value;
  final ValueChanged<bool?> onChanged;
  final Color activeColor;
  final Color? checkColor;
  final double? splashRadius;
  final OutlinedBorder? shape;
  final BorderSide? side;
  final bool autofocus;
  final FocusNode? focusNode;
  final EdgeInsetsGeometry padding;

  const AppCheckBox({
    super.key,
    required this.value,
    required this.onChanged,
    this.lable,
    this.activeColor = AppColors.primaryColor,
    this.checkColor,
    this.splashRadius,
    this.shape,
    this.side,
    this.autofocus = false,
    this.focusNode,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Checkbox(
        autofocus: autofocus,
        focusNode: focusNode,
        value: value,
        onChanged: onChanged,
        activeColor: activeColor,
        checkColor: checkColor,
        splashRadius: splashRadius,
        shape: shape ??
            const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(2))),
        side: side,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
      ),
    );
  }
}
