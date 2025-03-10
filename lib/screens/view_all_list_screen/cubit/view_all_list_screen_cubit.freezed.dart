// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'view_all_list_screen_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ViewAllListScreenState {
  String? get errorMessage => throw _privateConstructorUsedError;
  ScreenValue? get status => throw _privateConstructorUsedError;
  List<CoinMarket>? get listcoinMarket => throw _privateConstructorUsedError;
  CoinMarket? get coins => throw _privateConstructorUsedError;
  List<Exchange>? get listExchange => throw _privateConstructorUsedError;
  Exchange? get exchange => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? errorMessage,
            ScreenValue? status,
            List<CoinMarket>? listcoinMarket,
            CoinMarket? coins,
            List<Exchange>? listExchange,
            Exchange? exchange)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String? errorMessage,
            ScreenValue? status,
            List<CoinMarket>? listcoinMarket,
            CoinMarket? coins,
            List<Exchange>? listExchange,
            Exchange? exchange)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String? errorMessage,
            ScreenValue? status,
            List<CoinMarket>? listcoinMarket,
            CoinMarket? coins,
            List<Exchange>? listExchange,
            Exchange? exchange)?
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

  /// Create a copy of ViewAllListScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ViewAllListScreenStateCopyWith<ViewAllListScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewAllListScreenStateCopyWith<$Res> {
  factory $ViewAllListScreenStateCopyWith(ViewAllListScreenState value,
          $Res Function(ViewAllListScreenState) then) =
      _$ViewAllListScreenStateCopyWithImpl<$Res, ViewAllListScreenState>;
  @useResult
  $Res call(
      {String? errorMessage,
      ScreenValue? status,
      List<CoinMarket>? listcoinMarket,
      CoinMarket? coins,
      List<Exchange>? listExchange,
      Exchange? exchange});

  $CoinMarketCopyWith<$Res>? get coins;
  $ExchangeCopyWith<$Res>? get exchange;
}

