// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_page_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ApiPageResponse<T> _$ApiPageResponseFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _ApiPageResponse<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$ApiPageResponse<T> {
  String? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<T>? get data => throw _privateConstructorUsedError;
  Meta? get meta => throw _privateConstructorUsedError;
  Map<String, List<String>>? get errors => throw _privateConstructorUsedError;

  /// Serializes this ApiPageResponse to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;

  /// Create a copy of ApiPageResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApiPageResponseCopyWith<T, ApiPageResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiPageResponseCopyWith<T, $Res> {
  factory $ApiPageResponseCopyWith(
          ApiPageResponse<T> value, $Res Function(ApiPageResponse<T>) then) =
      _$ApiPageResponseCopyWithImpl<T, $Res, ApiPageResponse<T>>;
  @useResult
  $Res call(
      {String? status,
      String? message,
      List<T>? data,
      Meta? meta,
      Map<String, List<String>>? errors});

  $MetaCopyWith<$Res>? get meta;
}

/// @nodoc
class _$ApiPageResponseCopyWithImpl<T, $Res, $Val extends ApiPageResponse<T>>
    implements $ApiPageResponseCopyWith<T, $Res> {
  _$ApiPageResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApiPageResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
    Object? meta = freezed,
    Object? errors = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<T>?,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta?,
      errors: freezed == errors
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>?,
    ) as $Val);
  }

  /// Create a copy of ApiPageResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MetaCopyWith<$Res>? get meta {
    if (_value.meta == null) {
      return null;
    }

    return $MetaCopyWith<$Res>(_value.meta!, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ApiPageResponseImplCopyWith<T, $Res>
    implements $ApiPageResponseCopyWith<T, $Res> {
  factory _$$ApiPageResponseImplCopyWith(_$ApiPageResponseImpl<T> value,
          $Res Function(_$ApiPageResponseImpl<T>) then) =
      __$$ApiPageResponseImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {String? status,
      String? message,
      List<T>? data,
      Meta? meta,
      Map<String, List<String>>? errors});

  @override
  $MetaCopyWith<$Res>? get meta;
}

/// @nodoc
class __$$ApiPageResponseImplCopyWithImpl<T, $Res>
    extends _$ApiPageResponseCopyWithImpl<T, $Res, _$ApiPageResponseImpl<T>>
    implements _$$ApiPageResponseImplCopyWith<T, $Res> {
  __$$ApiPageResponseImplCopyWithImpl(_$ApiPageResponseImpl<T> _value,
      $Res Function(_$ApiPageResponseImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ApiPageResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
    Object? meta = freezed,
    Object? errors = freezed,
  }) {
    return _then(_$ApiPageResponseImpl<T>(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<T>?,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta?,
      errors: freezed == errors
          ? _value._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>?,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$ApiPageResponseImpl<T> implements _ApiPageResponse<T> {
  const _$ApiPageResponseImpl(
      {this.status,
      this.message,
      final List<T>? data,
      this.meta,
      final Map<String, List<String>>? errors})
      : _data = data,
        _errors = errors;

  factory _$ApiPageResponseImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$ApiPageResponseImplFromJson(json, fromJsonT);

  @override
  final String? status;
  @override
  final String? message;
  final List<T>? _data;
  @override
  List<T>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Meta? meta;
  final Map<String, List<String>>? _errors;
  @override
  Map<String, List<String>>? get errors {
    final value = _errors;
    if (value == null) return null;
    if (_errors is EqualUnmodifiableMapView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'ApiPageResponse<$T>(status: $status, message: $message, data: $data, meta: $meta, errors: $errors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiPageResponseImpl<T> &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.meta, meta) || other.meta == meta) &&
            const DeepCollectionEquality().equals(other._errors, _errors));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      message,
      const DeepCollectionEquality().hash(_data),
      meta,
      const DeepCollectionEquality().hash(_errors));

  /// Create a copy of ApiPageResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiPageResponseImplCopyWith<T, _$ApiPageResponseImpl<T>> get copyWith =>
      __$$ApiPageResponseImplCopyWithImpl<T, _$ApiPageResponseImpl<T>>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$ApiPageResponseImplToJson<T>(this, toJsonT);
  }
}

abstract class _ApiPageResponse<T> implements ApiPageResponse<T> {
  const factory _ApiPageResponse(
      {final String? status,
      final String? message,
      final List<T>? data,
      final Meta? meta,
      final Map<String, List<String>>? errors}) = _$ApiPageResponseImpl<T>;

  factory _ApiPageResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$ApiPageResponseImpl<T>.fromJson;

  @override
  String? get status;
  @override
  String? get message;
  @override
  List<T>? get data;
  @override
  Meta? get meta;
  @override
  Map<String, List<String>>? get errors;

  /// Create a copy of ApiPageResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiPageResponseImplCopyWith<T, _$ApiPageResponseImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
