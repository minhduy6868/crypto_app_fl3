part of 'detail_coin_screen_cubit.dart';

@freezed
class DetailCoinScreenState with _$DetailCoinScreenState, BlocBaseState {
  const factory DetailCoinScreenState.initial({
    String? errorMessage,
    ScreenValue? status,
    CoinMarket? coins,
    List<Chart>? chartData,
    bool? isLoadingAI,
    String? aiPrediction,
    @Default(1) int selectedDays, // Thêm trường selectedDays
    @Default(false) bool isDescriptionExpanded, // Thêm trường isDescriptionExpanded
  }) = _Initial;
}

