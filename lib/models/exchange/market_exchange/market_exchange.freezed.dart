// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'market_exchange.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MarketExchange _$MarketExchangeFromJson(Map<String, dynamic> json) {
  return _MarketExchange.fromJson(json);
}

/// @nodoc
mixin _$MarketExchange {
  String? get market => throw _privateConstructorUsedError;
  String? get symbol => throw _privateConstructorUsedError;
  @JsonKey(name: 'index_id')
  String? get indexId => throw _privateConstructorUsedError;
  String? get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'price_percentage_change_24h')
  double? get pricePercentageChange24h => throw _privateConstructorUsedError;
  @JsonKey(name: 'contract_type')
  String? get contractType => throw _privateConstructorUsedError;
  double? get index => throw _privateConstructorUsedError;
  double? get basis => throw _privateConstructorUsedError;
  double? get spread => throw _privateConstructorUsedError;
  @JsonKey(name: 'funding_rate')
  double? get fundingRate => throw _privateConstructorUsedError;
  @JsonKey(name: 'open_interest')
  double? get openInterest => throw _privateConstructorUsedError;
  @JsonKey(name: 'volume_24h')
  double? get volume24h => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_traded_at')
  DateTime? get lastTradedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'expired_at')
  DateTime? get expiredAt => throw _privateConstructorUsedError;

  /// Serializes this MarketExchange to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MarketExchange
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MarketExchangeCopyWith<MarketExchange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarketExchangeCopyWith<$Res> {
  factory $MarketExchangeCopyWith(
          MarketExchange value, $Res Function(MarketExchange) then) =
      _$MarketExchangeCopyWithImpl<$Res, MarketExchange>;
  @useResult
  $Res call(
      {String? market,
      String? symbol,
      @JsonKey(name: 'index_id') String? indexId,
      String? price,
      @JsonKey(name: 'price_percentage_change_24h')
      double? pricePercentageChange24h,
      @JsonKey(name: 'contract_type') String? contractType,
      double? index,
      double? basis,
      double? spread,
      @JsonKey(name: 'funding_rate') double? fundingRate,
      @JsonKey(name: 'open_interest') double? openInterest,
      @JsonKey(name: 'volume_24h') double? volume24h,
      @JsonKey(name: 'last_traded_at') DateTime? lastTradedAt,
      @JsonKey(name: 'expired_at') DateTime? expiredAt});
}

