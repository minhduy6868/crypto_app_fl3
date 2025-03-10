// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChartImpl _$$ChartImplFromJson(Map<String, dynamic> json) => _$ChartImpl(
      time: (json['time'] as num?)?.toInt(),
      open: (json['open'] as num?)?.toDouble(),
      high: (json['high'] as num?)?.toDouble(),
      low: (json['low'] as num?)?.toDouble(),
      close: (json['close'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$ChartImplToJson(_$ChartImpl instance) =>
    <String, dynamic>{
      'time': instance.time,
      'open': instance.open,
      'high': instance.high,
      'low': instance.low,
      'close': instance.close,
    };
