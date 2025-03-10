// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exchange.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Exchange _$ExchangeFromJson(Map<String, dynamic> json) {
  return _Exchange.fromJson(json);
}

/// @nodoc
mixin _$Exchange {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'year_established')
  int? get yearEstablished => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get facebookUrl => throw _privateConstructorUsedError;
  String? get redditUrl => throw _privateConstructorUsedError;
  String? get telegramUrl => throw _privateConstructorUsedError;
  String? get slackUrl => throw _privateConstructorUsedError;
  String? get otherUrl1 => throw _privateConstructorUsedError;
  String? get otherUrl2 => throw _privateConstructorUsedError;
  String? get twitterHandle => throw _privateConstructorUsedError;
  @JsonKey(name: 'has_trading_incentive')
  bool? get hasTradingIncentive => throw _privateConstructorUsedError;
  bool? get centralized => throw _privateConstructorUsedError;
  String? get publicNotice => throw _privateConstructorUsedError;
  String? get alertNotice => throw _privateConstructorUsedError;
  int? get trustScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'trust_score_rank')
  int? get trustScoreRank => throw _privateConstructorUsedError;
  int? get coins => throw _privateConstructorUsedError;
  int? get pairs => throw _privateConstructorUsedError;
  @JsonKey(name: 'trade_volume_24h_btc')
  double? get tradeVolume24hBtc => throw _privateConstructorUsedError;
  @JsonKey(name: 'trade_volume_24h_btc_normalized')
  double? get tradeVolume24hBtcNormalized => throw _privateConstructorUsedError;
  List<TickerExchange>? get tickers => throw _privateConstructorUsedError;

  /// Serializes this Exchange to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Exchange
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExchangeCopyWith<Exchange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExchangeCopyWith<$Res> {
  factory $ExchangeCopyWith(Exchange value, $Res Function(Exchange) then) =
      _$ExchangeCopyWithImpl<$Res, Exchange>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      @JsonKey(name: 'year_established') int? yearEstablished,
      String? country,
      String? description,
      String? url,
      String? image,
      String? facebookUrl,
      String? redditUrl,
      String? telegramUrl,
      String? slackUrl,
      String? otherUrl1,
      String? otherUrl2,
      String? twitterHandle,
      @JsonKey(name: 'has_trading_incentive') bool? hasTradingIncentive,
      bool? centralized,
      String? publicNotice,
      String? alertNotice,
      int? trustScore,
      @JsonKey(name: 'trust_score_rank') int? trustScoreRank,
      int? coins,
      int? pairs,
      @JsonKey(name: 'trade_volume_24h_btc') double? tradeVolume24hBtc,
      @JsonKey(name: 'trade_volume_24h_btc_normalized')
      double? tradeVolume24hBtcNormalized,
      List<TickerExchange>? tickers});
}

