import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:crypto_app/services/models/meta/meta.dart';

part 'api_response.g.dart';
part 'api_response.freezed.dart';

@Freezed(genericArgumentFactories: true)
class ApiResponse<T> with _$ApiResponse<T> {
  const factory ApiResponse({
    String? status,
    String? message,
    T? data,
    Meta? meta,
    Map<String, List<String>>? errors,
  }) = _ApiResponse<T>;

  factory ApiResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$ApiResponseFromJson(json, fromJsonT);
}
