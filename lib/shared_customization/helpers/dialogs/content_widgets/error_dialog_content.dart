import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '/app_common_data/app_colors.dart';
import '/generated/assets.gen.dart';
import '/shared_customization/helpers/dialogs/content_widgets/base_dialog_content.dart';
import '../../../widgets/app_container.dart';
import '../../../widgets/texts/app_text.dart';
import '/generated/translations.g.dart';

class ErrorDialogContent extends BaseDialogContent {
  final String? title;
  final String? content;
  ErrorDialogContent({
    super.key,
    this.title,
    this.content,
  }) : super(builder: (context) {
          return Stack(
            children: [
              Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Assets.icons.icErrorDialog.svg(color: AppColors.red),
                    AppText(
                      title ?? tr(LocaleKeys.CommonData_Error),
                      color: AppColors.red,
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.center,
                      size: 22,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                    AppText(
                      content ?? tr(LocaleKeys.CommonData_HasErrorOccurr),
                      color: AppColors.primaryNormalText,
                      textAlign: TextAlign.center,
                      size: 14,
                    ),
                    AppContainer(
                      color: AppColors.transparent,
                      child: SizedBox(
                          height: 0.5,
                          width: MediaQuery.of(context).size.width),
                    )
                  ]),
              Positioned(
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Assets.icons.icX.svg(),
                  ))
            ],
          );
        });
}
