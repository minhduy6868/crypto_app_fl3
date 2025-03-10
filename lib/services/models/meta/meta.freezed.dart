// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meta.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Meta _$MetaFromJson(Map<String, dynamic> json) {
  return _Meta.fromJson(json);
}

/// @nodoc
mixin _$Meta {
  @JsonKey(name: 'current_page', includeFromJson: true, includeToJson: false)
  int get currentPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'next_page', includeFromJson: true, includeToJson: false)
  int get nextPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'prev_page', includeFromJson: true, includeToJson: false)
  int get prevPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_pages', includeFromJson: true, includeToJson: false)
  int get totalPages => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_count', includeFromJson: true, includeToJson: false)
  int get totalCount => throw _privateConstructorUsedError;

  /// Serializes this Meta to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Meta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MetaCopyWith<Meta> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetaCopyWith<$Res> {
  factory $MetaCopyWith(Meta value, $Res Function(Meta) then) =
      _$MetaCopyWithImpl<$Res, Meta>;
  @useResult
  $Res call(
      {@JsonKey(
          name: 'current_page', includeFromJson: true, includeToJson: false)
      int currentPage,
      @JsonKey(name: 'next_page', includeFromJson: true, includeToJson: false)
      int nextPage,
      @JsonKey(name: 'prev_page', includeFromJson: true, includeToJson: false)
      int prevPage,
      @JsonKey(name: 'total_pages', includeFromJson: true, includeToJson: false)
      int totalPages,
      @JsonKey(name: 'total_count', includeFromJson: true, includeToJson: false)
      int totalCount});
}

/// @nodoc
class _$MetaCopyWithImpl<$Res, $Val extends Meta>
    implements $MetaCopyWith<$Res> {
  _$MetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Meta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? nextPage = null,
    Object? prevPage = null,
    Object? totalPages = null,
    Object? totalCount = null,
  }) {
    return _then(_value.copyWith(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      nextPage: null == nextPage
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as int,
      prevPage: null == prevPage
          ? _value.prevPage
          : prevPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MetaImplCopyWith<$Res> implements $MetaCopyWith<$Res> {
  factory _$$MetaImplCopyWith(
          _$MetaImpl value, $Res Function(_$MetaImpl) then) =
      __$$MetaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(
          name: 'current_page', includeFromJson: true, includeToJson: false)
      int currentPage,
      @JsonKey(name: 'next_page', includeFromJson: true, includeToJson: false)
      int nextPage,
      @JsonKey(name: 'prev_page', includeFromJson: true, includeToJson: false)
      int prevPage,
      @JsonKey(name: 'total_pages', includeFromJson: true, includeToJson: false)
      int totalPages,
      @JsonKey(name: 'total_count', includeFromJson: true, includeToJson: false)
      int totalCount});
}

/// @nodoc
class __$$MetaImplCopyWithImpl<$Res>
    extends _$MetaCopyWithImpl<$Res, _$MetaImpl>
    implements _$$MetaImplCopyWith<$Res> {
  __$$MetaImplCopyWithImpl(_$MetaImpl _value, $Res Function(_$MetaImpl) _then)
      : super(_value, _then);

  /// Create a copy of Meta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? nextPage = null,
    Object? prevPage = null,
    Object? totalPages = null,
    Object? totalCount = null,
  }) {
    return _then(_$MetaImpl(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      nextPage: null == nextPage
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as int,
      prevPage: null == prevPage
          ? _value.prevPage
          : prevPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$MetaImpl implements _Meta {
  const _$MetaImpl(
      {@JsonKey(
          name: 'current_page', includeFromJson: true, includeToJson: false)
      this.currentPage = 0,
      @JsonKey(name: 'next_page', includeFromJson: true, includeToJson: false)
      this.nextPage = 0,
      @JsonKey(name: 'prev_page', includeFromJson: true, includeToJson: false)
      this.prevPage = 0,
      @JsonKey(name: 'total_pages', includeFromJson: true, includeToJson: false)
      this.totalPages = 0,
      @JsonKey(name: 'total_count', includeFromJson: true, includeToJson: false)
      this.totalCount = 0});

  factory _$MetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$MetaImplFromJson(json);

  @override
  @JsonKey(name: 'current_page', includeFromJson: true, includeToJson: false)
  final int currentPage;
  @override
  @JsonKey(name: 'next_page', includeFromJson: true, includeToJson: false)
  final int nextPage;
  @override
  @JsonKey(name: 'prev_page', includeFromJson: true, includeToJson: false)
  final int prevPage;
  @override
  @JsonKey(name: 'total_pages', includeFromJson: true, includeToJson: false)
  final int totalPages;
  @override
  @JsonKey(name: 'total_count', includeFromJson: true, includeToJson: false)
  final int totalCount;

  @override
  String toString() {
    return 'Meta(currentPage: $currentPage, nextPage: $nextPage, prevPage: $prevPage, totalPages: $totalPages, totalCount: $totalCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MetaImpl &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.nextPage, nextPage) ||
                other.nextPage == nextPage) &&
            (identical(other.prevPage, prevPage) ||
                other.prevPage == prevPage) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, currentPage, nextPage, prevPage, totalPages, totalCount);

  /// Create a copy of Meta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MetaImplCopyWith<_$MetaImpl> get copyWith =>
      __$$MetaImplCopyWithImpl<_$MetaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MetaImplToJson(
      this,
    );
  }
}

abstract class _Meta implements Meta {
  const factory _Meta(
      {@JsonKey(
          name: 'current_page', includeFromJson: true, includeToJson: false)
      final int currentPage,
      @JsonKey(name: 'next_page', includeFromJson: true, includeToJson: false)
      final int nextPage,
      @JsonKey(name: 'prev_page', includeFromJson: true, includeToJson: false)
      final int prevPage,
      @JsonKey(name: 'total_pages', includeFromJson: true, includeToJson: false)
      final int totalPages,
      @JsonKey(name: 'total_count', includeFromJson: true, includeToJson: false)
      final int totalCount}) = _$MetaImpl;

  factory _Meta.fromJson(Map<String, dynamic> json) = _$MetaImpl.fromJson;

  @override
  @JsonKey(name: 'current_page', includeFromJson: true, includeToJson: false)
  int get currentPage;
  @override
  @JsonKey(name: 'next_page', includeFromJson: true, includeToJson: false)
  int get nextPage;
  @override
  @JsonKey(name: 'prev_page', includeFromJson: true, includeToJson: false)
  int get prevPage;
  @override
  @JsonKey(name: 'total_pages', includeFromJson: true, includeToJson: false)
  int get totalPages;
  @override
  @JsonKey(name: 'total_count', includeFromJson: true, includeToJson: false)
  int get totalCount;

  /// Create a copy of Meta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MetaImplCopyWith<_$MetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
