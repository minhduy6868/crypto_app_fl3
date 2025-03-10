// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_song_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MusicSongImpl _$$MusicSongImplFromJson(Map<String, dynamic> json) =>
    _$MusicSongImpl(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      artist: json['artist'] as String?,
      source: json['source'] as String?,
      image: json['image'] as String?,
      duration: (json['duration'] as num?)?.toInt(),
      counter: (json['counter'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$MusicSongImplToJson(_$MusicSongImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'artist': instance.artist,
      'source': instance.source,
      'image': instance.image,
      'duration': instance.duration,
      'counter': instance.counter,
    };
