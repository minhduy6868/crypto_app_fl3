// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'roi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RoiModelImpl _$$RoiModelImplFromJson(Map<String, dynamic> json) =>
    _$RoiModelImpl(
      times: (json['times'] as num).toDouble(),
      currency: json['currency'] as String,
      percentage: (json['percentage'] as num).toDouble(),
    );

Map<String, dynamic> _$$RoiModelImplToJson(_$RoiModelImpl instance) =>
    <String, dynamic>{
      'times': instance.times,
      'currency': instance.currency,
      'percentage': instance.percentage,
    };
