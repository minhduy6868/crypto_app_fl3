import 'package:flutter/material.dart';

import '/app_common_data/app_colors.dart';
import '/app_common_data/app_text_sytle.dart';
import '/app_common_data/common_data/global_variable.dart';
import '/shared_customization/data/basic_types.dart';
import '/shared_customization/enums/keyboard_type.dart';
import '/shared_customization/extensions/string_ext.dart';
import '../texts/app_text_field.dart';

class AppTextFormField extends FormField<String> {
  final EdgeInsetsGeometry padding;
  final String? label;
  final TextEditingController? controller;
  final String? placeholder;
  final ValueChanged<String> onChanged;
  final TextInputAction textInputAction;
  final ValueChanged<String>? onSubmit;
  final String? initValue;
  final KeyboardType keyboardType;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextStyle textStyle;
  final bool autoTrim;
  final int? minLines;
  final int? maxLines;
  final Color activeBorderColor;
  final Color defaultBorderColor;
  final EdgeInsetsGeometry contentPadding;
  final FocusNode? focusNode;
  final BorderRadius borderRadius;
  final bool enabled;
  final bool readOnly;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final bool autofocus;
  final BoxConstraints? prefixIconConstraints;
  final BoxConstraints? suffixIconConstraints;
  final DateTime Function()? onGetFirstDate;
  final DateTime Function()? onGetLastDate;
  // For FormField
  final List<TypeValidation<String>> validations;
  final void Function(FormFieldState<String>)? validationCall;

  AppTextFormField({
    super.key,
    //
    this.padding = EdgeInsets.zero,
    this.label,
    this.controller,
    this.placeholder,
    required this.onChanged,
    this.textInputAction = TextInputAction.next,
    this.onSubmit,
    this.initValue,
    this.keyboardType = KeyboardType.text,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.textStyle = AppTextStyle.defaultStyle,
    this.autoTrim = true,
    this.minLines,
    this.maxLines,
    this.activeBorderColor = AppColors.primaryColor,
    this.defaultBorderColor = AppColors.primaryBorderColor,
    this.contentPadding =
        const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
    this.focusNode,
    this.borderRadius =
        const BorderRadius.all(Radius.circular(BORDER_RADIUS_VALUE)),
    this.enabled = true,
    this.readOnly = false,
    this.onTap,
    this.backgroundColor = AppColors.white,
    this.autofocus = false,
    this.onGetFirstDate,
    this.onGetLastDate,
    this.prefixIconConstraints,
    this.suffixIconConstraints,
    // For FormField
    required this.validations,
    this.validationCall,
    //
  }) : super(
            initialValue: initValue,
            enabled: enabled,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (str) {
              return validations
                  .map((validateFunc) => validateFunc(str))
                  .firstWhere((element) => element.isNotEmptyOrNull,
                      orElse: () => null);
            },
            builder: (validator) {
              validationCall?.call(validator);
              return AppTextField(
                initValue: initValue,
                label: label,
                controller: controller,
                padding: padding,
                placeholder: placeholder,
                textInputAction: textInputAction,
                keyboardType: keyboardType,
                obscureText: obscureText,
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
                textStyle: textStyle,
                autoTrim: autoTrim,
                minLines: minLines,
                maxLines: maxLines,
                activeBorderColor: activeBorderColor,
                backgroundColor: backgroundColor,
                borderRadius: borderRadius,
                contentPadding: contentPadding,
                defaultBorderColor: defaultBorderColor,
                readOnly: readOnly,
                onSubmit: onSubmit,
                onTap: onTap,
                autofocus: autofocus,
                enabled: enabled,
                focusNode: focusNode,
                onChanged: (_) {
                  validator.didChange(_);
                  onChanged(_);
                },
                isRequiredField: validations
                    .map((validateFunc) => validateFunc(''))
                    .any((element) => element.isNotEmptyOrNull),
                errorLabel:
                    validator.isValid == false ? validator.errorText : null,
                prefixIconConstraints: prefixIconConstraints,
                suffixIconConstraints: suffixIconConstraints,
                onGetFirstDate: onGetFirstDate,
                onGetLastDate: onGetLastDate,
              );
            });
}
