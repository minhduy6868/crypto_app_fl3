part of 'list_news_screen_cubit.dart';

@freezed
class ListNewsScreenState with _$ListNewsScreenState, BlocBaseState{
  const factory ListNewsScreenState.initial({
    @Default(false) bool isLoading,
    List<NewsCrypto>? newsList,
    String? errorMessage,
    ScreenValue? status,
    String? selectedCategory,
  }) = _Initial;
}