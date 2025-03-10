// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'page_router_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PageRouterState {
  String? get previousPageName => throw _privateConstructorUsedError;
  dynamic get previousPageArgs => throw _privateConstructorUsedError;
  String? get currentPageName => throw _privateConstructorUsedError;
  dynamic get currentPageArgs => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? previousPageName,
            dynamic previousPageArgs,
            String? currentPageName,
            dynamic currentPageArgs)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? previousPageName, dynamic previousPageArgs,
            String? currentPageName, dynamic currentPageArgs)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? previousPageName, dynamic previousPageArgs,
            String? currentPageName, dynamic currentPageArgs)?
        initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of PageRouterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PageRouterStateCopyWith<PageRouterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageRouterStateCopyWith<$Res> {
  factory $PageRouterStateCopyWith(
          PageRouterState value, $Res Function(PageRouterState) then) =
      _$PageRouterStateCopyWithImpl<$Res, PageRouterState>;
  @useResult
  $Res call(
      {String? previousPageName,
      dynamic previousPageArgs,
      String? currentPageName,
      dynamic currentPageArgs});
}

/// @nodoc
class _$PageRouterStateCopyWithImpl<$Res, $Val extends PageRouterState>
    implements $PageRouterStateCopyWith<$Res> {
  _$PageRouterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PageRouterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? previousPageName = freezed,
    Object? previousPageArgs = freezed,
    Object? currentPageName = freezed,
    Object? currentPageArgs = freezed,
  }) {
    return _then(_value.copyWith(
      previousPageName: freezed == previousPageName
          ? _value.previousPageName
          : previousPageName // ignore: cast_nullable_to_non_nullable
              as String?,
      previousPageArgs: freezed == previousPageArgs
          ? _value.previousPageArgs
          : previousPageArgs // ignore: cast_nullable_to_non_nullable
              as dynamic,
      currentPageName: freezed == currentPageName
          ? _value.currentPageName
          : currentPageName // ignore: cast_nullable_to_non_nullable
              as String?,
      currentPageArgs: freezed == currentPageArgs
          ? _value.currentPageArgs
          : currentPageArgs // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $PageRouterStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? previousPageName,
      dynamic previousPageArgs,
      String? currentPageName,
      dynamic currentPageArgs});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$PageRouterStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of PageRouterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? previousPageName = freezed,
    Object? previousPageArgs = freezed,
    Object? currentPageName = freezed,
    Object? currentPageArgs = freezed,
  }) {
    return _then(_$InitialImpl(
      previousPageName: freezed == previousPageName
          ? _value.previousPageName
          : previousPageName // ignore: cast_nullable_to_non_nullable
              as String?,
      previousPageArgs: freezed == previousPageArgs
          ? _value.previousPageArgs
          : previousPageArgs // ignore: cast_nullable_to_non_nullable
              as dynamic,
      currentPageName: freezed == currentPageName
          ? _value.currentPageName
          : currentPageName // ignore: cast_nullable_to_non_nullable
              as String?,
      currentPageArgs: freezed == currentPageArgs
          ? _value.currentPageArgs
          : currentPageArgs // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {this.previousPageName,
      this.previousPageArgs,
      this.currentPageName,
      this.currentPageArgs});

  @override
  final String? previousPageName;
  @override
  final dynamic previousPageArgs;
  @override
  final String? currentPageName;
  @override
  final dynamic currentPageArgs;

  @override
  String toString() {
    return 'PageRouterState.initial(previousPageName: $previousPageName, previousPageArgs: $previousPageArgs, currentPageName: $currentPageName, currentPageArgs: $currentPageArgs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.previousPageName, previousPageName) ||
                other.previousPageName == previousPageName) &&
            const DeepCollectionEquality()
                .equals(other.previousPageArgs, previousPageArgs) &&
            (identical(other.currentPageName, currentPageName) ||
                other.currentPageName == currentPageName) &&
            const DeepCollectionEquality()
                .equals(other.currentPageArgs, currentPageArgs));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      previousPageName,
      const DeepCollectionEquality().hash(previousPageArgs),
      currentPageName,
      const DeepCollectionEquality().hash(currentPageArgs));

  /// Create a copy of PageRouterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? previousPageName,
            dynamic previousPageArgs,
            String? currentPageName,
            dynamic currentPageArgs)
        initial,
  }) {
    return initial(
        previousPageName, previousPageArgs, currentPageName, currentPageArgs);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? previousPageName, dynamic previousPageArgs,
            String? currentPageName, dynamic currentPageArgs)?
        initial,
  }) {
    return initial?.call(
        previousPageName, previousPageArgs, currentPageName, currentPageArgs);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? previousPageName, dynamic previousPageArgs,
            String? currentPageName, dynamic currentPageArgs)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(
          previousPageName, previousPageArgs, currentPageName, currentPageArgs);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements PageRouterState {
  const factory _Initial(
      {final String? previousPageName,
      final dynamic previousPageArgs,
      final String? currentPageName,
      final dynamic currentPageArgs}) = _$InitialImpl;

  @override
  String? get previousPageName;
  @override
  dynamic get previousPageArgs;
  @override
  String? get currentPageName;
  @override
  dynamic get currentPageArgs;

  /// Create a copy of PageRouterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
