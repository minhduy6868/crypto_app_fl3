import '/app_common_data/enums/in_app_notification_actions.dart';

class InAppNotification {
  final InAppNotificationActions type;
  final dynamic data;
  InAppNotification({
    required this.type,
    this.data,
  });

  InAppNotification copyWith({
    InAppNotificationActions? type,
    dynamic data,
  }) =>
      InAppNotification(type: type ?? this.type, data: data ?? this.data);
}
