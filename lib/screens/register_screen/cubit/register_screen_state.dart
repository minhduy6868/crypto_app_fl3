part of 'register_screen_cubit.dart';

@freezed
class RegisterScreenState with _$RegisterScreenState, BlocBaseState{
  const factory RegisterScreenState.initial({
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? confirmPassword,
    bool? isRegistered,
    bool? isLoading,
    String? errorMessage,
    ScreenValue? status,
  }) = _Initial;
}
