import 'package:flutter/material.dart';

import '/shared_customization/helpers/dialogs/content_widgets/confirm_dialog_content.dart';
import '/shared_customization/helpers/dialogs/content_widgets/feature_pending_dialog_content.dart';
import '/app_common_data/app_colors.dart';
import '/shared_customization/helpers/dialogs/content_widgets/success_dialog_content.dart';
import '/shared_customization/helpers/dialogs/content_widgets/error_dialog_content.dart';

Future<dynamic> showErrorDialog(BuildContext context,
        {String? title, String? content}) =>
    showDialog(
      context: context,
      builder: (context) {
        return Material(
          color: AppColors.transparent,
          child: Center(
            child: ErrorDialogContent(
              title: title,
              content: content,
            ),
          ),
        );
      },
    );

Future<dynamic> showSuccessDialog(BuildContext context,
        {String? title, String? content}) =>
    showDialog(
      context: context,
      builder: (context) {
        return Material(
          color: AppColors.transparent,
          child: Center(
              child: SuccessDialogContent(
            title: title,
            content: content,
          )),
        );
      },
    );

Future<bool?> showConfirmDialog(
  BuildContext context, {
  String? title,
  String? content,
  VoidCallback? onAccept,
  VoidCallback? onReject,
}) =>
    showDialog<bool>(
      context: context,
      builder: (context) {
        return Material(
          color: AppColors.transparent,
          child: Center(
              child: ConfirmDialogContent(
            content: content,
            title: title,
            onAccept: onAccept,
            onReject: onReject,
          )),
        );
      },
    );
Future<void> showFeaturePendingDialog(BuildContext context) => showDialog(
      context: context,
      builder: (context) => Material(
        color: AppColors.transparent,
        child: Center(child: FeaturePendingDialogContent()),
      ),
    );
