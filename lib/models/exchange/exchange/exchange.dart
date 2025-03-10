import 'package:crypto_app/models/exchange/ticker_exchange/ticker_exchange.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'exchange.freezed.dart';
part 'exchange.g.dart';

@freezed
class Exchange with _$Exchange {
  factory Exchange({
    String? id,
    String? name,
    @JsonKey(name: 'year_established') int? yearEstablished,
    String? country,
    String? description,
    String? url,
    String? image,
    String? facebookUrl,
    String? redditUrl,
    String? telegramUrl,
    String? slackUrl,
    String? otherUrl1,
    String? otherUrl2,
    String? twitterHandle,
    @JsonKey(name: 'has_trading_incentive') bool? hasTradingIncentive,
    bool? centralized,
    String? publicNotice,
    String? alertNotice,
    int? trustScore,
    @JsonKey(name: 'trust_score_rank') int? trustScoreRank,
    int? coins,
    int? pairs,
    @JsonKey(name: 'trade_volume_24h_btc') double? tradeVolume24hBtc,
    @JsonKey(name: 'trade_volume_24h_btc_normalized') double? tradeVolume24hBtcNormalized,
    List<TickerExchange>? tickers,
  }) = _Exchange;

  factory Exchange.fromJson(Map<String, dynamic> json) =>
      _$ExchangeFromJson(json);
}
