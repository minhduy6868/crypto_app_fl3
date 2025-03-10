import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '/shared_customization/helpers/utilizations/validators.dart';
import '/app_common_data/common_data/global_key_variable.dart';
import '/shared_customization/extensions/build_context.ext.dart';
import '/shared_customization/data/string_file_extension.dart';

extension StringExt on String? {
  ///
  /// Check empty or null
  ///
  bool get isEmptyOrNull => this == null || (this!.trim()).isEmpty;
  bool get isNotEmptyOrNull => this != null && (this!.trim()).isNotEmpty;
  int get strLength => (this ?? "").length;

  ///
  /// Check file extension
  ///
  String get urlFileName => (this ?? '').split('/').last;
  String get fileExtension => (this ?? '').split('.').last;
  bool get isImage => IMAGE_FILE_EXTENSION
      .any((element) => urlFileName.toLowerCase().endsWith(element));
  bool get isVideo => VIDEO_FILE_EXTENSIONS
      .any((element) => urlFileName.toLowerCase().endsWith(element));
  bool get isPdf => urlFileName.toLowerCase().endsWith('.pdf');

  ///
  /// Conver to datetime
  ///
  DateTime? toDateTime({Locale? locale}) {
    if (isEmptyOrNull ||
        Validators.validateDateTimeFormat(this, locale: locale)
            .isNotEmptyOrNull) return null;
    String dateformat = 'dd/MM/yyyy';
    switch (locale?.languageCode ??
        GlobalKeyVariable.navigatorState.currentContext?.currentLanguageCode ??
        'vi') {
      case 'zh':
        dateformat = 'yyyy/MM/dd';
        break;
      case 'ja':
        dateformat = 'yyyy/MM/dd';
        break;
      case 'vi':
        dateformat = 'dd/MM/yyyy';
        break;
      case 'en':
        dateformat = 'MM/dd/yyyy';
        break;
      default:
        dateformat = 'dd/MM/yyyy';
    }
    try {
      return DateFormat(dateformat).parse(this!);
    } catch (err) {
      return null;
    }
  }
}
