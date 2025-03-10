import 'package:flutter/material.dart';
import '/app_common_data/app_colors.dart';

enum ButtonType { primary, white, red, disable }

extension ButtonTypeExt on ButtonType {
  Color get backgroundColor => {
        ButtonType.primary: AppColors.primaryColor,
        ButtonType.white: AppColors.white,
        ButtonType.disable: AppColors.primaryDisableButton,
        ButtonType.red: AppColors.primaryError,
      }[this]!;

  Color get textColor => {
        ButtonType.primary: AppColors.white,
        ButtonType.white: AppColors.primaryColor,
        ButtonType.disable: AppColors.white,
        ButtonType.red: AppColors.white,
      }[this]!;

  Color get borderColor => {
        ButtonType.primary: AppColors.transparent,
        ButtonType.white: AppColors.primaryColor,
        ButtonType.disable: AppColors.transparent,
        ButtonType.red: AppColors.transparent,
      }[this]!;

  List<double> get stops => {
        ButtonType.primary: [0.0, 1.0],
        ButtonType.white: [0.0, 1.0],
        ButtonType.disable: [0.0, 1.0],
        ButtonType.red: [0.0, 1.0],
      }[this]!;
}
