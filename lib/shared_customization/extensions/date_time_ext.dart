import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '/app_common_data/common_data/global_key_variable.dart';
import '/shared_customization/extensions/build_context.ext.dart';

extension DateTimeExt on DateTime? {
  String get toHourAndMinute =>
      this == null ? '' : DateFormat("hh:mm").format(this!);
  String get toMonthDayHourMinute =>
      this == null ? '' : DateFormat("MM/dd hh:mm").format(this!);
  String get monthYear =>
      this == null ? '' : DateFormat('MM/yyyy').format(this!);

  String toDayMonthYear({Locale? locale}) {
    if (this == null) return '';
    switch (locale?.languageCode ??
        GlobalKeyVariable.navigatorState.currentContext?.currentLanguageCode ??
        'vi') {
      case 'zh':
        return DateFormat('yyyy/MM/dd').format(this!);
      case 'ja':
        return DateFormat('yyyy/MM/dd').format(this!);
      case 'vi':
        return DateFormat('dd/MM/yyyy').format(this!);
      case 'en':
        return DateFormat('MM/dd/yyyy').format(this!);
      default:
        return DateFormat('dd/MM/yyyy').format(this!);
    }
  }

  String toCustomFormat(String format) =>
      this == null ? '' : DateFormat(format).format(this!);
}
