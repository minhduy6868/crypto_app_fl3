// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_screen_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeScreenState {
  String? get errorMessage => throw _privateConstructorUsedError;
  ScreenValue? get status => throw _privateConstructorUsedError;
  List<CoinMarket>? get listcoinMarket => throw _privateConstructorUsedError;
  CoinMarket? get coins => throw _privateConstructorUsedError;
  List<Exchange>? get listExchange => throw _privateConstructorUsedError;
  Exchange? get exchange => throw _privateConstructorUsedError;
  String? get searchQuery => throw _privateConstructorUsedError;
  List<CoinMarket>? get searchResults => throw _privateConstructorUsedError;
  bool? get isSearching => throw _privateConstructorUsedError;
  List<CoinMarket>? get favoriteCoins => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? errorMessage,
            ScreenValue? status,
            List<CoinMarket>? listcoinMarket,
            CoinMarket? coins,
            List<Exchange>? listExchange,
            Exchange? exchange,
            String? searchQuery,
            List<CoinMarket>? searchResults,
            bool? isSearching,
            List<CoinMarket>? favoriteCoins)
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
            Exchange? exchange,
            String? searchQuery,
            List<CoinMarket>? searchResults,
            bool? isSearching,
            List<CoinMarket>? favoriteCoins)?
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
            Exchange? exchange,
            String? searchQuery,
            List<CoinMarket>? searchResults,
            bool? isSearching,
            List<CoinMarket>? favoriteCoins)?
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

  /// Create a copy of HomeScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeScreenStateCopyWith<HomeScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeScreenStateCopyWith<$Res> {
  factory $HomeScreenStateCopyWith(
          HomeScreenState value, $Res Function(HomeScreenState) then) =
      _$HomeScreenStateCopyWithImpl<$Res, HomeScreenState>;
  @useResult
  $Res call(
      {String? errorMessage,
      ScreenValue? status,
      List<CoinMarket>? listcoinMarket,
      CoinMarket? coins,
      List<Exchange>? listExchange,
      Exchange? exchange,
      String? searchQuery,
      List<CoinMarket>? searchResults,
      bool? isSearching,
      List<CoinMarket>? favoriteCoins});

  $CoinMarketCopyWith<$Res>? get coins;
  $ExchangeCopyWith<$Res>? get exchange;
}

