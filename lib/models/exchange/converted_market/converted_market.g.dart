// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'converted_market.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConvertedMarketImpl _$$ConvertedMarketImplFromJson(
        Map<String, dynamic> json) =>
    _$ConvertedMarketImpl(
      btc: (json['btc'] as num?)?.toDouble(),
      eth: (json['eth'] as num?)?.toDouble(),
      usd: (json['usd'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$ConvertedMarketImplToJson(
        _$ConvertedMarketImpl instance) =>
    <String, dynamic>{
      'btc': instance.btc,
      'eth': instance.eth,
      'usd': instance.usd,
    };
