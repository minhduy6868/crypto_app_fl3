part of 'detail_coin_screen_cubit.dart';

@freezed
class DetailCoinScreenState with _$DetailCoinScreenState, BlocBaseState{
  const factory DetailCoinScreenState.initial({
    String? errorMessage,
    ScreenValue? status,
    CoinMarket? coins,
    List<Chart>? chartData,
  }) = _Initial;
}