/// @nodoc
class _$ViewAllListScreenStateCopyWithImpl<$Res,
        $Val extends ViewAllListScreenState>
    implements $ViewAllListScreenStateCopyWith<$Res> {
  _$ViewAllListScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ViewAllListScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = freezed,
    Object? status = freezed,
    Object? listcoinMarket = freezed,
    Object? coins = freezed,
    Object? listExchange = freezed,
    Object? exchange = freezed,
  }) {
    return _then(_value.copyWith(
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ScreenValue?,
      listcoinMarket: freezed == listcoinMarket
          ? _value.listcoinMarket
          : listcoinMarket // ignore: cast_nullable_to_non_nullable
              as List<CoinMarket>?,
      coins: freezed == coins
          ? _value.coins
          : coins // ignore: cast_nullable_to_non_nullable
              as CoinMarket?,
      listExchange: freezed == listExchange
          ? _value.listExchange
          : listExchange // ignore: cast_nullable_to_non_nullable
              as List<Exchange>?,
      exchange: freezed == exchange
          ? _value.exchange
          : exchange // ignore: cast_nullable_to_non_nullable
              as Exchange?,
    ) as $Val);
  }

  /// Create a copy of ViewAllListScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CoinMarketCopyWith<$Res>? get coins {
    if (_value.coins == null) {
      return null;
    }

    return $CoinMarketCopyWith<$Res>(_value.coins!, (value) {
      return _then(_value.copyWith(coins: value) as $Val);
    });
  }

  /// Create a copy of ViewAllListScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExchangeCopyWith<$Res>? get exchange {
    if (_value.exchange == null) {
      return null;
    }

    return $ExchangeCopyWith<$Res>(_value.exchange!, (value) {
      return _then(_value.copyWith(exchange: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $ViewAllListScreenStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? errorMessage,
      ScreenValue? status,
      List<CoinMarket>? listcoinMarket,
      CoinMarket? coins,
      List<Exchange>? listExchange,
      Exchange? exchange});

  @override
  $CoinMarketCopyWith<$Res>? get coins;
  @override
  $ExchangeCopyWith<$Res>? get exchange;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ViewAllListScreenStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of ViewAllListScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = freezed,
    Object? status = freezed,
    Object? listcoinMarket = freezed,
    Object? coins = freezed,
    Object? listExchange = freezed,
    Object? exchange = freezed,
  }) {
    return _then(_$InitialImpl(
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ScreenValue?,
      listcoinMarket: freezed == listcoinMarket
          ? _value._listcoinMarket
          : listcoinMarket // ignore: cast_nullable_to_non_nullable
              as List<CoinMarket>?,
      coins: freezed == coins
          ? _value.coins
          : coins // ignore: cast_nullable_to_non_nullable
              as CoinMarket?,
      listExchange: freezed == listExchange
          ? _value._listExchange
          : listExchange // ignore: cast_nullable_to_non_nullable
              as List<Exchange>?,
      exchange: freezed == exchange
          ? _value.exchange
          : exchange // ignore: cast_nullable_to_non_nullable
              as Exchange?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {this.errorMessage,
      this.status,
      final List<CoinMarket>? listcoinMarket,
      this.coins,
      final List<Exchange>? listExchange,
      this.exchange})
      : _listcoinMarket = listcoinMarket,
        _listExchange = listExchange;

  @override
  final String? errorMessage;
  @override
  final ScreenValue? status;
  final List<CoinMarket>? _listcoinMarket;
  @override
  List<CoinMarket>? get listcoinMarket {
    final value = _listcoinMarket;
    if (value == null) return null;
    if (_listcoinMarket is EqualUnmodifiableListView) return _listcoinMarket;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final CoinMarket? coins;
  final List<Exchange>? _listExchange;
  @override
  List<Exchange>? get listExchange {
    final value = _listExchange;
    if (value == null) return null;
    if (_listExchange is EqualUnmodifiableListView) return _listExchange;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Exchange? exchange;

  @override
  String toString() {
    return 'ViewAllListScreenState.initial(errorMessage: $errorMessage, status: $status, listcoinMarket: $listcoinMarket, coins: $coins, listExchange: $listExchange, exchange: $exchange)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._listcoinMarket, _listcoinMarket) &&
            (identical(other.coins, coins) || other.coins == coins) &&
            const DeepCollectionEquality()
                .equals(other._listExchange, _listExchange) &&
            (identical(other.exchange, exchange) ||
                other.exchange == exchange));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      errorMessage,
      status,
      const DeepCollectionEquality().hash(_listcoinMarket),
      coins,
      const DeepCollectionEquality().hash(_listExchange),
      exchange);

  /// Create a copy of ViewAllListScreenState
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
            String? errorMessage,
            ScreenValue? status,
            List<CoinMarket>? listcoinMarket,
            CoinMarket? coins,
            List<Exchange>? listExchange,
            Exchange? exchange)
        initial,
  }) {
    return initial(
        errorMessage, status, listcoinMarket, coins, listExchange, exchange);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String? errorMessage,
            ScreenValue? status,
            List<CoinMarket>? listcoinMarket,
            CoinMarket? coins,
            List<Exchange>? listExchange,
            Exchange? exchange)?
        initial,
  }) {
    return initial?.call(
        errorMessage, status, listcoinMarket, coins, listExchange, exchange);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String? errorMessage,
            ScreenValue? status,
            List<CoinMarket>? listcoinMarket,
            CoinMarket? coins,
            List<Exchange>? listExchange,
            Exchange? exchange)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(
          errorMessage, status, listcoinMarket, coins, listExchange, exchange);
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

abstract class _Initial implements ViewAllListScreenState {
  const factory _Initial(
      {final String? errorMessage,
      final ScreenValue? status,
      final List<CoinMarket>? listcoinMarket,
      final CoinMarket? coins,
      final List<Exchange>? listExchange,
      final Exchange? exchange}) = _$InitialImpl;

  @override
  String? get errorMessage;
  @override
  ScreenValue? get status;
  @override
  List<CoinMarket>? get listcoinMarket;
  @override
  CoinMarket? get coins;
  @override
  List<Exchange>? get listExchange;
  @override
  Exchange? get exchange;

  /// Create a copy of ViewAllListScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
