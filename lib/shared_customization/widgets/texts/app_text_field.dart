// ignore_for_file: deprecated_member_use_from_same_package

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/shared_customization/enums/keyboard_type.dart';
import '/shared_customization/extensions/date_time_ext.dart';
import '/shared_customization/extensions/string_ext.dart';
import '/shared_customization/helpers/utilizations/validators.dart';
import '../app_container.dart';
import '../custom_widgets/app_field.dart';
import 'app_text.dart';
import '/app_common_data/app_text_sytle.dart';
import '/app_common_data/app_colors.dart';
import '/app_common_data/common_data/global_variable.dart';
import '/generated/translations.g.dart';
import '/generated/assets.gen.dart';

class AppTextField extends StatefulWidget {
  final EdgeInsetsGeometry padding;
  final String? label;
  final TextEditingController? controller;
  final String? errorLabel;
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
  final bool isRequiredField;
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

  const AppTextField({
    super.key,
    //
    this.padding = EdgeInsets.zero,
    this.label,
    this.controller,
    this.errorLabel,
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
    this.isRequiredField = true,
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
    this.prefixIconConstraints,
    this.suffixIconConstraints,
    this.onGetFirstDate,
    this.onGetLastDate,
    //
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late TextEditingController controller;
  late bool obscureText = widget.obscureText;
  Widget? suffixIconByKeyboardType;
  OutlineInputBorder? border;
  bool isDefaultSuffixIcon = false;
  bool isShowClearButton = false;

  @override
  void initState() {
    // Init controller
    controller = widget.controller ?? TextEditingController();
    if (widget.initValue.isNotEmptyOrNull) {
      controller.value = TextEditingValue(text: widget.initValue!);
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        widget.onChanged(widget.initValue!);
      });
    }

    // Init border
    border = OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: widget.defaultBorderColor),
        borderRadius: widget.borderRadius);

    // Init suffixIconByKeyboardType
    switch (widget.keyboardType) {
      case KeyboardType.datetime:
        suffixIconByKeyboardType = _buildSuffixIcon(
            onTap: () async {
              final currentLocale = Localizations.localeOf(context);
              DateTime? initialDate;
              DateTime lastDate =
                  widget.onGetLastDate?.call() ?? DateTime.now();
              DateTime firstDate =
                  widget.onGetFirstDate?.call() ?? DateTime(1900);
              try {
                if (Validators.validateDateTimeFormat(controller.text)
                    .isEmptyOrNull) {
                  initialDate =
                      controller.text.toDateTime(locale: currentLocale) ??
                          DateTime.now();
                } else {
                  initialDate = DateTime.now();
                }
              } catch (err) {
                initialDate = DateTime.now();
              }
              DateTime? dateTime = await showDatePicker(
                  locale: currentLocale,
                  context: context,
                  initialDate: initialDate,
                  firstDate:
                      firstDate.isBefore(lastDate) ? firstDate : lastDate,
                  lastDate: firstDate.isBefore(lastDate) ? lastDate : firstDate,
                  helpText: '',
                  builder: (context, child) => Theme(
                        data: Theme.of(context).copyWith(
                            colorScheme: const ColorScheme.light(
                          primary: AppColors.primaryColor,
                          onPrimary: AppColors.white,
                          onSurface: AppColors.black,
                        )),
                        child: Container(
                          child: child,
                        ),
                      ),
                  cancelText: tr(LocaleKeys.CommonAction_Cancel),
                  confirmText: tr(LocaleKeys.CommonAction_Confirm),
                  errorFormatText:
                      tr(LocaleKeys.CommonValidation_DateTimeFormatIsInvalid),
                  errorInvalidText:
                      tr(LocaleKeys.CommonValidation_DateTimeFormatIsInvalid));
              if (dateTime != null) {
                widget
                    .onChanged(dateTime.toDayMonthYear(locale: currentLocale));
                controller.text =
                    dateTime.toDayMonthYear(locale: currentLocale);
              }
            },
            child: const Icon(Icons.calendar_month_rounded,
                size: 24, color: AppColors.primaryColor));
        break;
      case KeyboardType.phone:
        suffixIconByKeyboardType = _buildSuffixIcon(
            child: const Icon(Icons.phone_enabled_rounded,
                size: 22, color: AppColors.primaryColor));
        break;
      case KeyboardType.money:
        suffixIconByKeyboardType = _buildSuffixIcon(
            child: AppText(CURRENCY,
                color: AppColors.primaryColor, fontWeight: FontWeight.w600));
        break;
      default:
        if (!obscureText) {
          isDefaultSuffixIcon = true;
          suffixIconByKeyboardType = _buildSuffixIcon(
              onTap: () {
                controller.clear();
                widget.onChanged('');
              },
              child: const Icon(Icons.cancel_rounded,
                  size: 22, color: AppColors.primaryColor));
        }
    }
    if (isDefaultSuffixIcon) {
      controller.addListener(() {
        if (isShowClearButton != controller.text.isNotEmptyOrNull) {
          setState(() {
            isShowClearButton = controller.text.isNotEmptyOrNull;
          });
        }
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    controller.removeListener(() {});
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.zero,
      child: AppField(
        errorLabel: widget.errorLabel,
        label: widget.label,
        isRequired: widget.isRequiredField,
        child: AppContainer(
          color: widget.enabled
              ? (widget.backgroundColor ?? AppColors.transparent)
              : AppColors.transparent,
          borderRadius: widget.borderRadius,
          child: TextField(
            autofocus: widget.autofocus,
            showCursor: widget.enabled,
            onTap: widget.onTap,
            readOnly: widget.readOnly,
            cursorColor: AppColors.primaryColor,
            controller: controller,
            style: widget.textStyle,
            decoration: InputDecoration(
              errorText: widget.errorLabel.isNotEmptyOrNull ? '' : null,
              errorMaxLines: 1,
              errorStyle: const TextStyle(height: 0, fontSize: 0),
              isDense: true,
              hintStyle:
                  widget.textStyle.copyWith(color: AppColors.primaryHintText),
              hintText: widget.placeholder ??
                  tr(LocaleKeys.Placeholder_InputFieldPlaceholder, namedArgs: {
                    "fieldName": widget.label?.toLowerCase() ?? ''
                  }),
              contentPadding: widget.contentPadding,
              border: border!.copyWith(
                  borderRadius: widget.borderRadius,
                  borderSide: border!.borderSide.copyWith(
                      color: widget.errorLabel.isNotEmptyOrNull
                          ? AppColors.primaryError
                          : border!.borderSide.color)),
              enabledBorder:
                  border!.copyWith(borderRadius: widget.borderRadius),
              errorBorder: border!.copyWith(
                  borderRadius: widget.borderRadius,
                  borderSide: border!.borderSide
                      .copyWith(color: AppColors.primaryError)),
              focusedErrorBorder: border!.copyWith(
                  borderRadius: widget.borderRadius,
                  borderSide:
                      border!.borderSide.copyWith(color: AppColors.red)),
              focusedBorder: border!.copyWith(
                  borderRadius: widget.borderRadius,
                  borderSide: border!.borderSide
                      .copyWith(color: widget.activeBorderColor)),
              prefixIcon: widget.prefixIcon != null
                  ? Align(alignment: Alignment.center, child: widget.prefixIcon)
                  : null,
              suffixIcon: Builder(builder: (context) {
                if (widget.suffixIcon != null) {
                  return Align(
                      alignment: Alignment.center, child: widget.suffixIcon);
                }
                if (suffixIconByKeyboardType != null && !isDefaultSuffixIcon) {
                  return suffixIconByKeyboardType!;
                }
                if (widget.obscureText) {
                  return InkWell(
                    onTap: () => setState(() => obscureText = !obscureText),
                    child: Align(
                        alignment: Alignment.center,
                        child: obscureText
                            ? Assets.icons.icEye.svg(
                                color: AppColors.primaryIconColor,
                                width: 22,
                                height: 22)
                            : Assets.icons.icEyeSlash.svg(
                                color: AppColors.primaryIconColor,
                                width: 22,
                                height: 22)),
                  );
                }
                return isShowClearButton
                    ? suffixIconByKeyboardType!
                    : EMPTY_WIDGET;
              }),
              prefixIconConstraints: widget.prefixIconConstraints ??
                  const BoxConstraints(maxHeight: 42, maxWidth: 56),
              suffixIconConstraints: widget.suffixIconConstraints ??
                  const BoxConstraints(maxHeight: 42, maxWidth: 56),
            ),
            onChanged: (value) {
              widget.autoTrim
                  ? widget.onChanged.call(value.trim())
                  : widget.onChanged(value);
            },
            textInputAction: widget.textInputAction,
            onSubmitted: widget.onSubmit ??
                (widget.keyboardType == KeyboardType.visiblePassword &&
                        widget.textInputAction == TextInputAction.newline
                    ? (_) {
                        FocusScope.of(context).nextFocus();
                      }
                    : null),
            keyboardType: widget.keyboardType.inputType,
            obscureText: obscureText,
            obscuringCharacter: "•",
            minLines: widget.minLines,
            maxLines: widget.obscureText ? 1 : widget.maxLines,
            inputFormatters: [
              ///
              /// phone number
              ///
              if (widget.keyboardType == KeyboardType.phone)
                // FilteringTextInputFormatter.allow(RegExp(r'[0-9*#+() .-]+')),
                FilteringTextInputFormatter.allow(RegExp(r'[0-9+() .-]+')),

              ///
              /// int number
              ///
              if (widget.keyboardType == KeyboardType.int)
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]+')),

              ///
              /// double number
              ///
              if (widget.keyboardType == KeyboardType.double)
                FilteringTextInputFormatter.allow(RegExp(r'[0-9.]+')),

              ///
              /// money number
              ///
              if (widget.keyboardType == KeyboardType.money)
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]+')),
            ],
            focusNode: widget.focusNode,
            enabled: widget.enabled,
          ),
        ),
      ),
    );
  }

  Widget _buildSuffixIcon({VoidCallback? onTap, required Widget child}) =>
      GestureDetector(
          onTap: onTap,
          child: Align(alignment: Alignment.center, child: child));
}
