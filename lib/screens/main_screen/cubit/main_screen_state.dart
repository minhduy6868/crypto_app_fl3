part of 'main_screen_cubit.dart';

@freezed
class MainScreenState with _$MainScreenState, BlocBaseState {
  const factory MainScreenState.initial({
    String? errorMessage,
    ScreenValue? status,
    @Default(MainTabs.home) MainTabs currentTabs,
  }) = _Initial;
}
