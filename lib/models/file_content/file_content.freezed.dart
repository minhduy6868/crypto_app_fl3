// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'file_content.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FileContent _$FileContentFromJson(Map<String, dynamic> json) {
  return _FileContent.fromJson(json);
}

/// @nodoc
mixin _$FileContent {
  String? get url => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'mime_type')
  String? get mimeType => throw _privateConstructorUsedError;
  @JsonKey(name: 'mimeType')
  String? get mimeType1 => throw _privateConstructorUsedError;
  int? get size => throw _privateConstructorUsedError;

  /// Serializes this FileContent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FileContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FileContentCopyWith<FileContent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FileContentCopyWith<$Res> {
  factory $FileContentCopyWith(
          FileContent value, $Res Function(FileContent) then) =
      _$FileContentCopyWithImpl<$Res, FileContent>;
  @useResult
  $Res call(
      {String? url,
      String? name,
      @JsonKey(name: 'mime_type') String? mimeType,
      @JsonKey(name: 'mimeType') String? mimeType1,
      int? size});
}

/// @nodoc
class _$FileContentCopyWithImpl<$Res, $Val extends FileContent>
    implements $FileContentCopyWith<$Res> {
  _$FileContentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FileContent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? name = freezed,
    Object? mimeType = freezed,
    Object? mimeType1 = freezed,
    Object? size = freezed,
  }) {
    return _then(_value.copyWith(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      mimeType: freezed == mimeType
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String?,
      mimeType1: freezed == mimeType1
          ? _value.mimeType1
          : mimeType1 // ignore: cast_nullable_to_non_nullable
              as String?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FileContentImplCopyWith<$Res>
    implements $FileContentCopyWith<$Res> {
  factory _$$FileContentImplCopyWith(
          _$FileContentImpl value, $Res Function(_$FileContentImpl) then) =
      __$$FileContentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? url,
      String? name,
      @JsonKey(name: 'mime_type') String? mimeType,
      @JsonKey(name: 'mimeType') String? mimeType1,
      int? size});
}

/// @nodoc
class __$$FileContentImplCopyWithImpl<$Res>
    extends _$FileContentCopyWithImpl<$Res, _$FileContentImpl>
    implements _$$FileContentImplCopyWith<$Res> {
  __$$FileContentImplCopyWithImpl(
      _$FileContentImpl _value, $Res Function(_$FileContentImpl) _then)
      : super(_value, _then);

  /// Create a copy of FileContent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? name = freezed,
    Object? mimeType = freezed,
    Object? mimeType1 = freezed,
    Object? size = freezed,
  }) {
    return _then(_$FileContentImpl(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      mimeType: freezed == mimeType
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String?,
      mimeType1: freezed == mimeType1
          ? _value.mimeType1
          : mimeType1 // ignore: cast_nullable_to_non_nullable
              as String?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FileContentImpl implements _FileContent {
  _$FileContentImpl(
      {this.url,
      this.name,
      @JsonKey(name: 'mime_type') this.mimeType,
      @JsonKey(name: 'mimeType') this.mimeType1,
      this.size});

  factory _$FileContentImpl.fromJson(Map<String, dynamic> json) =>
      _$$FileContentImplFromJson(json);

  @override
  final String? url;
  @override
  final String? name;
  @override
  @JsonKey(name: 'mime_type')
  final String? mimeType;
  @override
  @JsonKey(name: 'mimeType')
  final String? mimeType1;
  @override
  final int? size;

  @override
  String toString() {
    return 'FileContent(url: $url, name: $name, mimeType: $mimeType, mimeType1: $mimeType1, size: $size)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FileContentImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.mimeType, mimeType) ||
                other.mimeType == mimeType) &&
            (identical(other.mimeType1, mimeType1) ||
                other.mimeType1 == mimeType1) &&
            (identical(other.size, size) || other.size == size));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, url, name, mimeType, mimeType1, size);

  /// Create a copy of FileContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FileContentImplCopyWith<_$FileContentImpl> get copyWith =>
      __$$FileContentImplCopyWithImpl<_$FileContentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FileContentImplToJson(
      this,
    );
  }
}

abstract class _FileContent implements FileContent {
  factory _FileContent(
      {final String? url,
      final String? name,
      @JsonKey(name: 'mime_type') final String? mimeType,
      @JsonKey(name: 'mimeType') final String? mimeType1,
      final int? size}) = _$FileContentImpl;

  factory _FileContent.fromJson(Map<String, dynamic> json) =
      _$FileContentImpl.fromJson;

  @override
  String? get url;
  @override
  String? get name;
  @override
  @JsonKey(name: 'mime_type')
  String? get mimeType;
  @override
  @JsonKey(name: 'mimeType')
  String? get mimeType1;
  @override
  int? get size;

  /// Create a copy of FileContent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FileContentImplCopyWith<_$FileContentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
