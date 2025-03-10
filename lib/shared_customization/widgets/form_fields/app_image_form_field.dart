import 'dart:io';
import 'package:flutter/material.dart';

import '/app_common_data/common_data/global_variable.dart';
import '../custom_widgets/app_field.dart';
import '/shared_customization/data/basic_types.dart';
import '/shared_customization/extensions/string_ext.dart';
import '../custom_widgets/app_upload_image.dart';

class AppImageFormField extends FormField<File> {
  final String? label;
  final String? initialUrl;
  final File? initialFile;
  final ValueChanged<File> onChanged;
  final double? imageWidth;
  final double? imageHeight;
  final BorderRadius? borderRadius;
  final String? imagePlaceholderAssetUrl;
  final EdgeInsetsGeometry padding;
  final Alignment alignment;
  // For FormField
  final List<TypeValidation<File>> validations;
  final void Function(FormFieldState<File>)? validationCall;

  AppImageFormField({
    super.key,
    this.initialUrl,
    this.label,
    required this.onChanged,
    this.initialFile,
    this.imageWidth,
    this.imageHeight,
    this.borderRadius,
    this.imagePlaceholderAssetUrl,
    this.padding = EdgeInsets.zero,
    this.alignment = Alignment.center,
    // For FormField
    required this.validations,
    this.validationCall,
  }) : super(
            initialValue: initialFile,
            validator: (file) {
              if (file == null && initialUrl.isNotEmptyOrNull) return null;
              return validations
                  .map((validateFunc) => validateFunc(file))
                  .firstWhere((element) => element.isNotEmptyOrNull,
                      orElse: () => null);
            },
            builder: (validator) {
              validationCall?.call(validator);
              return Padding(
                padding: padding,
                child: AppField(
                  label: label,
                  isRequired: validations
                      .map((validateFunc) => validateFunc(null))
                      .any((element) => element.isNotEmptyOrNull),
                  errorLabel: !validator.isValid ? validator.errorText : null,
                  child: Align(
                    alignment: alignment,
                    child: AppUploadImage(
                      initialUrl: initialUrl,
                      initialFile: initialFile,
                      width: imageWidth,
                      height: imageHeight,
                      fit: BoxFit.cover,
                      imagePlaceholderAssetUrl: imagePlaceholderAssetUrl,
                      borderRadius: borderRadius ??
                          BorderRadius.circular(BORDER_RADIUS_VALUE),
                      onSelectFile: (_) {
                        validator.didChange(_);
                        onChanged(_);
                      },
                    ),
                  ),
                ),
              );
            });
}
