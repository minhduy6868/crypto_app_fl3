import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '/app_common_data/enums/main_tabs.dart';
import '/public_providers/config/bloc_base_state.dart';
import '/public_providers/config/update_bloc_base_state.dart';
import '/shared_customization/data/screen_value.dart';

part 'main_screen_state.dart';
part 'main_screen_cubit.freezed.dart';

class MainScreenCubit extends Cubit<MainScreenState>
    with UpdateBlocBaseState<MainScreenState> {
  MainScreenCubit() : super(const MainScreenState.initial());
  void changeTab(MainTabs tab) => emit(state.copyWith(currentTabs: tab));

  @override
  void resetErrorMessage() => emit(state.copyWith(errorMessage: null));
  @override
  void resetStatus() => emit(state.copyWith(status: null));
}
