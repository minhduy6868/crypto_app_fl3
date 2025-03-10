import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '/app_common_data/common_data/global_key_variable.dart';
import '/app_common_data/enums/app_language.dart';
import '/shared_customization/extensions/build_context.ext.dart';
import '/shared_customization/data/regular_expressions.dart';
import '/shared_customization/extensions/string_ext.dart';
import '/generated/translations.g.dart';
import '/app_common_data/common_data/global_variable.dart';

class Validators {
  Validators._();

  static String? validateEmail(String? value) {
    if (value.isEmptyOrNull) {
      return tr(LocaleKeys.CommonValidation_Required,
          namedArgs: {"fieldName": tr(LocaleKeys.CommonData_Email)});
    } else if (EMAIL_REG_EXP.hasMatch(value!) == false) {
      return tr(LocaleKeys.CommonValidation_InvalidEmailFormat);
    }
    return null;
  }

  static String? validatePassword(String? value,
      {bool isNew = false, String? validateNewPwdNotSameOldPwd}) {
    if (value == null || value.trim().isEmpty) {
      return tr(LocaleKeys.CommonValidation_Required, namedArgs: {
        "fieldName": isNew
            ? tr(LocaleKeys.ChangePassword_NewPassword)
            : tr(LocaleKeys.CommonData_Password)
      });
    }
    if (value.length < PASSWORD_MIN_LENGTH) {
      return tr(LocaleKeys.CommonValidation_MinLength, namedArgs: {
        "fieldName": isNew
            ? tr(LocaleKeys.ChangePassword_NewPassword)
            : tr(LocaleKeys.CommonData_Password),
        "value": PASSWORD_MIN_LENGTH.toString()
      });
    }
    if (value.length > PASSWORD_MAX_LENGTH) {
      return tr(LocaleKeys.CommonValidation_MaxLength, namedArgs: {
        "fieldName": isNew
            ? tr(LocaleKeys.ChangePassword_NewPassword)
            : tr(LocaleKeys.CommonData_Password),
        "value": PASSWORD_MAX_LENGTH.toString()
      });
    }
    if (!value.contains(PASSWORD_REG_EXP)) {
      return tr(LocaleKeys.CommonValidation_InvalidPasswordFormat);
    }
    if (isNew) return validateNewPwdNotSameOldPwd;
    return null;
  }

  static String? validateNewPwdNotSameOldPwd(String? olPwd, String? newPwd) {
    if (olPwd.isNotEmptyOrNull && newPwd.isNotEmptyOrNull && olPwd == newPwd) {
      return tr(LocaleKeys.CommonValidation_NewPasswordCanNotSameOldPassword);
    }
    return null;
  }

  static String? validateConfirmPassword(String? pwd, String? confirmPwd,
      {bool isNewConfirmPwd = false}) {
    if (confirmPwd == null || confirmPwd.trim().isEmpty) {
      return tr(LocaleKeys.CommonValidation_Required, namedArgs: {
        "fieldName": isNewConfirmPwd
            ? tr(LocaleKeys.ChangePassword_NewConfirmPassword)
            : tr(LocaleKeys.Register_ConfirmPassword)
      });
    }
    if (confirmPwd.length < PASSWORD_MIN_LENGTH) {
      return tr(LocaleKeys.CommonValidation_MinLength, namedArgs: {
        "fieldName": isNewConfirmPwd
            ? tr(LocaleKeys.ChangePassword_NewConfirmPassword)
            : tr(LocaleKeys.Register_ConfirmPassword),
        "value": PASSWORD_MIN_LENGTH.toString()
      });
    }
    if (confirmPwd.length > PASSWORD_MAX_LENGTH) {
      return tr(LocaleKeys.CommonValidation_MaxLength, namedArgs: {
        "fieldName": isNewConfirmPwd
            ? tr(LocaleKeys.ChangePassword_NewConfirmPassword)
            : tr(LocaleKeys.Register_ConfirmPassword),
        "value": PASSWORD_MAX_LENGTH.toString()
      });
    }
    if (!confirmPwd.contains(RegExp(r'(?=.*\d)(?=.*[a-z])(?=.*[A-Z])'))) {
      return tr(LocaleKeys.CommonValidation_InvalidPasswordFormat);
    }
    if (pwd != confirmPwd) {
      return isNewConfirmPwd
          ? tr(LocaleKeys.CommonValidation_NewPasswordConfirmationNotMatch)
          : tr(LocaleKeys.CommonValidation_PasswordConfirmationNotMatch);
    }
    return null;
  }

  static String? validateNotEmptyListOrString<T>(T? value,
      {String? errorCode, String? fieldName}) {
    bool isEmptyOrNull = [
      value is String && value.isEmptyOrNull,
      value is List && value.isEmpty
    ].any((element) => element);
    return isEmptyOrNull
        ? errorCode ??
            (fieldName.isNotEmptyOrNull
                ? tr(LocaleKeys.CommonValidation_Required,
                    namedArgs: {"fieldName": fieldName!})
                : tr(LocaleKeys.CommonValidation_CommonRequired))
        : null;
  }

  static String? validateFileNotNull(File? value,
      {String? errorCode, String? fieldName}) {
    return value == null
        ? errorCode ??
            (fieldName.isNotEmptyOrNull
                ? tr(LocaleKeys.CommonValidation_Required,
                    namedArgs: {"fieldName": fieldName!})
                : tr(LocaleKeys.CommonValidation_CommonRequired))
        : null;
  }

  static String? validateUrl(String? value, {String? errorCode}) {
    return value.isNotEmptyOrNull && LINK_REG_EXP.stringMatch(value!) == value
        ? null
        : 'Link not detected';
  }

  static String? validateDateTimeFormat(String? text, {Locale? locale}) {
    try {
      AppLanguage appLanguage = AppLanguage.values.firstWhere(
          (element) =>
              element.languageCode ==
              (locale?.languageCode ??
                  GlobalKeyVariable
                      .navigatorState.currentContext?.currentLanguageCode ??
                  'vi'),
          orElse: () => AppLanguage.vi);
      if (text.isNotEmptyOrNull &&
          DATE_TIME_REG_EXP.hasMatch(text!) &&
          appLanguage.getMyDateTime(text).isValidDate) return null;
      return tr(LocaleKeys.CommonValidation_DateTimeFormatIsInvalid);
    } catch (err) {
      return tr(LocaleKeys.CommonValidation_DateTimeFormatIsInvalid);
    }
  }
}
