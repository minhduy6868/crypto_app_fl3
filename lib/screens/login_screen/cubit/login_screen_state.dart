part of 'login_screen_cubit.dart';

@freezed
class LoginScreenState with _$LoginScreenState, BlocBaseState {
  const factory LoginScreenState.initial({
    String? errorMessage,
    ScreenValue? status,
    bool? isLoading,
    String? email,
    String? password,
    bool? isLoggedIn,
  }) = _Initial;
}
