// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sparkline_in_7d_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SparklineIn7dModelImpl _$$SparklineIn7dModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SparklineIn7dModelImpl(
      price: (json['price'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$$SparklineIn7dModelImplToJson(
        _$SparklineIn7dModelImpl instance) =>
    <String, dynamic>{
      'price': instance.price,
    };
