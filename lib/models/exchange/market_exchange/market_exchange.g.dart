// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_exchange.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MarketExchangeImpl _$$MarketExchangeImplFromJson(Map<String, dynamic> json) =>
    _$MarketExchangeImpl(
      market: json['market'] as String?,
      symbol: json['symbol'] as String?,
      indexId: json['index_id'] as String?,
      price: json['price'] as String?,
      pricePercentageChange24h:
          (json['price_percentage_change_24h'] as num?)?.toDouble(),
      contractType: json['contract_type'] as String?,
      index: (json['index'] as num?)?.toDouble(),
      basis: (json['basis'] as num?)?.toDouble(),
      spread: (json['spread'] as num?)?.toDouble(),
      fundingRate: (json['funding_rate'] as num?)?.toDouble(),
      openInterest: (json['open_interest'] as num?)?.toDouble(),
      volume24h: (json['volume_24h'] as num?)?.toDouble(),
      lastTradedAt: json['last_traded_at'] == null
          ? null
          : DateTime.parse(json['last_traded_at'] as String),
      expiredAt: json['expired_at'] == null
          ? null
          : DateTime.parse(json['expired_at'] as String),
    );

Map<String, dynamic> _$$MarketExchangeImplToJson(
        _$MarketExchangeImpl instance) =>
    <String, dynamic>{
      'market': instance.market,
      'symbol': instance.symbol,
      'index_id': instance.indexId,
      'price': instance.price,
      'price_percentage_change_24h': instance.pricePercentageChange24h,
      'contract_type': instance.contractType,
      'index': instance.index,
      'basis': instance.basis,
      'spread': instance.spread,
      'funding_rate': instance.fundingRate,
      'open_interest': instance.openInterest,
      'volume_24h': instance.volume24h,
      'last_traded_at': instance.lastTradedAt?.toIso8601String(),
      'expired_at': instance.expiredAt?.toIso8601String(),
    };
