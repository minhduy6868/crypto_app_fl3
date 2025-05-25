part of 'news_detail_screen_cubit.dart';

@freezed
class NewsDetailScreenState with _$NewsDetailScreenState, BlocBaseState {
  const factory NewsDetailScreenState.initial({
    @Default(false) bool isLoading,
    String? aiEvaluation,
    String? errorMessage,
    ScreenValue? status,
  }) = _Initial;
}