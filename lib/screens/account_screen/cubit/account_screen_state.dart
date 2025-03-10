part of 'account_screen_cubit.dart';

@freezed
class AccountScreenState with _$AccountScreenState, BlocBaseState {
  const factory AccountScreenState.initial({
    String? errorMessage,
    ScreenValue? status,
    bool? isLoading,
    String? email,
    String? firstName,
    String? lastName,
    String? profileImageUrl,
  }) = _Initial;
}
