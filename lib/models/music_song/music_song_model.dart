
import 'package:freezed_annotation/freezed_annotation.dart';

part 'music_song_model.g.dart';
part 'music_song_model.freezed.dart';

@freezed
class MusicSong with _$MusicSong{
  const factory MusicSong({
    int? id,
    String? title,
    String? artist,
    String? source,
    String? image,
    int? duration,
    int? counter
}) = _MusicSong;

  factory MusicSong.fromJson(Map<String, dynamic> json) =>
      _$MusicSongFromJson(json);
}