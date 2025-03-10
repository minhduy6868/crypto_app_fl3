// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_page_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiPageResponseImpl<T> _$$ApiPageResponseImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$ApiPageResponseImpl<T>(
      status: json['status'] as String?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)?.map(fromJsonT).toList(),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      errors: (json['errors'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ),
    );

Map<String, dynamic> _$$ApiPageResponseImplToJson<T>(
  _$ApiPageResponseImpl<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data?.map(toJsonT).toList(),
      'meta': instance.meta,
      'errors': instance.errors,
    };