/// @nodoc
class _$MarketExchangeCopyWithImpl<$Res, $Val extends MarketExchange>
    implements $MarketExchangeCopyWith<$Res> {
  _$MarketExchangeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MarketExchange
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? market = freezed,
    Object? symbol = freezed,
    Object? indexId = freezed,
    Object? price = freezed,
    Object? pricePercentageChange24h = freezed,
    Object? contractType = freezed,
    Object? index = freezed,
    Object? basis = freezed,
    Object? spread = freezed,
    Object? fundingRate = freezed,
    Object? openInterest = freezed,
    Object? volume24h = freezed,
    Object? lastTradedAt = freezed,
    Object? expiredAt = freezed,
  }) {
    return _then(_value.copyWith(
      market: freezed == market
          ? _value.market
          : market // ignore: cast_nullable_to_non_nullable
              as String?,
      symbol: freezed == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String?,
      indexId: freezed == indexId
          ? _value.indexId
          : indexId // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      pricePercentageChange24h: freezed == pricePercentageChange24h
          ? _value.pricePercentageChange24h
          : pricePercentageChange24h // ignore: cast_nullable_to_non_nullable
              as double?,
      contractType: freezed == contractType
          ? _value.contractType
          : contractType // ignore: cast_nullable_to_non_nullable
              as String?,
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as double?,
      basis: freezed == basis
          ? _value.basis
          : basis // ignore: cast_nullable_to_non_nullable
              as double?,
      spread: freezed == spread
          ? _value.spread
          : spread // ignore: cast_nullable_to_non_nullable
              as double?,
      fundingRate: freezed == fundingRate
          ? _value.fundingRate
          : fundingRate // ignore: cast_nullable_to_non_nullable
              as double?,
      openInterest: freezed == openInterest
          ? _value.openInterest
          : openInterest // ignore: cast_nullable_to_non_nullable
              as double?,
      volume24h: freezed == volume24h
          ? _value.volume24h
          : volume24h // ignore: cast_nullable_to_non_nullable
              as double?,
      lastTradedAt: freezed == lastTradedAt
          ? _value.lastTradedAt
          : lastTradedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expiredAt: freezed == expiredAt
          ? _value.expiredAt
          : expiredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MarketExchangeImplCopyWith<$Res>
    implements $MarketExchangeCopyWith<$Res> {
  factory _$$MarketExchangeImplCopyWith(_$MarketExchangeImpl value,
          $Res Function(_$MarketExchangeImpl) then) =
      __$$MarketExchangeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? market,
      String? symbol,
      @JsonKey(name: 'index_id') String? indexId,
      String? price,
      @JsonKey(name: 'price_percentage_change_24h')
      double? pricePercentageChange24h,
      @JsonKey(name: 'contract_type') String? contractType,
      double? index,
      double? basis,
      double? spread,
      @JsonKey(name: 'funding_rate') double? fundingRate,
      @JsonKey(name: 'open_interest') double? openInterest,
      @JsonKey(name: 'volume_24h') double? volume24h,
      @JsonKey(name: 'last_traded_at') DateTime? lastTradedAt,
      @JsonKey(name: 'expired_at') DateTime? expiredAt});
}

/// @nodoc
class __$$MarketExchangeImplCopyWithImpl<$Res>
    extends _$MarketExchangeCopyWithImpl<$Res, _$MarketExchangeImpl>
    implements _$$MarketExchangeImplCopyWith<$Res> {
  __$$MarketExchangeImplCopyWithImpl(
      _$MarketExchangeImpl _value, $Res Function(_$MarketExchangeImpl) _then)
      : super(_value, _then);

  /// Create a copy of MarketExchange
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? market = freezed,
    Object? symbol = freezed,
    Object? indexId = freezed,
    Object? price = freezed,
    Object? pricePercentageChange24h = freezed,
    Object? contractType = freezed,
    Object? index = freezed,
    Object? basis = freezed,
    Object? spread = freezed,
    Object? fundingRate = freezed,
    Object? openInterest = freezed,
    Object? volume24h = freezed,
    Object? lastTradedAt = freezed,
    Object? expiredAt = freezed,
  }) {
    return _then(_$MarketExchangeImpl(
      market: freezed == market
          ? _value.market
          : market // ignore: cast_nullable_to_non_nullable
              as String?,
      symbol: freezed == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String?,
      indexId: freezed == indexId
          ? _value.indexId
          : indexId // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      pricePercentageChange24h: freezed == pricePercentageChange24h
          ? _value.pricePercentageChange24h
          : pricePercentageChange24h // ignore: cast_nullable_to_non_nullable
              as double?,
      contractType: freezed == contractType
          ? _value.contractType
          : contractType // ignore: cast_nullable_to_non_nullable
              as String?,
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as double?,
      basis: freezed == basis
          ? _value.basis
          : basis // ignore: cast_nullable_to_non_nullable
              as double?,
      spread: freezed == spread
          ? _value.spread
          : spread // ignore: cast_nullable_to_non_nullable
              as double?,
      fundingRate: freezed == fundingRate
          ? _value.fundingRate
          : fundingRate // ignore: cast_nullable_to_non_nullable
              as double?,
      openInterest: freezed == openInterest
          ? _value.openInterest
          : openInterest // ignore: cast_nullable_to_non_nullable
              as double?,
      volume24h: freezed == volume24h
          ? _value.volume24h
          : volume24h // ignore: cast_nullable_to_non_nullable
              as double?,
      lastTradedAt: freezed == lastTradedAt
          ? _value.lastTradedAt
          : lastTradedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expiredAt: freezed == expiredAt
          ? _value.expiredAt
          : expiredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MarketExchangeImpl implements _MarketExchange {
  _$MarketExchangeImpl(
      {this.market,
      this.symbol,
      @JsonKey(name: 'index_id') this.indexId,
      this.price,
      @JsonKey(name: 'price_percentage_change_24h')
      this.pricePercentageChange24h,
      @JsonKey(name: 'contract_type') this.contractType,
      this.index,
      this.basis,
      this.spread,
      @JsonKey(name: 'funding_rate') this.fundingRate,
      @JsonKey(name: 'open_interest') this.openInterest,
      @JsonKey(name: 'volume_24h') this.volume24h,
      @JsonKey(name: 'last_traded_at') this.lastTradedAt,
      @JsonKey(name: 'expired_at') this.expiredAt});

  factory _$MarketExchangeImpl.fromJson(Map<String, dynamic> json) =>
      _$$MarketExchangeImplFromJson(json);

  @override
  final String? market;
  @override
  final String? symbol;
  @override
  @JsonKey(name: 'index_id')
  final String? indexId;
  @override
  final String? price;
  @override
  @JsonKey(name: 'price_percentage_change_24h')
  final double? pricePercentageChange24h;
  @override
  @JsonKey(name: 'contract_type')
  final String? contractType;
  @override
  final double? index;
  @override
  final double? basis;
  @override
  final double? spread;
  @override
  @JsonKey(name: 'funding_rate')
  final double? fundingRate;
  @override
  @JsonKey(name: 'open_interest')
  final double? openInterest;
  @override
  @JsonKey(name: 'volume_24h')
  final double? volume24h;
  @override
  @JsonKey(name: 'last_traded_at')
  final DateTime? lastTradedAt;
  @override
  @JsonKey(name: 'expired_at')
  final DateTime? expiredAt;

  @override
  String toString() {
    return 'MarketExchange(market: $market, symbol: $symbol, indexId: $indexId, price: $price, pricePercentageChange24h: $pricePercentageChange24h, contractType: $contractType, index: $index, basis: $basis, spread: $spread, fundingRate: $fundingRate, openInterest: $openInterest, volume24h: $volume24h, lastTradedAt: $lastTradedAt, expiredAt: $expiredAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarketExchangeImpl &&
            (identical(other.market, market) || other.market == market) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.indexId, indexId) || other.indexId == indexId) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(
                    other.pricePercentageChange24h, pricePercentageChange24h) ||
                other.pricePercentageChange24h == pricePercentageChange24h) &&
            (identical(other.contractType, contractType) ||
                other.contractType == contractType) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.basis, basis) || other.basis == basis) &&
            (identical(other.spread, spread) || other.spread == spread) &&
            (identical(other.fundingRate, fundingRate) ||
                other.fundingRate == fundingRate) &&
            (identical(other.openInterest, openInterest) ||
                other.openInterest == openInterest) &&
            (identical(other.volume24h, volume24h) ||
                other.volume24h == volume24h) &&
            (identical(other.lastTradedAt, lastTradedAt) ||
                other.lastTradedAt == lastTradedAt) &&
            (identical(other.expiredAt, expiredAt) ||
                other.expiredAt == expiredAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      market,
      symbol,
      indexId,
      price,
      pricePercentageChange24h,
      contractType,
      index,
      basis,
      spread,
      fundingRate,
      openInterest,
      volume24h,
      lastTradedAt,
      expiredAt);

  /// Create a copy of MarketExchange
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MarketExchangeImplCopyWith<_$MarketExchangeImpl> get copyWith =>
      __$$MarketExchangeImplCopyWithImpl<_$MarketExchangeImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MarketExchangeImplToJson(
      this,
    );
  }
}

