import 'package:freezed_annotation/freezed_annotation.dart';

part 'market_exchange.freezed.dart';
part 'market_exchange.g.dart';

@freezed
class MarketExchange with _$MarketExchange {
  factory MarketExchange({
    String? market,
    String? symbol,
    @JsonKey(name: 'index_id') String? indexId,
    String? price,
    @JsonKey(name: 'price_percentage_change_24h') double? pricePercentageChange24h,
    @JsonKey(name: 'contract_type') String? contractType,
    double? index,
    double? basis,
    double? spread,
    @JsonKey(name: 'funding_rate') double? fundingRate,
    @JsonKey(name: 'open_interest') double? openInterest,
    @JsonKey(name: 'volume_24h') double? volume24h,
    @JsonKey(name: 'last_traded_at') DateTime? lastTradedAt,
    @JsonKey(name: 'expired_at') DateTime? expiredAt,
    // @JsonKey(name: 'last_traded_at') @UTCDateConverter() DateTime? lastTradedAt,
    // @JsonKey(name: 'expired_at') @UTCDateConverter() DateTime? expiredAt,
  }) = _MarketExchange;

  factory MarketExchange.fromJson(Map<String, dynamic> json) =>
      _$MarketExchangeFromJson(json);
}