/// @nodoc
class _$ExchangeCopyWithImpl<$Res, $Val extends Exchange>
    implements $ExchangeCopyWith<$Res> {
  _$ExchangeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Exchange
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? yearEstablished = freezed,
    Object? country = freezed,
    Object? description = freezed,
    Object? url = freezed,
    Object? image = freezed,
    Object? facebookUrl = freezed,
    Object? redditUrl = freezed,
    Object? telegramUrl = freezed,
    Object? slackUrl = freezed,
    Object? otherUrl1 = freezed,
    Object? otherUrl2 = freezed,
    Object? twitterHandle = freezed,
    Object? hasTradingIncentive = freezed,
    Object? centralized = freezed,
    Object? publicNotice = freezed,
    Object? alertNotice = freezed,
    Object? trustScore = freezed,
    Object? trustScoreRank = freezed,
    Object? coins = freezed,
    Object? pairs = freezed,
    Object? tradeVolume24hBtc = freezed,
    Object? tradeVolume24hBtcNormalized = freezed,
    Object? tickers = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      yearEstablished: freezed == yearEstablished
          ? _value.yearEstablished
          : yearEstablished // ignore: cast_nullable_to_non_nullable
              as int?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      facebookUrl: freezed == facebookUrl
          ? _value.facebookUrl
          : facebookUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      redditUrl: freezed == redditUrl
          ? _value.redditUrl
          : redditUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      telegramUrl: freezed == telegramUrl
          ? _value.telegramUrl
          : telegramUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      slackUrl: freezed == slackUrl
          ? _value.slackUrl
          : slackUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      otherUrl1: freezed == otherUrl1
          ? _value.otherUrl1
          : otherUrl1 // ignore: cast_nullable_to_non_nullable
              as String?,
      otherUrl2: freezed == otherUrl2
          ? _value.otherUrl2
          : otherUrl2 // ignore: cast_nullable_to_non_nullable
              as String?,
      twitterHandle: freezed == twitterHandle
          ? _value.twitterHandle
          : twitterHandle // ignore: cast_nullable_to_non_nullable
              as String?,
      hasTradingIncentive: freezed == hasTradingIncentive
          ? _value.hasTradingIncentive
          : hasTradingIncentive // ignore: cast_nullable_to_non_nullable
              as bool?,
      centralized: freezed == centralized
          ? _value.centralized
          : centralized // ignore: cast_nullable_to_non_nullable
              as bool?,
      publicNotice: freezed == publicNotice
          ? _value.publicNotice
          : publicNotice // ignore: cast_nullable_to_non_nullable
              as String?,
      alertNotice: freezed == alertNotice
          ? _value.alertNotice
          : alertNotice // ignore: cast_nullable_to_non_nullable
              as String?,
      trustScore: freezed == trustScore
          ? _value.trustScore
          : trustScore // ignore: cast_nullable_to_non_nullable
              as int?,
      trustScoreRank: freezed == trustScoreRank
          ? _value.trustScoreRank
          : trustScoreRank // ignore: cast_nullable_to_non_nullable
              as int?,
      coins: freezed == coins
          ? _value.coins
          : coins // ignore: cast_nullable_to_non_nullable
              as int?,
      pairs: freezed == pairs
          ? _value.pairs
          : pairs // ignore: cast_nullable_to_non_nullable
              as int?,
      tradeVolume24hBtc: freezed == tradeVolume24hBtc
          ? _value.tradeVolume24hBtc
          : tradeVolume24hBtc // ignore: cast_nullable_to_non_nullable
              as double?,
      tradeVolume24hBtcNormalized: freezed == tradeVolume24hBtcNormalized
          ? _value.tradeVolume24hBtcNormalized
          : tradeVolume24hBtcNormalized // ignore: cast_nullable_to_non_nullable
              as double?,
      tickers: freezed == tickers
          ? _value.tickers
          : tickers // ignore: cast_nullable_to_non_nullable
              as List<TickerExchange>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExchangeImplCopyWith<$Res>
    implements $ExchangeCopyWith<$Res> {
  factory _$$ExchangeImplCopyWith(
          _$ExchangeImpl value, $Res Function(_$ExchangeImpl) then) =
      __$$ExchangeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      @JsonKey(name: 'year_established') int? yearEstablished,
      String? country,
      String? description,
      String? url,
      String? image,
      String? facebookUrl,
      String? redditUrl,
      String? telegramUrl,
      String? slackUrl,
      String? otherUrl1,
      String? otherUrl2,
      String? twitterHandle,
      @JsonKey(name: 'has_trading_incentive') bool? hasTradingIncentive,
      bool? centralized,
      String? publicNotice,
      String? alertNotice,
      int? trustScore,
      @JsonKey(name: 'trust_score_rank') int? trustScoreRank,
      int? coins,
      int? pairs,
      @JsonKey(name: 'trade_volume_24h_btc') double? tradeVolume24hBtc,
      @JsonKey(name: 'trade_volume_24h_btc_normalized')
      double? tradeVolume24hBtcNormalized,
      List<TickerExchange>? tickers});
}

