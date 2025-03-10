// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticker_exchange.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TickerExchangeImpl _$$TickerExchangeImplFromJson(Map<String, dynamic> json) =>
    _$TickerExchangeImpl(
      base: json['base'] as String?,
      targetName: json['targetName'] as String?,
      market: json['market'],
      last: (json['last'] as num?)?.toDouble(),
      volume: (json['volume'] as num?)?.toDouble(),
      convertedLast: json['converted_last'] == null
          ? null
          : ConvertedMarket.fromJson(
              json['converted_last'] as Map<String, dynamic>),
      convertedVolume: json['converted_volume'] == null
          ? null
          : ConvertedMarket.fromJson(
              json['converted_volume'] as Map<String, dynamic>),
      trustScore: json['trustScore'] as String?,
      bidAskSpreadPercentage:
          (json['bid_ask_spread_percentage'] as num?)?.toDouble(),
      timestamp: json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
      lastTradedAt: json['last_traded_at'] == null
          ? null
          : DateTime.parse(json['last_traded_at'] as String),
      lastFetchAt: json['last_fetch_at'] == null
          ? null
          : DateTime.parse(json['last_fetch_at'] as String),
      isAnomaly: json['isAnomaly'] as bool?,
      isStale: json['isStale'] as bool?,
      tradeUrl: json['tradeUrl'] as String?,
      tokenInfoUrl: json['tokenInfoUrl'] as String?,
      coinId: json['coinId'] as String?,
      targetCoinId: json['targetCoinId'] as String?,
    );

Map<String, dynamic> _$$TickerExchangeImplToJson(
        _$TickerExchangeImpl instance) =>
    <String, dynamic>{
      'base': instance.base,
      'targetName': instance.targetName,
      'market': instance.market,
      'last': instance.last,
      'volume': instance.volume,
      'converted_last': instance.convertedLast,
      'converted_volume': instance.convertedVolume,
      'trustScore': instance.trustScore,
      'bid_ask_spread_percentage': instance.bidAskSpreadPercentage,
      'timestamp': instance.timestamp?.toIso8601String(),
      'last_traded_at': instance.lastTradedAt?.toIso8601String(),
      'last_fetch_at': instance.lastFetchAt?.toIso8601String(),
      'isAnomaly': instance.isAnomaly,
      'isStale': instance.isStale,
      'tradeUrl': instance.tradeUrl,
      'tokenInfoUrl': instance.tokenInfoUrl,
      'coinId': instance.coinId,
      'targetCoinId': instance.targetCoinId,
    };
