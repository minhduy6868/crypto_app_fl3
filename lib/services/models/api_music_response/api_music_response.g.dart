// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_music_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiMusicResponseImpl<T> _$$ApiMusicResponseImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$ApiMusicResponseImpl<T>(
      data: (json['data'] as List<dynamic>).map(fromJsonT).toList(),
    );

Map<String, dynamic> _$$ApiMusicResponseImplToJson<T>(
  _$ApiMusicResponseImpl<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': instance.data.map(toJsonT).toList(),
    };
