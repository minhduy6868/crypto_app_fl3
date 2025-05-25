part of 'setting_screen_cubit.dart';

@freezed
class SettingScreenState with _$SettingScreenState, BlocBaseState {
  const factory SettingScreenState.initial({
    Locale? locale, // Ngôn ngữ hiện tại
    @Default(false) bool isLoading, // Trạng thái tải
    String? errorMessage, // Thông báo lỗi
    ScreenValue? status, // Trạng thái thành công/thất bại
  }) = _Initial;
}
