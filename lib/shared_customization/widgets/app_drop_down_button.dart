import 'package:flutter/material.dart';

import 'app_container.dart';
import 'custom_widgets/app_field.dart';
import 'texts/app_text.dart';
import '/shared_customization/data/basic_types.dart';
import '/app_common_data/app_colors.dart';

class DropdownItemModel<T> {
  final T? value;
  final bool enable;
  final String label;
  DropdownItemModel({
    required this.value,
    required this.label,
    this.enable = true,
  });
}

class AppDropdownButton<T> extends StatelessWidget {
  final ValueChanged<T?>? onChanged;
  final T? value;
  final List<DropdownItemModel<T>> items;
  final bool Function(T? item) selectedCondition;
  final ItemRenderCallBack<T?>? itemDisplayBuilder;
  final ItemRenderCallBack<T?>? itemDropdownBuilder;
  final ItemRenderCallBack<T?>? selectedItemBuilder;
  final String? label;
  final String? errorLabel;
  final String? placeholder;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? icon;
  final bool? isExpanded;
  final double radius;
  final bool isRequired;
  final Color? borderColor;
  final double? placeholderSize;
  final Color? backgroundColor;

  const AppDropdownButton({
    super.key,
    required this.onChanged,
    required this.value,
    required this.items,
    required this.selectedCondition,
    this.selectedItemBuilder,
    this.itemDropdownBuilder,
    this.itemDisplayBuilder,
    this.label,
    this.errorLabel,
    this.placeholder,
    this.padding,
    this.margin,
    this.contentPadding =
        const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
    this.icon,
    this.isExpanded = true,
    this.radius = 6,
    this.isRequired = true,
    this.borderColor,
    this.placeholderSize = 14,
    this.backgroundColor = AppColors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      color: AppColors.transparent,
      child: AppField(
        errorLabel: errorLabel,
        label: label,
        isRequired: isRequired,
        child: AppContainer(
          padding: contentPadding ?? EdgeInsets.zero,
          color: backgroundColor,
          border: Border.all(
              color: errorLabel != null
                  ? AppColors.red
                  : (borderColor != null)
                      ? borderColor!
                      : AppColors.primaryBorderColor,
              width: 1),
          borderRadius: BorderRadius.circular(radius),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<T>(
              icon: icon ??
                  const Icon(Icons.keyboard_arrow_down_rounded,
                      size: 28, color: AppColors.primaryIconColor),
              padding: EdgeInsets.zero,
              value: value,
              onChanged: onChanged,
              hint: AppText(placeholder,
                  color: AppColors.primaryHintText, size: placeholderSize!),
              items: [
                DropdownMenuItem<T>(
                  enabled: false,
                  value: null,
                  child: AppText(placeholder, color: AppColors.primaryHintText),
                ),
                ...items.map((item) {
                  if (item.value != null && selectedCondition(item.value)) {
                    return DropdownMenuItem<T>(
                      enabled: item.enable,
                      value: item.value,
                      child: selectedItemBuilder?.call(item.value) ??
                          AppText(
                            item.label,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                    );
                  }
                  return DropdownMenuItem<T>(
                    enabled: item.enable,
                    value: item.value,
                    child: itemDropdownBuilder?.call(item.value) ??
                        AppText(
                          item.label,
                          color: AppColors.black,
                        ),
                  );
                }).toList()
              ],
              selectedItemBuilder: (context) => [
                const SizedBox.shrink(),
                ...items.map((item) {
                  if (!item.enable) return const SizedBox.shrink();
                  return itemDisplayBuilder?.call(item.value) ??
                      Align(
                          alignment: Alignment.centerLeft,
                          child: AppText(item.label));
                }).toList()
              ],
              elevation: 2,
              isExpanded: isExpanded!,
              dropdownColor: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
