part of 'admin_management_screen_cubit.dart';

@freezed
class AdminManagementScreenState with _$AdminManagementScreenState, BlocBaseState {
  const factory AdminManagementScreenState.initial({
    String? errorMessage,
    ScreenValue? status,
    bool? isLoading,
    String? email,
    String? firstName,
    String? lastName,
    String? profileImageUrl,
    String? notificationMessage,
    Map<String, dynamic>? warningUserInfo,
    double? currentGasPrice,
  }) = _Initial;
}