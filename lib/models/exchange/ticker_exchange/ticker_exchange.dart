import 'package:crypto_app/models/exchange/converted_market/converted_market.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticker_exchange.freezed.dart';
part 'ticker_exchange.g.dart';

@freezed
class TickerExchange with _$TickerExchange {
  factory TickerExchange({
    String? base,
    String? targetName,   //xử lí khi call api -> data dư thừa
    dynamic? market,  //Chưa xử lí
    double? last,
    double? volume,
    @JsonKey(name: 'converted_last') ConvertedMarket? convertedLast,
    @JsonKey(name: 'converted_volume') ConvertedMarket? convertedVolume,
    String? trustScore,
    @JsonKey(name: 'bid_ask_spread_percentage') double? bidAskSpreadPercentage,
    DateTime? timestamp,
    @JsonKey(name: 'last_traded_at') DateTime? lastTradedAt,
    @JsonKey(name: 'last_fetch_at') DateTime? lastFetchAt,
    bool? isAnomaly,
    bool? isStale,
    String? tradeUrl,
    String? tokenInfoUrl,
    String? coinId,
    String? targetCoinId,
  }) = _TickerExchange;

  factory TickerExchange.fromJson(Map<String, dynamic> json) =>
      _$TickerExchangeFromJson(json);
}
