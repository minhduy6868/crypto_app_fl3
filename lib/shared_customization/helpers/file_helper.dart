// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '/generated/translations.g.dart';
import '/shared_customization/helpers/dialogs/dialog_helper.dart';

class FileHelper {
  FileHelper._();

  static Future getFile({
    required BuildContext context,
    required bool allowMultiple,
    FileType type = FileType.any,
  }) async {
    try {
      FilePickerResult? result = await FilePicker.platform
          .pickFiles(type: type, allowMultiple: allowMultiple);
      if (result != null) {
        if (allowMultiple == false) {
          File fileReturn = File(result.files.single.path!);
          if (fileReturn.lengthSync() > 10000000) {
            showErrorDialog(context,
                title: tr(LocaleKeys.CommonNotiAction_Failed),
                content:
                    tr(LocaleKeys.CommonValidation_FileSizeMustLessThan10MB));
            return null;
          } else {
            return fileReturn;
          }
        } else {
          List<File> fileReturn =
              result.files.map((e) => File(e.path!)).toList();
          if (fileReturn.any((element) => element.lengthSync() > 10000000)) {
            showErrorDialog(context,
                title: tr(LocaleKeys.CommonNotiAction_Failed),
                content: tr(LocaleKeys
                    .CommonValidation_ListFileHasOneOrMoreFileSizeBiggerThan10MB));
            fileReturn
                .removeWhere((element) => element.lengthSync() > 10000000);
            return fileReturn;
          } else {
            return fileReturn;
          }
        }
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
