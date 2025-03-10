// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticker_exchange.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TickerExchange _$TickerExchangeFromJson(Map<String, dynamic> json) {
  return _TickerExchange.fromJson(json);
}

/// @nodoc
mixin _$TickerExchange {
  String? get base => throw _privateConstructorUsedError;
  String? get targetName =>
      throw _privateConstructorUsedError; //xử lí khi call api -> data dư thừa
  dynamic? get market => throw _privateConstructorUsedError; //Chưa xử lí
  double? get last => throw _privateConstructorUsedError;
  double? get volume => throw _privateConstructorUsedError;
  @JsonKey(name: 'converted_last')
  ConvertedMarket? get convertedLast => throw _privateConstructorUsedError;
  @JsonKey(name: 'converted_volume')
  ConvertedMarket? get convertedVolume => throw _privateConstructorUsedError;
  String? get trustScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'bid_ask_spread_percentage')
  double? get bidAskSpreadPercentage => throw _privateConstructorUsedError;
  DateTime? get timestamp => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_traded_at')
  DateTime? get lastTradedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_fetch_at')
  DateTime? get lastFetchAt => throw _privateConstructorUsedError;
  bool? get isAnomaly => throw _privateConstructorUsedError;
  bool? get isStale => throw _privateConstructorUsedError;
  String? get tradeUrl => throw _privateConstructorUsedError;
  String? get tokenInfoUrl => throw _privateConstructorUsedError;
  String? get coinId => throw _privateConstructorUsedError;
  String? get targetCoinId => throw _privateConstructorUsedError;

  /// Serializes this TickerExchange to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TickerExchange
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TickerExchangeCopyWith<TickerExchange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TickerExchangeCopyWith<$Res> {
  factory $TickerExchangeCopyWith(
          TickerExchange value, $Res Function(TickerExchange) then) =
      _$TickerExchangeCopyWithImpl<$Res, TickerExchange>;
  @useResult
  $Res call(
      {String? base,
      String? targetName,
      dynamic? market,
      double? last,
      double? volume,
      @JsonKey(name: 'converted_last') ConvertedMarket? convertedLast,
      @JsonKey(name: 'converted_volume') ConvertedMarket? convertedVolume,
      String? trustScore,
      @JsonKey(name: 'bid_ask_spread_percentage')
      double? bidAskSpreadPercentage,
      DateTime? timestamp,
      @JsonKey(name: 'last_traded_at') DateTime? lastTradedAt,
      @JsonKey(name: 'last_fetch_at') DateTime? lastFetchAt,
      bool? isAnomaly,
      bool? isStale,
      String? tradeUrl,
      String? tokenInfoUrl,
      String? coinId,
      String? targetCoinId});

  $ConvertedMarketCopyWith<$Res>? get convertedLast;
  $ConvertedMarketCopyWith<$Res>? get convertedVolume;
}

