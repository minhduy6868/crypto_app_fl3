import 'package:freezed_annotation/freezed_annotation.dart';

import '../meta/meta.dart';

part 'api_page_response.g.dart';
part 'api_page_response.freezed.dart';

@Freezed(genericArgumentFactories: true)
class ApiPageResponse<T> with _$ApiPageResponse<T> {
  const factory ApiPageResponse({
    String? status,
    String? message,
    List<T>? data,
    Meta? meta,
    Map<String, List<String>>? errors,
  }) = _ApiPageResponse<T>;

  factory ApiPageResponse.empty() => const ApiPageResponse(data: []);
  factory ApiPageResponse.fromJson(
      Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$ApiPageResponseFromJson(json, fromJsonT);
}