/// @nodoc
class _$HomeScreenStateCopyWithImpl<$Res, $Val extends HomeScreenState>
    implements $HomeScreenStateCopyWith<$Res> {
  _$HomeScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeScreenState
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
    Object? searchQuery = freezed,
    Object? searchResults = freezed,
    Object? isSearching = freezed,
    Object? favoriteCoins = freezed,
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
      searchQuery: freezed == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String?,
      searchResults: freezed == searchResults
          ? _value.searchResults
          : searchResults // ignore: cast_nullable_to_non_nullable
              as List<CoinMarket>?,
      isSearching: freezed == isSearching
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool?,
      favoriteCoins: freezed == favoriteCoins
          ? _value.favoriteCoins
          : favoriteCoins // ignore: cast_nullable_to_non_nullable
              as List<CoinMarket>?,
    ) as $Val);
  }

  /// Create a copy of HomeScreenState
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

  /// Create a copy of HomeScreenState
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
    implements $HomeScreenStateCopyWith<$Res> {
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
      Exchange? exchange,
      String? searchQuery,
      List<CoinMarket>? searchResults,
      bool? isSearching,
      List<CoinMarket>? favoriteCoins});

  @override
  $CoinMarketCopyWith<$Res>? get coins;
  @override
  $ExchangeCopyWith<$Res>? get exchange;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$HomeScreenStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeScreenState
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
    Object? searchQuery = freezed,
    Object? searchResults = freezed,
    Object? isSearching = freezed,
    Object? favoriteCoins = freezed,
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
      searchQuery: freezed == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String?,
      searchResults: freezed == searchResults
          ? _value._searchResults
          : searchResults // ignore: cast_nullable_to_non_nullable
              as List<CoinMarket>?,
      isSearching: freezed == isSearching
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool?,
      favoriteCoins: freezed == favoriteCoins
          ? _value._favoriteCoins
          : favoriteCoins // ignore: cast_nullable_to_non_nullable
              as List<CoinMarket>?,
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
      this.exchange,
      this.searchQuery,
      final List<CoinMarket>? searchResults,
      this.isSearching,
      final List<CoinMarket>? favoriteCoins})
      : _listcoinMarket = listcoinMarket,
        _listExchange = listExchange,
        _searchResults = searchResults,
        _favoriteCoins = favoriteCoins;

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
  final String? searchQuery;
  final List<CoinMarket>? _searchResults;
  @override
  List<CoinMarket>? get searchResults {
    final value = _searchResults;
    if (value == null) return null;
    if (_searchResults is EqualUnmodifiableListView) return _searchResults;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? isSearching;
  final List<CoinMarket>? _favoriteCoins;
  @override
  List<CoinMarket>? get favoriteCoins {
    final value = _favoriteCoins;
    if (value == null) return null;
    if (_favoriteCoins is EqualUnmodifiableListView) return _favoriteCoins;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'HomeScreenState.initial(errorMessage: $errorMessage, status: $status, listcoinMarket: $listcoinMarket, coins: $coins, listExchange: $listExchange, exchange: $exchange, searchQuery: $searchQuery, searchResults: $searchResults, isSearching: $isSearching, favoriteCoins: $favoriteCoins)';
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
                other.exchange == exchange) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            const DeepCollectionEquality()
                .equals(other._searchResults, _searchResults) &&
            (identical(other.isSearching, isSearching) ||
                other.isSearching == isSearching) &&
            const DeepCollectionEquality()
                .equals(other._favoriteCoins, _favoriteCoins));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      errorMessage,
      status,
      const DeepCollectionEquality().hash(_listcoinMarket),
      coins,
      const DeepCollectionEquality().hash(_listExchange),
      exchange,
      searchQuery,
      const DeepCollectionEquality().hash(_searchResults),
      isSearching,
      const DeepCollectionEquality().hash(_favoriteCoins));

  /// Create a copy of HomeScreenState
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
            Exchange? exchange,
            String? searchQuery,
            List<CoinMarket>? searchResults,
            bool? isSearching,
            List<CoinMarket>? favoriteCoins)
        initial,
  }) {
    return initial(errorMessage, status, listcoinMarket, coins, listExchange,
        exchange, searchQuery, searchResults, isSearching, favoriteCoins);
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
            Exchange? exchange,
            String? searchQuery,
            List<CoinMarket>? searchResults,
            bool? isSearching,
            List<CoinMarket>? favoriteCoins)?
        initial,
  }) {
    return initial?.call(
        errorMessage,
        status,
        listcoinMarket,
        coins,
        listExchange,
        exchange,
        searchQuery,
        searchResults,
        isSearching,
        favoriteCoins);
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
            Exchange? exchange,
            String? searchQuery,
            List<CoinMarket>? searchResults,
            bool? isSearching,
            List<CoinMarket>? favoriteCoins)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(errorMessage, status, listcoinMarket, coins, listExchange,
          exchange, searchQuery, searchResults, isSearching, favoriteCoins);
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

abstract class _Initial implements HomeScreenState {
  const factory _Initial(
      {final String? errorMessage,
      final ScreenValue? status,
      final List<CoinMarket>? listcoinMarket,
      final CoinMarket? coins,
      final List<Exchange>? listExchange,
      final Exchange? exchange,
      final String? searchQuery,
      final List<CoinMarket>? searchResults,
      final bool? isSearching,
      final List<CoinMarket>? favoriteCoins}) = _$InitialImpl;

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
  @override
  String? get searchQuery;
  @override
  List<CoinMarket>? get searchResults;
  @override
  bool? get isSearching;
  @override
  List<CoinMarket>? get favoriteCoins;

  /// Create a copy of HomeScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
