import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:crypto_app/generated/translations.g.dart';

enum Gender { male, female, other }

extension GenderExt on Gender {
  String get label => {
        Gender.male: tr(LocaleKeys.CommonData_Male),
        Gender.female: tr(LocaleKeys.CommonData_Female),
        Gender.other: tr(LocaleKeys.CommonData_OtherGender),
      }[this]!;
  IconData get icon => {
        Gender.male: Icons.male_rounded,
        Gender.female: Icons.female_rounded,
        Gender.other: Icons.transgender_rounded,
      }[this]!;
}
