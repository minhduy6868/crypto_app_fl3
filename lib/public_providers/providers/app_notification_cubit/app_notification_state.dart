part of 'app_notification_cubit.dart';

@freezed
class AppNotificationState with _$AppNotificationState {
  const factory AppNotificationState.initial({
    InAppNotification? inAppNotification,
  }) = _Initial;
}
