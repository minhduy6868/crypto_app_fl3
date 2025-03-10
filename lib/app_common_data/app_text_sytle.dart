import 'package:flutter/material.dart';

import '/generated/fonts.gen.dart';
import 'app_colors.dart';

class AppTextStyle {
  AppTextStyle._();

  static const defaultTextStyle = TextStyle(
      fontSize: 14, color: AppColors.titleTextAuth, fontFamily: 'Montserrat');
  static const TextStyle defaultStyle = TextStyle(
      fontSize: 14,
      color: AppColors.primaryNormalText,
      fontFamily: FontFamily.notoSans,
      fontWeight: FontWeight.w400);

  static const TextStyle error = TextStyle(
      fontSize: 12,
      color: AppColors.primaryError,
      fontFamily: FontFamily.notoSans,
      fontWeight: FontWeight.w400);

  static const TextStyle buttonText = TextStyle(
      fontSize: 14,
      color: AppColors.white,
      fontFamily: FontFamily.notoSans,
      fontWeight: FontWeight.w600);

  static const TextStyle titleText = TextStyle(
      fontSize: 17,
      color: AppColors.primaryTitleText,
      fontFamily: FontFamily.notoSans,
      fontWeight: FontWeight.w700);

  static const TextStyle bodyText = TextStyle(
      fontSize: 15,
      color: AppColors.primaryBodyText,
      fontFamily: FontFamily.notoSans,
      fontWeight: FontWeight.w500);

  static const TextStyle fieldLabel = TextStyle(
      fontSize: 14,
      color: AppColors.primaryFieldLabelText,
      fontFamily: FontFamily.notoSans,
      fontWeight: FontWeight.w600);

  static const TextStyle description = TextStyle(
      fontSize: 12,
      color: AppColors.primaryNormalText,
      fontFamily: FontFamily.notoSans,
      fontWeight: FontWeight.w400);
}
