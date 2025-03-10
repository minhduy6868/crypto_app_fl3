import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '/models/user/user.dart';
import '/public_providers/config/update_state.dart';

part 'app_user_state.dart';
part 'app_user_cubit.freezed.dart';

class AppUserCubit extends Cubit<AppUserState> with UpdateState<AppUserState> {
  AppUserCubit() : super(const AppUserState.initial());
}
