import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '/app_common_data/app_colors.dart';
import '/generated/translations.g.dart';
import '/shared_customization/helpers/dialogs/content_widgets/base_dialog_content.dart';
import '/shared_customization/enums/button_type.dart';
import '../../../widgets/buttons/app_button.dart';
import '../../../widgets/texts/app_text.dart';

class ConfirmDialogContent extends BaseDialogContent {
  final String? title;
  final String? content;
  final VoidCallback? onAccept;
  final VoidCallback? onReject;

  ConfirmDialogContent({
    super.key,
    this.title,
    this.content,
    this.onAccept,
    this.onReject,
  }) : super(builder: (context) {
          return Column(mainAxisSize: MainAxisSize.min, children: [
            AppText(
              title ?? tr(LocaleKeys.CommonAction_Confirm),
              textAlign: TextAlign.center,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w500,
              size: 22,
            ),
            const SizedBox(height: 8),
            AppText(
              content ?? "",
              textAlign: TextAlign.center,
              color: AppColors.primaryNormalText,
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: AppButton(
                    type: ButtonType.white,
                    label: tr(LocaleKeys.CommonAction_Cancel),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                      onReject?.call();
                    },
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  flex: 1,
                  child: AppButton(
                    label: tr(LocaleKeys.CommonAction_Confirm),
                    onPressed: () {
                      Navigator.of(context).pop(true);
                      onAccept?.call();
                    },
                  ),
                ),
              ],
            ),
          ]);
        });
}
