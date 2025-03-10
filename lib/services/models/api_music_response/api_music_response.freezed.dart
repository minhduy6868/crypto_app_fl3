// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_music_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ApiMusicResponse<T> _$ApiMusicResponseFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _ApiMusicResponse<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$ApiMusicResponse<T> {
  List<T> get data => throw _privateConstructorUsedError;

  /// Serializes this ApiMusicResponse to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;

  /// Create a copy of ApiMusicResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApiMusicResponseCopyWith<T, ApiMusicResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiMusicResponseCopyWith<T, $Res> {
  factory $ApiMusicResponseCopyWith(
          ApiMusicResponse<T> value, $Res Function(ApiMusicResponse<T>) then) =
      _$ApiMusicResponseCopyWithImpl<T, $Res, ApiMusicResponse<T>>;
  @useResult
  $Res call({List<T> data});
}

/// @nodoc
class _$ApiMusicResponseCopyWithImpl<T, $Res, $Val extends ApiMusicResponse<T>>
    implements $ApiMusicResponseCopyWith<T, $Res> {
  _$ApiMusicResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApiMusicResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApiMusicResponseImplCopyWith<T, $Res>
    implements $ApiMusicResponseCopyWith<T, $Res> {
  factory _$$ApiMusicResponseImplCopyWith(_$ApiMusicResponseImpl<T> value,
          $Res Function(_$ApiMusicResponseImpl<T>) then) =
      __$$ApiMusicResponseImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({List<T> data});
}

/// @nodoc
class __$$ApiMusicResponseImplCopyWithImpl<T, $Res>
    extends _$ApiMusicResponseCopyWithImpl<T, $Res, _$ApiMusicResponseImpl<T>>
    implements _$$ApiMusicResponseImplCopyWith<T, $Res> {
  __$$ApiMusicResponseImplCopyWithImpl(_$ApiMusicResponseImpl<T> _value,
      $Res Function(_$ApiMusicResponseImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ApiMusicResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$ApiMusicResponseImpl<T>(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$ApiMusicResponseImpl<T> implements _ApiMusicResponse<T> {
  const _$ApiMusicResponseImpl({required final List<T> data}) : _data = data;

  factory _$ApiMusicResponseImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$ApiMusicResponseImplFromJson(json, fromJsonT);

  final List<T> _data;
  @override
  List<T> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'ApiMusicResponse<$T>(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiMusicResponseImpl<T> &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  /// Create a copy of ApiMusicResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiMusicResponseImplCopyWith<T, _$ApiMusicResponseImpl<T>> get copyWith =>
      __$$ApiMusicResponseImplCopyWithImpl<T, _$ApiMusicResponseImpl<T>>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$ApiMusicResponseImplToJson<T>(this, toJsonT);
  }
}

abstract class _ApiMusicResponse<T> implements ApiMusicResponse<T> {
  const factory _ApiMusicResponse({required final List<T> data}) =
      _$ApiMusicResponseImpl<T>;

  factory _ApiMusicResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$ApiMusicResponseImpl<T>.fromJson;

  @override
  List<T> get data;

  /// Create a copy of ApiMusicResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiMusicResponseImplCopyWith<T, _$ApiMusicResponseImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