/// @nodoc
class __$$ExchangeImplCopyWithImpl<$Res>
    extends _$ExchangeCopyWithImpl<$Res, _$ExchangeImpl>
    implements _$$ExchangeImplCopyWith<$Res> {
  __$$ExchangeImplCopyWithImpl(
      _$ExchangeImpl _value, $Res Function(_$ExchangeImpl) _then)
      : super(_value, _then);

  /// Create a copy of Exchange
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? yearEstablished = freezed,
    Object? country = freezed,
    Object? description = freezed,
    Object? url = freezed,
    Object? image = freezed,
    Object? facebookUrl = freezed,
    Object? redditUrl = freezed,
    Object? telegramUrl = freezed,
    Object? slackUrl = freezed,
    Object? otherUrl1 = freezed,
    Object? otherUrl2 = freezed,
    Object? twitterHandle = freezed,
    Object? hasTradingIncentive = freezed,
    Object? centralized = freezed,
    Object? publicNotice = freezed,
    Object? alertNotice = freezed,
    Object? trustScore = freezed,
    Object? trustScoreRank = freezed,
    Object? coins = freezed,
    Object? pairs = freezed,
    Object? tradeVolume24hBtc = freezed,
    Object? tradeVolume24hBtcNormalized = freezed,
    Object? tickers = freezed,
  }) {
    return _then(_$ExchangeImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      yearEstablished: freezed == yearEstablished
          ? _value.yearEstablished
          : yearEstablished // ignore: cast_nullable_to_non_nullable
              as int?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      facebookUrl: freezed == facebookUrl
          ? _value.facebookUrl
          : facebookUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      redditUrl: freezed == redditUrl
          ? _value.redditUrl
          : redditUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      telegramUrl: freezed == telegramUrl
          ? _value.telegramUrl
          : telegramUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      slackUrl: freezed == slackUrl
          ? _value.slackUrl
          : slackUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      otherUrl1: freezed == otherUrl1
          ? _value.otherUrl1
          : otherUrl1 // ignore: cast_nullable_to_non_nullable
              as String?,
      otherUrl2: freezed == otherUrl2
          ? _value.otherUrl2
          : otherUrl2 // ignore: cast_nullable_to_non_nullable
              as String?,
      twitterHandle: freezed == twitterHandle
          ? _value.twitterHandle
          : twitterHandle // ignore: cast_nullable_to_non_nullable
              as String?,
      hasTradingIncentive: freezed == hasTradingIncentive
          ? _value.hasTradingIncentive
          : hasTradingIncentive // ignore: cast_nullable_to_non_nullable
              as bool?,
      centralized: freezed == centralized
          ? _value.centralized
          : centralized // ignore: cast_nullable_to_non_nullable
              as bool?,
      publicNotice: freezed == publicNotice
          ? _value.publicNotice
          : publicNotice // ignore: cast_nullable_to_non_nullable
              as String?,
      alertNotice: freezed == alertNotice
          ? _value.alertNotice
          : alertNotice // ignore: cast_nullable_to_non_nullable
              as String?,
      trustScore: freezed == trustScore
          ? _value.trustScore
          : trustScore // ignore: cast_nullable_to_non_nullable
              as int?,
      trustScoreRank: freezed == trustScoreRank
          ? _value.trustScoreRank
          : trustScoreRank // ignore: cast_nullable_to_non_nullable
              as int?,
      coins: freezed == coins
          ? _value.coins
          : coins // ignore: cast_nullable_to_non_nullable
              as int?,
      pairs: freezed == pairs
          ? _value.pairs
          : pairs // ignore: cast_nullable_to_non_nullable
              as int?,
      tradeVolume24hBtc: freezed == tradeVolume24hBtc
          ? _value.tradeVolume24hBtc
          : tradeVolume24hBtc // ignore: cast_nullable_to_non_nullable
              as double?,
      tradeVolume24hBtcNormalized: freezed == tradeVolume24hBtcNormalized
          ? _value.tradeVolume24hBtcNormalized
          : tradeVolume24hBtcNormalized // ignore: cast_nullable_to_non_nullable
              as double?,
      tickers: freezed == tickers
          ? _value._tickers
          : tickers // ignore: cast_nullable_to_non_nullable
              as List<TickerExchange>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExchangeImpl implements _Exchange {
  _$ExchangeImpl(
      {this.id,
      this.name,
      @JsonKey(name: 'year_established') this.yearEstablished,
      this.country,
      this.description,
      this.url,
      this.image,
      this.facebookUrl,
      this.redditUrl,
      this.telegramUrl,
      this.slackUrl,
      this.otherUrl1,
      this.otherUrl2,
      this.twitterHandle,
      @JsonKey(name: 'has_trading_incentive') this.hasTradingIncentive,
      this.centralized,
      this.publicNotice,
      this.alertNotice,
      this.trustScore,
      @JsonKey(name: 'trust_score_rank') this.trustScoreRank,
      this.coins,
      this.pairs,
      @JsonKey(name: 'trade_volume_24h_btc') this.tradeVolume24hBtc,
      @JsonKey(name: 'trade_volume_24h_btc_normalized')
      this.tradeVolume24hBtcNormalized,
      final List<TickerExchange>? tickers})
      : _tickers = tickers;

  factory _$ExchangeImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExchangeImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  @JsonKey(name: 'year_established')
  final int? yearEstablished;
  @override
  final String? country;
  @override
  final String? description;
  @override
  final String? url;
  @override
  final String? image;
  @override
  final String? facebookUrl;
  @override
  final String? redditUrl;
  @override
  final String? telegramUrl;
  @override
  final String? slackUrl;
  @override
  final String? otherUrl1;
  @override
  final String? otherUrl2;
  @override
  final String? twitterHandle;
  @override
  @JsonKey(name: 'has_trading_incentive')
  final bool? hasTradingIncentive;
  @override
  final bool? centralized;
  @override
  final String? publicNotice;
  @override
  final String? alertNotice;
  @override
  final int? trustScore;
  @override
  @JsonKey(name: 'trust_score_rank')
  final int? trustScoreRank;
  @override
  final int? coins;
  @override
  final int? pairs;
  @override
  @JsonKey(name: 'trade_volume_24h_btc')
  final double? tradeVolume24hBtc;
  @override
  @JsonKey(name: 'trade_volume_24h_btc_normalized')
  final double? tradeVolume24hBtcNormalized;
  final List<TickerExchange>? _tickers;
  @override
  List<TickerExchange>? get tickers {
    final value = _tickers;
    if (value == null) return null;
    if (_tickers is EqualUnmodifiableListView) return _tickers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Exchange(id: $id, name: $name, yearEstablished: $yearEstablished, country: $country, description: $description, url: $url, image: $image, facebookUrl: $facebookUrl, redditUrl: $redditUrl, telegramUrl: $telegramUrl, slackUrl: $slackUrl, otherUrl1: $otherUrl1, otherUrl2: $otherUrl2, twitterHandle: $twitterHandle, hasTradingIncentive: $hasTradingIncentive, centralized: $centralized, publicNotice: $publicNotice, alertNotice: $alertNotice, trustScore: $trustScore, trustScoreRank: $trustScoreRank, coins: $coins, pairs: $pairs, tradeVolume24hBtc: $tradeVolume24hBtc, tradeVolume24hBtcNormalized: $tradeVolume24hBtcNormalized, tickers: $tickers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExchangeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.yearEstablished, yearEstablished) ||
                other.yearEstablished == yearEstablished) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.facebookUrl, facebookUrl) ||
                other.facebookUrl == facebookUrl) &&
            (identical(other.redditUrl, redditUrl) ||
                other.redditUrl == redditUrl) &&
            (identical(other.telegramUrl, telegramUrl) ||
                other.telegramUrl == telegramUrl) &&
            (identical(other.slackUrl, slackUrl) ||
                other.slackUrl == slackUrl) &&
            (identical(other.otherUrl1, otherUrl1) ||
                other.otherUrl1 == otherUrl1) &&
            (identical(other.otherUrl2, otherUrl2) ||
                other.otherUrl2 == otherUrl2) &&
            (identical(other.twitterHandle, twitterHandle) ||
                other.twitterHandle == twitterHandle) &&
            (identical(other.hasTradingIncentive, hasTradingIncentive) ||
                other.hasTradingIncentive == hasTradingIncentive) &&
            (identical(other.centralized, centralized) ||
                other.centralized == centralized) &&
            (identical(other.publicNotice, publicNotice) ||
                other.publicNotice == publicNotice) &&
            (identical(other.alertNotice, alertNotice) ||
                other.alertNotice == alertNotice) &&
            (identical(other.trustScore, trustScore) ||
                other.trustScore == trustScore) &&
            (identical(other.trustScoreRank, trustScoreRank) ||
                other.trustScoreRank == trustScoreRank) &&
            (identical(other.coins, coins) || other.coins == coins) &&
            (identical(other.pairs, pairs) || other.pairs == pairs) &&
            (identical(other.tradeVolume24hBtc, tradeVolume24hBtc) ||
                other.tradeVolume24hBtc == tradeVolume24hBtc) &&
            (identical(other.tradeVolume24hBtcNormalized,
                    tradeVolume24hBtcNormalized) ||
                other.tradeVolume24hBtcNormalized ==
                    tradeVolume24hBtcNormalized) &&
            const DeepCollectionEquality().equals(other._tickers, _tickers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        name,
        yearEstablished,
        country,
        description,
        url,
        image,
        facebookUrl,
        redditUrl,
        telegramUrl,
        slackUrl,
        otherUrl1,
        otherUrl2,
        twitterHandle,
        hasTradingIncentive,
        centralized,
        publicNotice,
        alertNotice,
        trustScore,
        trustScoreRank,
        coins,
        pairs,
        tradeVolume24hBtc,
        tradeVolume24hBtcNormalized,
        const DeepCollectionEquality().hash(_tickers)
      ]);

  /// Create a copy of Exchange
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExchangeImplCopyWith<_$ExchangeImpl> get copyWith =>
      __$$ExchangeImplCopyWithImpl<_$ExchangeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExchangeImplToJson(
      this,
    );
  }
}

