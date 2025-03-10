import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '/public_providers/config/update_state.dart';
import '/app_common_data/common_data/in_app_notification.dart';

part 'app_notification_state.dart';
part 'app_notification_cubit.freezed.dart';

class AppNotificationCubit extends Cubit<AppNotificationState>
    with UpdateState<AppNotificationState> {
  AppNotificationCubit() : super(const AppNotificationState.initial());
}