abstract class _MarketExchange implements MarketExchange {
  factory _MarketExchange(
          {final String? market,
          final String? symbol,
          @JsonKey(name: 'index_id') final String? indexId,
          final String? price,
          @JsonKey(name: 'price_percentage_change_24h')
          final double? pricePercentageChange24h,
          @JsonKey(name: 'contract_type') final String? contractType,
          final double? index,
          final double? basis,
          final double? spread,
          @JsonKey(name: 'funding_rate') final double? fundingRate,
          @JsonKey(name: 'open_interest') final double? openInterest,
          @JsonKey(name: 'volume_24h') final double? volume24h,
          @JsonKey(name: 'last_traded_at') final DateTime? lastTradedAt,
          @JsonKey(name: 'expired_at') final DateTime? expiredAt}) =
      _$MarketExchangeImpl;

  factory _MarketExchange.fromJson(Map<String, dynamic> json) =
      _$MarketExchangeImpl.fromJson;

  @override
  String? get market;
  @override
  String? get symbol;
  @override
  @JsonKey(name: 'index_id')
  String? get indexId;
  @override
  String? get price;
  @override
  @JsonKey(name: 'price_percentage_change_24h')
  double? get pricePercentageChange24h;
  @override
  @JsonKey(name: 'contract_type')
  String? get contractType;
  @override
  double? get index;
  @override
  double? get basis;
  @override
  double? get spread;
  @override
  @JsonKey(name: 'funding_rate')
  double? get fundingRate;
  @override
  @JsonKey(name: 'open_interest')
  double? get openInterest;
  @override
  @JsonKey(name: 'volume_24h')
  double? get volume24h;
  @override
  @JsonKey(name: 'last_traded_at')
  DateTime? get lastTradedAt;
  @override
  @JsonKey(name: 'expired_at')
  DateTime? get expiredAt;

  /// Create a copy of MarketExchange
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MarketExchangeImplCopyWith<_$MarketExchangeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
