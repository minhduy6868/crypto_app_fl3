import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

import '/app_common_data/app_colors.dart';
import '../widgets/app_container.dart';
import '../widgets/texts/app_text.dart';

enum BannerType { success, error, warning, info }

enum BannerPosition { top, bottom }

extension BannerExt on BannerType {
  Color get backgroundColor => {
        BannerType.success: AppColors.bgSuccess,
        BannerType.error: AppColors.bgError,
        BannerType.warning: AppColors.bgWarning,
        BannerType.info: AppColors.bgInfo,
      }[this]!;

  IconData get icon => {
        BannerType.success: Icons.check_circle,
        BannerType.error: Icons.cancel,
        BannerType.info: Icons.info_rounded,
        BannerType.warning: Icons.error_rounded,
      }[this]!;

  Color get iconColor => {
        BannerType.success: AppColors.green,
        BannerType.error: AppColors.red,
        BannerType.info: Colors.blue[800],
        BannerType.warning: Colors.yellow[800],
      }[this]!;

  Color get textColor => {
        BannerType.success: AppColors.primaryTitleText,
        BannerType.error: AppColors.primaryTitleText,
        BannerType.warning: AppColors.primaryTitleText,
        BannerType.info: AppColors.primaryTitleText,
      }[this]!;
}

extension BannerPositionExt on BannerPosition {
  Alignment get align => {
        BannerPosition.bottom: Alignment.bottomCenter,
        BannerPosition.top: Alignment.topCenter,
      }[this]!;
}

void showErrorBanner({
  required String content,
  int delayDurationInMilliseconds = 0,
}) async {
  if (delayDurationInMilliseconds > 0) {
    await Future.delayed(Duration(milliseconds: delayDurationInMilliseconds));
  }
  BotToast.showCustomNotification(
    toastBuilder: (cancelFunc) {
      return CustomBanner(
        content: content,
        bannerType: BannerType.error,
      );
    },
    align: BannerPosition.top.align,
    backButtonBehavior: BackButtonBehavior.ignore,
    animationDuration: const Duration(milliseconds: 300),
    animationReverseDuration: const Duration(milliseconds: 300),
    duration: const Duration(milliseconds: 2000),
  );
}

void showSuccessBanner({
  required String content,
  int delayDurationInMilliseconds = 0,
}) async {
  if (delayDurationInMilliseconds > 0) {
    await Future.delayed(Duration(milliseconds: delayDurationInMilliseconds));
  }
  BotToast.showCustomNotification(
    toastBuilder: (cancelFunc) {
      return CustomBanner(
        content: content,
        bannerType: BannerType.success,
      );
    },
    align: BannerPosition.top.align,
    backButtonBehavior: BackButtonBehavior.ignore,
    animationDuration: const Duration(milliseconds: 300),
    animationReverseDuration: const Duration(milliseconds: 300),
    duration: const Duration(milliseconds: 2000),
  );
}

void showWarningBanner({
  required String content,
  int delayDurationInMilliseconds = 0,
}) async {
  if (delayDurationInMilliseconds > 0) {
    await Future.delayed(Duration(milliseconds: delayDurationInMilliseconds));
  }
  BotToast.showCustomNotification(
    toastBuilder: (cancelFunc) {
      return CustomBanner(
        content: content,
        bannerType: BannerType.warning,
      );
    },
    align: BannerPosition.top.align,
    backButtonBehavior: BackButtonBehavior.ignore,
    animationDuration: const Duration(milliseconds: 300),
    animationReverseDuration: const Duration(milliseconds: 300),
    duration: const Duration(milliseconds: 2000),
  );
}

void showInfoBanner({
  required String content,
  int delayDurationInMilliseconds = 0,
}) async {
  if (delayDurationInMilliseconds > 0) {
    await Future.delayed(Duration(milliseconds: delayDurationInMilliseconds));
  }
  BotToast.showCustomNotification(
    toastBuilder: (cancelFunc) {
      return CustomBanner(
        content: content,
        bannerType: BannerType.info,
      );
    },
    align: BannerPosition.top.align,
    backButtonBehavior: BackButtonBehavior.ignore,
    animationDuration: const Duration(milliseconds: 300),
    animationReverseDuration: const Duration(milliseconds: 300),
    duration: const Duration(milliseconds: 2000),
  );
}

void showBottomBanner({
  required String content,
  BannerType bannerType = BannerType.info,
  BannerPosition bannerPosition = BannerPosition.bottom,
  int delayDurationInMilliseconds = 0,
}) async {
  if (delayDurationInMilliseconds > 0) {
    await Future.delayed(Duration(milliseconds: delayDurationInMilliseconds));
  }
  BotToast.showCustomNotification(
    toastBuilder: (cancelFunc) {
      return CustomBanner(
        content: content,
        bannerType: bannerType,
      );
    },
    align: bannerPosition.align,
    backButtonBehavior: BackButtonBehavior.ignore,
    animationDuration: const Duration(milliseconds: 300),
    animationReverseDuration: const Duration(milliseconds: 300),
    duration: const Duration(milliseconds: 2000),
  );
}

class CustomBanner extends StatelessWidget {
  const CustomBanner({
    super.key,
    this.content,
    required this.bannerType,
  });
  final String? content;
  final BannerType bannerType;

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      color: bannerType.backgroundColor,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      borderRadius: BorderRadius.circular(6),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            bannerType.icon,
            size: 22,
            color: bannerType.iconColor,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: AppText(
              content,
              size: 15,
              color: bannerType.textColor,
            ),
          )
        ],
      ),
    );
  }
}