/// @nodoc
class _$TickerExchangeCopyWithImpl<$Res, $Val extends TickerExchange>
    implements $TickerExchangeCopyWith<$Res> {
  _$TickerExchangeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TickerExchange
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? base = freezed,
    Object? targetName = freezed,
    Object? market = freezed,
    Object? last = freezed,
    Object? volume = freezed,
    Object? convertedLast = freezed,
    Object? convertedVolume = freezed,
    Object? trustScore = freezed,
    Object? bidAskSpreadPercentage = freezed,
    Object? timestamp = freezed,
    Object? lastTradedAt = freezed,
    Object? lastFetchAt = freezed,
    Object? isAnomaly = freezed,
    Object? isStale = freezed,
    Object? tradeUrl = freezed,
    Object? tokenInfoUrl = freezed,
    Object? coinId = freezed,
    Object? targetCoinId = freezed,
  }) {
    return _then(_value.copyWith(
      base: freezed == base
          ? _value.base
          : base // ignore: cast_nullable_to_non_nullable
              as String?,
      targetName: freezed == targetName
          ? _value.targetName
          : targetName // ignore: cast_nullable_to_non_nullable
              as String?,
      market: freezed == market
          ? _value.market
          : market // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      last: freezed == last
          ? _value.last
          : last // ignore: cast_nullable_to_non_nullable
              as double?,
      volume: freezed == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as double?,
      convertedLast: freezed == convertedLast
          ? _value.convertedLast
          : convertedLast // ignore: cast_nullable_to_non_nullable
              as ConvertedMarket?,
      convertedVolume: freezed == convertedVolume
          ? _value.convertedVolume
          : convertedVolume // ignore: cast_nullable_to_non_nullable
              as ConvertedMarket?,
      trustScore: freezed == trustScore
          ? _value.trustScore
          : trustScore // ignore: cast_nullable_to_non_nullable
              as String?,
      bidAskSpreadPercentage: freezed == bidAskSpreadPercentage
          ? _value.bidAskSpreadPercentage
          : bidAskSpreadPercentage // ignore: cast_nullable_to_non_nullable
              as double?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastTradedAt: freezed == lastTradedAt
          ? _value.lastTradedAt
          : lastTradedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastFetchAt: freezed == lastFetchAt
          ? _value.lastFetchAt
          : lastFetchAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isAnomaly: freezed == isAnomaly
          ? _value.isAnomaly
          : isAnomaly // ignore: cast_nullable_to_non_nullable
              as bool?,
      isStale: freezed == isStale
          ? _value.isStale
          : isStale // ignore: cast_nullable_to_non_nullable
              as bool?,
      tradeUrl: freezed == tradeUrl
          ? _value.tradeUrl
          : tradeUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenInfoUrl: freezed == tokenInfoUrl
          ? _value.tokenInfoUrl
          : tokenInfoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      coinId: freezed == coinId
          ? _value.coinId
          : coinId // ignore: cast_nullable_to_non_nullable
              as String?,
      targetCoinId: freezed == targetCoinId
          ? _value.targetCoinId
          : targetCoinId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of TickerExchange
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ConvertedMarketCopyWith<$Res>? get convertedLast {
    if (_value.convertedLast == null) {
      return null;
    }

    return $ConvertedMarketCopyWith<$Res>(_value.convertedLast!, (value) {
      return _then(_value.copyWith(convertedLast: value) as $Val);
    });
  }

  /// Create a copy of TickerExchange
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ConvertedMarketCopyWith<$Res>? get convertedVolume {
    if (_value.convertedVolume == null) {
      return null;
    }

    return $ConvertedMarketCopyWith<$Res>(_value.convertedVolume!, (value) {
      return _then(_value.copyWith(convertedVolume: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TickerExchangeImplCopyWith<$Res>
    implements $TickerExchangeCopyWith<$Res> {
  factory _$$TickerExchangeImplCopyWith(_$TickerExchangeImpl value,
          $Res Function(_$TickerExchangeImpl) then) =
      __$$TickerExchangeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? base,
      String? targetName,
      dynamic? market,
      double? last,
      double? volume,
      @JsonKey(name: 'converted_last') ConvertedMarket? convertedLast,
      @JsonKey(name: 'converted_volume') ConvertedMarket? convertedVolume,
      String? trustScore,
      @JsonKey(name: 'bid_ask_spread_percentage')
      double? bidAskSpreadPercentage,
      DateTime? timestamp,
      @JsonKey(name: 'last_traded_at') DateTime? lastTradedAt,
      @JsonKey(name: 'last_fetch_at') DateTime? lastFetchAt,
      bool? isAnomaly,
      bool? isStale,
      String? tradeUrl,
      String? tokenInfoUrl,
      String? coinId,
      String? targetCoinId});

  @override
  $ConvertedMarketCopyWith<$Res>? get convertedLast;
  @override
  $ConvertedMarketCopyWith<$Res>? get convertedVolume;
}

/// @nodoc
class __$$TickerExchangeImplCopyWithImpl<$Res>
    extends _$TickerExchangeCopyWithImpl<$Res, _$TickerExchangeImpl>
    implements _$$TickerExchangeImplCopyWith<$Res> {
  __$$TickerExchangeImplCopyWithImpl(
      _$TickerExchangeImpl _value, $Res Function(_$TickerExchangeImpl) _then)
      : super(_value, _then);

  /// Create a copy of TickerExchange
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? base = freezed,
    Object? targetName = freezed,
    Object? market = freezed,
    Object? last = freezed,
    Object? volume = freezed,
    Object? convertedLast = freezed,
    Object? convertedVolume = freezed,
    Object? trustScore = freezed,
    Object? bidAskSpreadPercentage = freezed,
    Object? timestamp = freezed,
    Object? lastTradedAt = freezed,
    Object? lastFetchAt = freezed,
    Object? isAnomaly = freezed,
    Object? isStale = freezed,
    Object? tradeUrl = freezed,
    Object? tokenInfoUrl = freezed,
    Object? coinId = freezed,
    Object? targetCoinId = freezed,
  }) {
    return _then(_$TickerExchangeImpl(
      base: freezed == base
          ? _value.base
          : base // ignore: cast_nullable_to_non_nullable
              as String?,
      targetName: freezed == targetName
          ? _value.targetName
          : targetName // ignore: cast_nullable_to_non_nullable
              as String?,
      market: freezed == market
          ? _value.market
          : market // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      last: freezed == last
          ? _value.last
          : last // ignore: cast_nullable_to_non_nullable
              as double?,
      volume: freezed == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as double?,
      convertedLast: freezed == convertedLast
          ? _value.convertedLast
          : convertedLast // ignore: cast_nullable_to_non_nullable
              as ConvertedMarket?,
      convertedVolume: freezed == convertedVolume
          ? _value.convertedVolume
          : convertedVolume // ignore: cast_nullable_to_non_nullable
              as ConvertedMarket?,
      trustScore: freezed == trustScore
          ? _value.trustScore
          : trustScore // ignore: cast_nullable_to_non_nullable
              as String?,
      bidAskSpreadPercentage: freezed == bidAskSpreadPercentage
          ? _value.bidAskSpreadPercentage
          : bidAskSpreadPercentage // ignore: cast_nullable_to_non_nullable
              as double?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastTradedAt: freezed == lastTradedAt
          ? _value.lastTradedAt
          : lastTradedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastFetchAt: freezed == lastFetchAt
          ? _value.lastFetchAt
          : lastFetchAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isAnomaly: freezed == isAnomaly
          ? _value.isAnomaly
          : isAnomaly // ignore: cast_nullable_to_non_nullable
              as bool?,
      isStale: freezed == isStale
          ? _value.isStale
          : isStale // ignore: cast_nullable_to_non_nullable
              as bool?,
      tradeUrl: freezed == tradeUrl
          ? _value.tradeUrl
          : tradeUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenInfoUrl: freezed == tokenInfoUrl
          ? _value.tokenInfoUrl
          : tokenInfoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      coinId: freezed == coinId
          ? _value.coinId
          : coinId // ignore: cast_nullable_to_non_nullable
              as String?,
      targetCoinId: freezed == targetCoinId
          ? _value.targetCoinId
          : targetCoinId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TickerExchangeImpl implements _TickerExchange {
  _$TickerExchangeImpl(
      {this.base,
      this.targetName,
      this.market,
      this.last,
      this.volume,
      @JsonKey(name: 'converted_last') this.convertedLast,
      @JsonKey(name: 'converted_volume') this.convertedVolume,
      this.trustScore,
      @JsonKey(name: 'bid_ask_spread_percentage') this.bidAskSpreadPercentage,
      this.timestamp,
      @JsonKey(name: 'last_traded_at') this.lastTradedAt,
      @JsonKey(name: 'last_fetch_at') this.lastFetchAt,
      this.isAnomaly,
      this.isStale,
      this.tradeUrl,
      this.tokenInfoUrl,
      this.coinId,
      this.targetCoinId});

  factory _$TickerExchangeImpl.fromJson(Map<String, dynamic> json) =>
      _$$TickerExchangeImplFromJson(json);

  @override
  final String? base;
  @override
  final String? targetName;
//xử lí khi call api -> data dư thừa
  @override
  final dynamic? market;
//Chưa xử lí
  @override
  final double? last;
  @override
  final double? volume;
  @override
  @JsonKey(name: 'converted_last')
  final ConvertedMarket? convertedLast;
  @override
  @JsonKey(name: 'converted_volume')
  final ConvertedMarket? convertedVolume;
  @override
  final String? trustScore;
  @override
  @JsonKey(name: 'bid_ask_spread_percentage')
  final double? bidAskSpreadPercentage;
  @override
  final DateTime? timestamp;
  @override
  @JsonKey(name: 'last_traded_at')
  final DateTime? lastTradedAt;
  @override
  @JsonKey(name: 'last_fetch_at')
  final DateTime? lastFetchAt;
  @override
  final bool? isAnomaly;
  @override
  final bool? isStale;
  @override
  final String? tradeUrl;
  @override
  final String? tokenInfoUrl;
  @override
  final String? coinId;
  @override
  final String? targetCoinId;

  @override
  String toString() {
    return 'TickerExchange(base: $base, targetName: $targetName, market: $market, last: $last, volume: $volume, convertedLast: $convertedLast, convertedVolume: $convertedVolume, trustScore: $trustScore, bidAskSpreadPercentage: $bidAskSpreadPercentage, timestamp: $timestamp, lastTradedAt: $lastTradedAt, lastFetchAt: $lastFetchAt, isAnomaly: $isAnomaly, isStale: $isStale, tradeUrl: $tradeUrl, tokenInfoUrl: $tokenInfoUrl, coinId: $coinId, targetCoinId: $targetCoinId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TickerExchangeImpl &&
            (identical(other.base, base) || other.base == base) &&
            (identical(other.targetName, targetName) ||
                other.targetName == targetName) &&
            const DeepCollectionEquality().equals(other.market, market) &&
            (identical(other.last, last) || other.last == last) &&
            (identical(other.volume, volume) || other.volume == volume) &&
            (identical(other.convertedLast, convertedLast) ||
                other.convertedLast == convertedLast) &&
            (identical(other.convertedVolume, convertedVolume) ||
                other.convertedVolume == convertedVolume) &&
            (identical(other.trustScore, trustScore) ||
                other.trustScore == trustScore) &&
            (identical(other.bidAskSpreadPercentage, bidAskSpreadPercentage) ||
                other.bidAskSpreadPercentage == bidAskSpreadPercentage) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.lastTradedAt, lastTradedAt) ||
                other.lastTradedAt == lastTradedAt) &&
            (identical(other.lastFetchAt, lastFetchAt) ||
                other.lastFetchAt == lastFetchAt) &&
            (identical(other.isAnomaly, isAnomaly) ||
                other.isAnomaly == isAnomaly) &&
            (identical(other.isStale, isStale) || other.isStale == isStale) &&
            (identical(other.tradeUrl, tradeUrl) ||
                other.tradeUrl == tradeUrl) &&
            (identical(other.tokenInfoUrl, tokenInfoUrl) ||
                other.tokenInfoUrl == tokenInfoUrl) &&
            (identical(other.coinId, coinId) || other.coinId == coinId) &&
            (identical(other.targetCoinId, targetCoinId) ||
                other.targetCoinId == targetCoinId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      base,
      targetName,
      const DeepCollectionEquality().hash(market),
      last,
      volume,
      convertedLast,
      convertedVolume,
      trustScore,
      bidAskSpreadPercentage,
      timestamp,
      lastTradedAt,
      lastFetchAt,
      isAnomaly,
      isStale,
      tradeUrl,
      tokenInfoUrl,
      coinId,
      targetCoinId);

  /// Create a copy of TickerExchange
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TickerExchangeImplCopyWith<_$TickerExchangeImpl> get copyWith =>
      __$$TickerExchangeImplCopyWithImpl<_$TickerExchangeImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TickerExchangeImplToJson(
      this,
    );
  }
}

abstract class _TickerExchange implements TickerExchange {
  factory _TickerExchange(
      {final String? base,
      final String? targetName,
      final dynamic? market,
      final double? last,
      final double? volume,
      @JsonKey(name: 'converted_last') final ConvertedMarket? convertedLast,
      @JsonKey(name: 'converted_volume') final ConvertedMarket? convertedVolume,
      final String? trustScore,
      @JsonKey(name: 'bid_ask_spread_percentage')
      final double? bidAskSpreadPercentage,
      final DateTime? timestamp,
      @JsonKey(name: 'last_traded_at') final DateTime? lastTradedAt,
      @JsonKey(name: 'last_fetch_at') final DateTime? lastFetchAt,
      final bool? isAnomaly,
      final bool? isStale,
      final String? tradeUrl,
      final String? tokenInfoUrl,
      final String? coinId,
      final String? targetCoinId}) = _$TickerExchangeImpl;

  factory _TickerExchange.fromJson(Map<String, dynamic> json) =
      _$TickerExchangeImpl.fromJson;

  @override
  String? get base;
  @override
  String? get targetName; //xử lí khi call api -> data dư thừa
  @override
  dynamic? get market; //Chưa xử lí
  @override
  double? get last;
  @override
  double? get volume;
  @override
  @JsonKey(name: 'converted_last')
  ConvertedMarket? get convertedLast;
  @override
  @JsonKey(name: 'converted_volume')
  ConvertedMarket? get convertedVolume;
  @override
  String? get trustScore;
  @override
  @JsonKey(name: 'bid_ask_spread_percentage')
  double? get bidAskSpreadPercentage;
  @override
  DateTime? get timestamp;
  @override
  @JsonKey(name: 'last_traded_at')
  DateTime? get lastTradedAt;
  @override
  @JsonKey(name: 'last_fetch_at')
  DateTime? get lastFetchAt;
  @override
  bool? get isAnomaly;
  @override
  bool? get isStale;
  @override
  String? get tradeUrl;
  @override
  String? get tokenInfoUrl;
  @override
  String? get coinId;
  @override
  String? get targetCoinId;

  /// Create a copy of TickerExchange
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TickerExchangeImplCopyWith<_$TickerExchangeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
