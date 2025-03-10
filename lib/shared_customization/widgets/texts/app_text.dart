import 'package:flutter/material.dart';

import '/app_common_data/app_text_sytle.dart';
import '/shared_customization/extensions/string_ext.dart';

// ignore: must_be_immutable
class AppText extends StatelessWidget {
  final String? text;
  TextStyle? style;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final TextOverflow? overflow;
  final int? maxLines;
  final bool trim;
  final EdgeInsetsGeometry padding;

  AppText(
    this.text, {
    super.key,
    this.style = AppTextStyle.defaultStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.overflow,
    this.maxLines,
    this.trim = true,
    this.padding = EdgeInsets.zero,
    double? size,
    Color? color,
    FontWeight? fontWeight,
  }) {
    if (size != null) style = style!.copyWith(fontSize: size);
    if (color != null) style = style!.copyWith(color: color);
    if (fontWeight != null) style = style!.copyWith(fontWeight: fontWeight);
  }

  AppText.error(
    this.text, {
    super.key,
    this.style = AppTextStyle.error,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.overflow,
    this.maxLines,
    this.trim = true,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        trim && text.isNotEmptyOrNull ? text!.trim() : text ?? '',
        textAlign: textAlign,
        textDirection: textDirection,
        locale: locale,
        style: style?.copyWith(decoration: TextDecoration.none),
        overflow:
            maxLines != null ? (overflow ?? TextOverflow.ellipsis) : overflow,
        maxLines: maxLines,
      ),
    );
  }
}
