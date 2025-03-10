// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FileContentImpl _$$FileContentImplFromJson(Map<String, dynamic> json) =>
    _$FileContentImpl(
      url: json['url'] as String?,
      name: json['name'] as String?,
      mimeType: json['mime_type'] as String?,
      mimeType1: json['mimeType'] as String?,
      size: (json['size'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$FileContentImplToJson(_$FileContentImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'name': instance.name,
      'mime_type': instance.mimeType,
      'mimeType': instance.mimeType1,
      'size': instance.size,
    };
