import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_music_response.freezed.dart';
part 'api_music_response.g.dart';

@Freezed(genericArgumentFactories: true)
class ApiMusicResponse<T> with _$ApiMusicResponse<T> {
  const factory ApiMusicResponse({
    required List<T> data,
  }) = _ApiMusicResponse<T>;

  factory ApiMusicResponse.empty() => const ApiMusicResponse(data: []);
  factory ApiMusicResponse.fromJson(
      Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$ApiMusicResponseFromJson(json, fromJsonT);
}
