part of 'coin_price_cubit.dart';

@freezed
class CoinPriceState with _$CoinPriceState {
  const factory CoinPriceState.initial() = _Initial;
  const factory CoinPriceState.priceUpdated({
    required String symbol, // Sử dụng symbol thay vì coinId
    required String price,
    required String changePercent,
  }) = _PriceUpdated;
  const factory CoinPriceState.error(String message) = _Error;
}