abstract class _Exchange implements Exchange {
  factory _Exchange(
      {final String? id,
      final String? name,
      @JsonKey(name: 'year_established') final int? yearEstablished,
      final String? country,
      final String? description,
      final String? url,
      final String? image,
      final String? facebookUrl,
      final String? redditUrl,
      final String? telegramUrl,
      final String? slackUrl,
      final String? otherUrl1,
      final String? otherUrl2,
      final String? twitterHandle,
      @JsonKey(name: 'has_trading_incentive') final bool? hasTradingIncentive,
      final bool? centralized,
      final String? publicNotice,
      final String? alertNotice,
      final int? trustScore,
      @JsonKey(name: 'trust_score_rank') final int? trustScoreRank,
      final int? coins,
      final int? pairs,
      @JsonKey(name: 'trade_volume_24h_btc') final double? tradeVolume24hBtc,
      @JsonKey(name: 'trade_volume_24h_btc_normalized')
      final double? tradeVolume24hBtcNormalized,
      final List<TickerExchange>? tickers}) = _$ExchangeImpl;

  factory _Exchange.fromJson(Map<String, dynamic> json) =
      _$ExchangeImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  @JsonKey(name: 'year_established')
  int? get yearEstablished;
  @override
  String? get country;
  @override
  String? get description;
  @override
  String? get url;
  @override
  String? get image;
  @override
  String? get facebookUrl;
  @override
  String? get redditUrl;
  @override
  String? get telegramUrl;
  @override
  String? get slackUrl;
  @override
  String? get otherUrl1;
  @override
  String? get otherUrl2;
  @override
  String? get twitterHandle;
  @override
  @JsonKey(name: 'has_trading_incentive')
  bool? get hasTradingIncentive;
  @override
  bool? get centralized;
  @override
  String? get publicNotice;
  @override
  String? get alertNotice;
  @override
  int? get trustScore;
  @override
  @JsonKey(name: 'trust_score_rank')
  int? get trustScoreRank;
  @override
  int? get coins;
  @override
  int? get pairs;
  @override
  @JsonKey(name: 'trade_volume_24h_btc')
  double? get tradeVolume24hBtc;
  @override
  @JsonKey(name: 'trade_volume_24h_btc_normalized')
  double? get tradeVolume24hBtcNormalized;
  @override
  List<TickerExchange>? get tickers;

  /// Create a copy of Exchange
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExchangeImplCopyWith<_$ExchangeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
