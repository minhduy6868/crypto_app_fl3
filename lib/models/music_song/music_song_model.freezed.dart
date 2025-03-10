// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_song_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MusicSong _$MusicSongFromJson(Map<String, dynamic> json) {
  return _MusicSong.fromJson(json);
}

/// @nodoc
mixin _$MusicSong {
  int? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get artist => throw _privateConstructorUsedError;
  String? get source => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  int? get duration => throw _privateConstructorUsedError;
  int? get counter => throw _privateConstructorUsedError;

  /// Serializes this MusicSong to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MusicSong
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MusicSongCopyWith<MusicSong> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MusicSongCopyWith<$Res> {
  factory $MusicSongCopyWith(MusicSong value, $Res Function(MusicSong) then) =
      _$MusicSongCopyWithImpl<$Res, MusicSong>;
  @useResult
  $Res call(
      {int? id,
      String? title,
      String? artist,
      String? source,
      String? image,
      int? duration,
      int? counter});
}

/// @nodoc
class _$MusicSongCopyWithImpl<$Res, $Val extends MusicSong>
    implements $MusicSongCopyWith<$Res> {
  _$MusicSongCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MusicSong
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? artist = freezed,
    Object? source = freezed,
    Object? image = freezed,
    Object? duration = freezed,
    Object? counter = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      artist: freezed == artist
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as String?,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      counter: freezed == counter
          ? _value.counter
          : counter // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MusicSongImplCopyWith<$Res>
    implements $MusicSongCopyWith<$Res> {
  factory _$$MusicSongImplCopyWith(
          _$MusicSongImpl value, $Res Function(_$MusicSongImpl) then) =
      __$$MusicSongImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? title,
      String? artist,
      String? source,
      String? image,
      int? duration,
      int? counter});
}

/// @nodoc
class __$$MusicSongImplCopyWithImpl<$Res>
    extends _$MusicSongCopyWithImpl<$Res, _$MusicSongImpl>
    implements _$$MusicSongImplCopyWith<$Res> {
  __$$MusicSongImplCopyWithImpl(
      _$MusicSongImpl _value, $Res Function(_$MusicSongImpl) _then)
      : super(_value, _then);

  /// Create a copy of MusicSong
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? artist = freezed,
    Object? source = freezed,
    Object? image = freezed,
    Object? duration = freezed,
    Object? counter = freezed,
  }) {
    return _then(_$MusicSongImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      artist: freezed == artist
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as String?,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      counter: freezed == counter
          ? _value.counter
          : counter // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MusicSongImpl implements _MusicSong {
  const _$MusicSongImpl(
      {this.id,
      this.title,
      this.artist,
      this.source,
      this.image,
      this.duration,
      this.counter});

  factory _$MusicSongImpl.fromJson(Map<String, dynamic> json) =>
      _$$MusicSongImplFromJson(json);

  @override
  final int? id;
  @override
  final String? title;
  @override
  final String? artist;
  @override
  final String? source;
  @override
  final String? image;
  @override
  final int? duration;
  @override
  final int? counter;

  @override
  String toString() {
    return 'MusicSong(id: $id, title: $title, artist: $artist, source: $source, image: $image, duration: $duration, counter: $counter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MusicSongImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.artist, artist) || other.artist == artist) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.counter, counter) || other.counter == counter));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, artist, source, image, duration, counter);

  /// Create a copy of MusicSong
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MusicSongImplCopyWith<_$MusicSongImpl> get copyWith =>
      __$$MusicSongImplCopyWithImpl<_$MusicSongImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MusicSongImplToJson(
      this,
    );
  }
}

abstract class _MusicSong implements MusicSong {
  const factory _MusicSong(
      {final int? id,
      final String? title,
      final String? artist,
      final String? source,
      final String? image,
      final int? duration,
      final int? counter}) = _$MusicSongImpl;

  factory _MusicSong.fromJson(Map<String, dynamic> json) =
      _$MusicSongImpl.fromJson;

  @override
  int? get id;
  @override
  String? get title;
  @override
  String? get artist;
  @override
  String? get source;
  @override
  String? get image;
  @override
  int? get duration;
  @override
  int? get counter;

  /// Create a copy of MusicSong
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MusicSongImplCopyWith<_$MusicSongImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
