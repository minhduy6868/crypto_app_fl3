import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '/app_common_data/app_colors.dart';
import '/generated/assets.gen.dart';
import '/generated/translations.g.dart';
import '../../../widgets/app_container.dart';
import '../../../widgets/texts/app_text.dart';
import '/shared_customization/helpers/dialogs/content_widgets/base_dialog_content.dart';

class FeaturePendingDialogContent extends BaseDialogContent {
  FeaturePendingDialogContent({super.key})
      : super(builder: (context) {
          return Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.update_rounded,
                    size: 50,
                    color: AppColors.primaryColor,
                  ),
                  AppText(
                    tr(LocaleKeys.CommonData_FeaturePending),
                    color: AppColors.primaryTitleText,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.center,
                    size: 22,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  AppContainer(
                    color: AppColors.transparent,
                    child: SizedBox(
                        height: 0.5, width: MediaQuery.of(context).size.width),
                  )
                ],
              ),
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
