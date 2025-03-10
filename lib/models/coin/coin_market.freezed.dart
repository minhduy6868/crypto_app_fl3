// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coin_market.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CoinMarket _$CoinMarketFromJson(Map<String, dynamic> json) {
  return _CoinMarket.fromJson(json);
}

/// @nodoc
mixin _$CoinMarket {
  String? get id => throw _privateConstructorUsedError;
  String? get symbol => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_price')
  double? get currentPrice => throw _privateConstructorUsedError; // Nullable
  @JsonKey(name: 'market_cap')
  int? get marketCap => throw _privateConstructorUsedError; // Nullable
  @JsonKey(name: 'market_cap_rank')
  int? get marketCapRank => throw _privateConstructorUsedError; // Nullable
  @JsonKey(name: 'fully_diluted_valuation')
  int? get fullyDilutedValuation =>
      throw _privateConstructorUsedError; // Nullable
  @JsonKey(name: 'total_volume')
  int? get totalVolume => throw _privateConstructorUsedError; // Nullable
  @JsonKey(name: 'high_24h')
  double? get high24h => throw _privateConstructorUsedError; // Nullable
  @JsonKey(name: 'low_24h')
  double? get low24h => throw _privateConstructorUsedError; // Nullable
  @JsonKey(name: 'price_change_24h')
  double? get priceChange24h => throw _privateConstructorUsedError; // Nullable
  @JsonKey(name: 'price_change_percentage_24h')
  double? get priceChangePercentage24h =>
      throw _privateConstructorUsedError; // Nullable
  @JsonKey(name: 'market_cap_change_24h')
  double? get marketCapChange24h =>
      throw _privateConstructorUsedError; // Nullable
  @JsonKey(name: 'market_cap_change_percentage_24h')
  double? get marketCapChangePercentage24h =>
      throw _privateConstructorUsedError; // Nullable
  @JsonKey(name: 'circulating_supply')
  double? get circulatingSupply =>
      throw _privateConstructorUsedError; // Nullable
  @JsonKey(name: 'total_supply')
  double? get totalSupply => throw _privateConstructorUsedError; // Nullable
  @JsonKey(name: 'max_supply')
  double? get maxSupply => throw _privateConstructorUsedError; // Nullable
  double? get ath => throw _privateConstructorUsedError; // Nullable
  @JsonKey(name: 'ath_change_percentage')
  double? get athChangePercentage =>
      throw _privateConstructorUsedError; // Nullable
  @JsonKey(name: 'ath_date')
  String? get athDate => throw _privateConstructorUsedError; // Nullable
  double? get atl => throw _privateConstructorUsedError; // Nullable
  @JsonKey(name: 'atl_change_percentage')
  double? get atlChangePercentage =>
      throw _privateConstructorUsedError; // Nullable
  @JsonKey(name: 'atl_date')
  String? get atlDate => throw _privateConstructorUsedError; // Nullable
  RoiModel? get roi => throw _privateConstructorUsedError; // Nullable
  @JsonKey(name: 'last_updated')
  String? get lastUpdated => throw _privateConstructorUsedError; // Nullable
  @JsonKey(name: 'sparkline_in_7d')
  SparklineIn7dModel? get sparklineIn7d => throw _privateConstructorUsedError;

  /// Serializes this CoinMarket to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CoinMarket
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CoinMarketCopyWith<CoinMarket> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoinMarketCopyWith<$Res> {
  factory $CoinMarketCopyWith(
          CoinMarket value, $Res Function(CoinMarket) then) =
      _$CoinMarketCopyWithImpl<$Res, CoinMarket>;
  @useResult
  $Res call(
      {String? id,
      String? symbol,
      String? name,
      String? image,
      String? description,
      @JsonKey(name: 'current_price') double? currentPrice,
      @JsonKey(name: 'market_cap') int? marketCap,
      @JsonKey(name: 'market_cap_rank') int? marketCapRank,
      @JsonKey(name: 'fully_diluted_valuation') int? fullyDilutedValuation,
      @JsonKey(name: 'total_volume') int? totalVolume,
      @JsonKey(name: 'high_24h') double? high24h,
      @JsonKey(name: 'low_24h') double? low24h,
      @JsonKey(name: 'price_change_24h') double? priceChange24h,
      @JsonKey(name: 'price_change_percentage_24h')
      double? priceChangePercentage24h,
      @JsonKey(name: 'market_cap_change_24h') double? marketCapChange24h,
      @JsonKey(name: 'market_cap_change_percentage_24h')
      double? marketCapChangePercentage24h,
      @JsonKey(name: 'circulating_supply') double? circulatingSupply,
      @JsonKey(name: 'total_supply') double? totalSupply,
      @JsonKey(name: 'max_supply') double? maxSupply,
      double? ath,
      @JsonKey(name: 'ath_change_percentage') double? athChangePercentage,
      @JsonKey(name: 'ath_date') String? athDate,
      double? atl,
      @JsonKey(name: 'atl_change_percentage') double? atlChangePercentage,
      @JsonKey(name: 'atl_date') String? atlDate,
      RoiModel? roi,
      @JsonKey(name: 'last_updated') String? lastUpdated,
      @JsonKey(name: 'sparkline_in_7d') SparklineIn7dModel? sparklineIn7d});

  $RoiModelCopyWith<$Res>? get roi;
  $SparklineIn7dModelCopyWith<$Res>? get sparklineIn7d;
}

/// @nodoc
class _$CoinMarketCopyWithImpl<$Res, $Val extends CoinMarket>
    implements $CoinMarketCopyWith<$Res> {
  _$CoinMarketCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CoinMarket
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? symbol = freezed,
    Object? name = freezed,
    Object? image = freezed,
    Object? description = freezed,
    Object? currentPrice = freezed,
    Object? marketCap = freezed,
    Object? marketCapRank = freezed,
    Object? fullyDilutedValuation = freezed,
    Object? totalVolume = freezed,
    Object? high24h = freezed,
    Object? low24h = freezed,
    Object? priceChange24h = freezed,
    Object? priceChangePercentage24h = freezed,
    Object? marketCapChange24h = freezed,
    Object? marketCapChangePercentage24h = freezed,
    Object? circulatingSupply = freezed,
    Object? totalSupply = freezed,
    Object? maxSupply = freezed,
    Object? ath = freezed,
    Object? athChangePercentage = freezed,
    Object? athDate = freezed,
    Object? atl = freezed,
    Object? atlChangePercentage = freezed,
    Object? atlDate = freezed,
    Object? roi = freezed,
    Object? lastUpdated = freezed,
    Object? sparklineIn7d = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      symbol: freezed == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      currentPrice: freezed == currentPrice
          ? _value.currentPrice
          : currentPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      marketCap: freezed == marketCap
          ? _value.marketCap
          : marketCap // ignore: cast_nullable_to_non_nullable
              as int?,
      marketCapRank: freezed == marketCapRank
          ? _value.marketCapRank
          : marketCapRank // ignore: cast_nullable_to_non_nullable
              as int?,
      fullyDilutedValuation: freezed == fullyDilutedValuation
          ? _value.fullyDilutedValuation
          : fullyDilutedValuation // ignore: cast_nullable_to_non_nullable
              as int?,
      totalVolume: freezed == totalVolume
          ? _value.totalVolume
          : totalVolume // ignore: cast_nullable_to_non_nullable
              as int?,
      high24h: freezed == high24h
          ? _value.high24h
          : high24h // ignore: cast_nullable_to_non_nullable
              as double?,
      low24h: freezed == low24h
          ? _value.low24h
          : low24h // ignore: cast_nullable_to_non_nullable
              as double?,
      priceChange24h: freezed == priceChange24h
          ? _value.priceChange24h
          : priceChange24h // ignore: cast_nullable_to_non_nullable
              as double?,
      priceChangePercentage24h: freezed == priceChangePercentage24h
          ? _value.priceChangePercentage24h
          : priceChangePercentage24h // ignore: cast_nullable_to_non_nullable
              as double?,
      marketCapChange24h: freezed == marketCapChange24h
          ? _value.marketCapChange24h
          : marketCapChange24h // ignore: cast_nullable_to_non_nullable
              as double?,
      marketCapChangePercentage24h: freezed == marketCapChangePercentage24h
          ? _value.marketCapChangePercentage24h
          : marketCapChangePercentage24h // ignore: cast_nullable_to_non_nullable
              as double?,
      circulatingSupply: freezed == circulatingSupply
          ? _value.circulatingSupply
          : circulatingSupply // ignore: cast_nullable_to_non_nullable
              as double?,
      totalSupply: freezed == totalSupply
          ? _value.totalSupply
          : totalSupply // ignore: cast_nullable_to_non_nullable
              as double?,
      maxSupply: freezed == maxSupply
          ? _value.maxSupply
          : maxSupply // ignore: cast_nullable_to_non_nullable
              as double?,
      ath: freezed == ath
          ? _value.ath
          : ath // ignore: cast_nullable_to_non_nullable
              as double?,
      athChangePercentage: freezed == athChangePercentage
          ? _value.athChangePercentage
          : athChangePercentage // ignore: cast_nullable_to_non_nullable
              as double?,
      athDate: freezed == athDate
          ? _value.athDate
          : athDate // ignore: cast_nullable_to_non_nullable
              as String?,
      atl: freezed == atl
          ? _value.atl
          : atl // ignore: cast_nullable_to_non_nullable
              as double?,
      atlChangePercentage: freezed == atlChangePercentage
          ? _value.atlChangePercentage
          : atlChangePercentage // ignore: cast_nullable_to_non_nullable
              as double?,
      atlDate: freezed == atlDate
          ? _value.atlDate
          : atlDate // ignore: cast_nullable_to_non_nullable
              as String?,
      roi: freezed == roi
          ? _value.roi
          : roi // ignore: cast_nullable_to_non_nullable
              as RoiModel?,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as String?,
      sparklineIn7d: freezed == sparklineIn7d
          ? _value.sparklineIn7d
          : sparklineIn7d // ignore: cast_nullable_to_non_nullable
              as SparklineIn7dModel?,
    ) as $Val);
  }

  /// Create a copy of CoinMarket
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RoiModelCopyWith<$Res>? get roi {
    if (_value.roi == null) {
      return null;
    }

    return $RoiModelCopyWith<$Res>(_value.roi!, (value) {
      return _then(_value.copyWith(roi: value) as $Val);
    });
  }

  /// Create a copy of CoinMarket
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SparklineIn7dModelCopyWith<$Res>? get sparklineIn7d {
    if (_value.sparklineIn7d == null) {
      return null;
    }

    return $SparklineIn7dModelCopyWith<$Res>(_value.sparklineIn7d!, (value) {
      return _then(_value.copyWith(sparklineIn7d: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CoinMarketImplCopyWith<$Res>
    implements $CoinMarketCopyWith<$Res> {
  factory _$$CoinMarketImplCopyWith(
          _$CoinMarketImpl value, $Res Function(_$CoinMarketImpl) then) =
      __$$CoinMarketImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? symbol,
      String? name,
      String? image,
      String? description,
      @JsonKey(name: 'current_price') double? currentPrice,
      @JsonKey(name: 'market_cap') int? marketCap,
      @JsonKey(name: 'market_cap_rank') int? marketCapRank,
      @JsonKey(name: 'fully_diluted_valuation') int? fullyDilutedValuation,
      @JsonKey(name: 'total_volume') int? totalVolume,
      @JsonKey(name: 'high_24h') double? high24h,
      @JsonKey(name: 'low_24h') double? low24h,
      @JsonKey(name: 'price_change_24h') double? priceChange24h,
      @JsonKey(name: 'price_change_percentage_24h')
      double? priceChangePercentage24h,
      @JsonKey(name: 'market_cap_change_24h') double? marketCapChange24h,
      @JsonKey(name: 'market_cap_change_percentage_24h')
      double? marketCapChangePercentage24h,
      @JsonKey(name: 'circulating_supply') double? circulatingSupply,
      @JsonKey(name: 'total_supply') double? totalSupply,
      @JsonKey(name: 'max_supply') double? maxSupply,
      double? ath,
      @JsonKey(name: 'ath_change_percentage') double? athChangePercentage,
      @JsonKey(name: 'ath_date') String? athDate,
      double? atl,
      @JsonKey(name: 'atl_change_percentage') double? atlChangePercentage,
      @JsonKey(name: 'atl_date') String? atlDate,
      RoiModel? roi,
      @JsonKey(name: 'last_updated') String? lastUpdated,
      @JsonKey(name: 'sparkline_in_7d') SparklineIn7dModel? sparklineIn7d});

  @override
  $RoiModelCopyWith<$Res>? get roi;
  @override
  $SparklineIn7dModelCopyWith<$Res>? get sparklineIn7d;
}

/// @nodoc
class __$$CoinMarketImplCopyWithImpl<$Res>
    extends _$CoinMarketCopyWithImpl<$Res, _$CoinMarketImpl>
    implements _$$CoinMarketImplCopyWith<$Res> {
  __$$CoinMarketImplCopyWithImpl(
      _$CoinMarketImpl _value, $Res Function(_$CoinMarketImpl) _then)
      : super(_value, _then);

  /// Create a copy of CoinMarket
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? symbol = freezed,
    Object? name = freezed,
    Object? image = freezed,
    Object? description = freezed,
    Object? currentPrice = freezed,
    Object? marketCap = freezed,
    Object? marketCapRank = freezed,
    Object? fullyDilutedValuation = freezed,
    Object? totalVolume = freezed,
    Object? high24h = freezed,
    Object? low24h = freezed,
    Object? priceChange24h = freezed,
    Object? priceChangePercentage24h = freezed,
    Object? marketCapChange24h = freezed,
    Object? marketCapChangePercentage24h = freezed,
    Object? circulatingSupply = freezed,
    Object? totalSupply = freezed,
    Object? maxSupply = freezed,
    Object? ath = freezed,
    Object? athChangePercentage = freezed,
    Object? athDate = freezed,
    Object? atl = freezed,
    Object? atlChangePercentage = freezed,
    Object? atlDate = freezed,
    Object? roi = freezed,
    Object? lastUpdated = freezed,
    Object? sparklineIn7d = freezed,
  }) {
    return _then(_$CoinMarketImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      symbol: freezed == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      currentPrice: freezed == currentPrice
          ? _value.currentPrice
          : currentPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      marketCap: freezed == marketCap
          ? _value.marketCap
          : marketCap // ignore: cast_nullable_to_non_nullable
              as int?,
      marketCapRank: freezed == marketCapRank
          ? _value.marketCapRank
          : marketCapRank // ignore: cast_nullable_to_non_nullable
              as int?,
      fullyDilutedValuation: freezed == fullyDilutedValuation
          ? _value.fullyDilutedValuation
          : fullyDilutedValuation // ignore: cast_nullable_to_non_nullable
              as int?,
      totalVolume: freezed == totalVolume
          ? _value.totalVolume
          : totalVolume // ignore: cast_nullable_to_non_nullable
              as int?,
      high24h: freezed == high24h
          ? _value.high24h
          : high24h // ignore: cast_nullable_to_non_nullable
              as double?,
      low24h: freezed == low24h
          ? _value.low24h
          : low24h // ignore: cast_nullable_to_non_nullable
              as double?,
      priceChange24h: freezed == priceChange24h
          ? _value.priceChange24h
          : priceChange24h // ignore: cast_nullable_to_non_nullable
              as double?,
      priceChangePercentage24h: freezed == priceChangePercentage24h
          ? _value.priceChangePercentage24h
          : priceChangePercentage24h // ignore: cast_nullable_to_non_nullable
              as double?,
      marketCapChange24h: freezed == marketCapChange24h
          ? _value.marketCapChange24h
          : marketCapChange24h // ignore: cast_nullable_to_non_nullable
              as double?,
      marketCapChangePercentage24h: freezed == marketCapChangePercentage24h
          ? _value.marketCapChangePercentage24h
          : marketCapChangePercentage24h // ignore: cast_nullable_to_non_nullable
              as double?,
      circulatingSupply: freezed == circulatingSupply
          ? _value.circulatingSupply
          : circulatingSupply // ignore: cast_nullable_to_non_nullable
              as double?,
      totalSupply: freezed == totalSupply
          ? _value.totalSupply
          : totalSupply // ignore: cast_nullable_to_non_nullable
              as double?,
      maxSupply: freezed == maxSupply
          ? _value.maxSupply
          : maxSupply // ignore: cast_nullable_to_non_nullable
              as double?,
      ath: freezed == ath
          ? _value.ath
          : ath // ignore: cast_nullable_to_non_nullable
              as double?,
      athChangePercentage: freezed == athChangePercentage
          ? _value.athChangePercentage
          : athChangePercentage // ignore: cast_nullable_to_non_nullable
              as double?,
      athDate: freezed == athDate
          ? _value.athDate
          : athDate // ignore: cast_nullable_to_non_nullable
              as String?,
      atl: freezed == atl
          ? _value.atl
          : atl // ignore: cast_nullable_to_non_nullable
              as double?,
      atlChangePercentage: freezed == atlChangePercentage
          ? _value.atlChangePercentage
          : atlChangePercentage // ignore: cast_nullable_to_non_nullable
              as double?,
      atlDate: freezed == atlDate
          ? _value.atlDate
          : atlDate // ignore: cast_nullable_to_non_nullable
              as String?,
      roi: freezed == roi
          ? _value.roi
          : roi // ignore: cast_nullable_to_non_nullable
              as RoiModel?,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as String?,
      sparklineIn7d: freezed == sparklineIn7d
          ? _value.sparklineIn7d
          : sparklineIn7d // ignore: cast_nullable_to_non_nullable
              as SparklineIn7dModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CoinMarketImpl implements _CoinMarket {
  _$CoinMarketImpl(
      {this.id,
      this.symbol,
      this.name,
      this.image,
      this.description,
      @JsonKey(name: 'current_price') this.currentPrice,
      @JsonKey(name: 'market_cap') this.marketCap,
      @JsonKey(name: 'market_cap_rank') this.marketCapRank,
      @JsonKey(name: 'fully_diluted_valuation') this.fullyDilutedValuation,
      @JsonKey(name: 'total_volume') this.totalVolume,
      @JsonKey(name: 'high_24h') this.high24h,
      @JsonKey(name: 'low_24h') this.low24h,
      @JsonKey(name: 'price_change_24h') this.priceChange24h,
      @JsonKey(name: 'price_change_percentage_24h')
      this.priceChangePercentage24h,
      @JsonKey(name: 'market_cap_change_24h') this.marketCapChange24h,
      @JsonKey(name: 'market_cap_change_percentage_24h')
      this.marketCapChangePercentage24h,
      @JsonKey(name: 'circulating_supply') this.circulatingSupply,
      @JsonKey(name: 'total_supply') this.totalSupply,
      @JsonKey(name: 'max_supply') this.maxSupply,
      this.ath,
      @JsonKey(name: 'ath_change_percentage') this.athChangePercentage,
      @JsonKey(name: 'ath_date') this.athDate,
      this.atl,
      @JsonKey(name: 'atl_change_percentage') this.atlChangePercentage,
      @JsonKey(name: 'atl_date') this.atlDate,
      this.roi,
      @JsonKey(name: 'last_updated') this.lastUpdated,
      @JsonKey(name: 'sparkline_in_7d') this.sparklineIn7d});

  factory _$CoinMarketImpl.fromJson(Map<String, dynamic> json) =>
      _$$CoinMarketImplFromJson(json);

  @override
  final String? id;
  @override
  final String? symbol;
  @override
  final String? name;
  @override
  final String? image;
  @override
  final String? description;
  @override
  @JsonKey(name: 'current_price')
  final double? currentPrice;
// Nullable
  @override
  @JsonKey(name: 'market_cap')
  final int? marketCap;
// Nullable
  @override
  @JsonKey(name: 'market_cap_rank')
  final int? marketCapRank;
// Nullable
  @override
  @JsonKey(name: 'fully_diluted_valuation')
  final int? fullyDilutedValuation;
// Nullable
  @override
  @JsonKey(name: 'total_volume')
  final int? totalVolume;
// Nullable
  @override
  @JsonKey(name: 'high_24h')
  final double? high24h;
// Nullable
  @override
  @JsonKey(name: 'low_24h')
  final double? low24h;
// Nullable
  @override
  @JsonKey(name: 'price_change_24h')
  final double? priceChange24h;
// Nullable
  @override
  @JsonKey(name: 'price_change_percentage_24h')
  final double? priceChangePercentage24h;
// Nullable
  @override
  @JsonKey(name: 'market_cap_change_24h')
  final double? marketCapChange24h;
// Nullable
  @override
  @JsonKey(name: 'market_cap_change_percentage_24h')
  final double? marketCapChangePercentage24h;
// Nullable
  @override
  @JsonKey(name: 'circulating_supply')
  final double? circulatingSupply;
// Nullable
  @override
  @JsonKey(name: 'total_supply')
  final double? totalSupply;
// Nullable
  @override
  @JsonKey(name: 'max_supply')
  final double? maxSupply;
// Nullable
  @override
  final double? ath;
// Nullable
  @override
  @JsonKey(name: 'ath_change_percentage')
  final double? athChangePercentage;
// Nullable
  @override
  @JsonKey(name: 'ath_date')
  final String? athDate;
// Nullable
  @override
  final double? atl;
// Nullable
  @override
  @JsonKey(name: 'atl_change_percentage')
  final double? atlChangePercentage;
// Nullable
  @override
  @JsonKey(name: 'atl_date')
  final String? atlDate;
// Nullable
  @override
  final RoiModel? roi;
// Nullable
  @override
  @JsonKey(name: 'last_updated')
  final String? lastUpdated;
// Nullable
  @override
  @JsonKey(name: 'sparkline_in_7d')
  final SparklineIn7dModel? sparklineIn7d;

  @override
  String toString() {
    return 'CoinMarket(id: $id, symbol: $symbol, name: $name, image: $image, description: $description, currentPrice: $currentPrice, marketCap: $marketCap, marketCapRank: $marketCapRank, fullyDilutedValuation: $fullyDilutedValuation, totalVolume: $totalVolume, high24h: $high24h, low24h: $low24h, priceChange24h: $priceChange24h, priceChangePercentage24h: $priceChangePercentage24h, marketCapChange24h: $marketCapChange24h, marketCapChangePercentage24h: $marketCapChangePercentage24h, circulatingSupply: $circulatingSupply, totalSupply: $totalSupply, maxSupply: $maxSupply, ath: $ath, athChangePercentage: $athChangePercentage, athDate: $athDate, atl: $atl, atlChangePercentage: $atlChangePercentage, atlDate: $atlDate, roi: $roi, lastUpdated: $lastUpdated, sparklineIn7d: $sparklineIn7d)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoinMarketImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.currentPrice, currentPrice) ||
                other.currentPrice == currentPrice) &&
            (identical(other.marketCap, marketCap) ||
                other.marketCap == marketCap) &&
            (identical(other.marketCapRank, marketCapRank) ||
                other.marketCapRank == marketCapRank) &&
            (identical(other.fullyDilutedValuation, fullyDilutedValuation) ||
                other.fullyDilutedValuation == fullyDilutedValuation) &&
            (identical(other.totalVolume, totalVolume) ||
                other.totalVolume == totalVolume) &&
            (identical(other.high24h, high24h) || other.high24h == high24h) &&
            (identical(other.low24h, low24h) || other.low24h == low24h) &&
            (identical(other.priceChange24h, priceChange24h) ||
                other.priceChange24h == priceChange24h) &&
            (identical(
                    other.priceChangePercentage24h, priceChangePercentage24h) ||
                other.priceChangePercentage24h == priceChangePercentage24h) &&
            (identical(other.marketCapChange24h, marketCapChange24h) ||
                other.marketCapChange24h == marketCapChange24h) &&
            (identical(other.marketCapChangePercentage24h,
                    marketCapChangePercentage24h) ||
                other.marketCapChangePercentage24h ==
                    marketCapChangePercentage24h) &&
            (identical(other.circulatingSupply, circulatingSupply) ||
                other.circulatingSupply == circulatingSupply) &&
            (identical(other.totalSupply, totalSupply) ||
                other.totalSupply == totalSupply) &&
            (identical(other.maxSupply, maxSupply) ||
                other.maxSupply == maxSupply) &&
            (identical(other.ath, ath) || other.ath == ath) &&
            (identical(other.athChangePercentage, athChangePercentage) ||
                other.athChangePercentage == athChangePercentage) &&
            (identical(other.athDate, athDate) || other.athDate == athDate) &&
            (identical(other.atl, atl) || other.atl == atl) &&
            (identical(other.atlChangePercentage, atlChangePercentage) ||
                other.atlChangePercentage == atlChangePercentage) &&
            (identical(other.atlDate, atlDate) || other.atlDate == atlDate) &&
            (identical(other.roi, roi) || other.roi == roi) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated) &&
            (identical(other.sparklineIn7d, sparklineIn7d) ||
                other.sparklineIn7d == sparklineIn7d));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        symbol,
        name,
        image,
        description,
        currentPrice,
        marketCap,
        marketCapRank,
        fullyDilutedValuation,
        totalVolume,
        high24h,
        low24h,
        priceChange24h,
        priceChangePercentage24h,
        marketCapChange24h,
        marketCapChangePercentage24h,
        circulatingSupply,
        totalSupply,
        maxSupply,
        ath,
        athChangePercentage,
        athDate,
        atl,
        atlChangePercentage,
        atlDate,
        roi,
        lastUpdated,
        sparklineIn7d
      ]);

  /// Create a copy of CoinMarket
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CoinMarketImplCopyWith<_$CoinMarketImpl> get copyWith =>
      __$$CoinMarketImplCopyWithImpl<_$CoinMarketImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CoinMarketImplToJson(
      this,
    );
  }
}

abstract class _CoinMarket implements CoinMarket {
  factory _CoinMarket(
      {final String? id,
      final String? symbol,
      final String? name,
      final String? image,
      final String? description,
      @JsonKey(name: 'current_price') final double? currentPrice,
      @JsonKey(name: 'market_cap') final int? marketCap,
      @JsonKey(name: 'market_cap_rank') final int? marketCapRank,
      @JsonKey(name: 'fully_diluted_valuation')
      final int? fullyDilutedValuation,
      @JsonKey(name: 'total_volume') final int? totalVolume,
      @JsonKey(name: 'high_24h') final double? high24h,
      @JsonKey(name: 'low_24h') final double? low24h,
      @JsonKey(name: 'price_change_24h') final double? priceChange24h,
      @JsonKey(name: 'price_change_percentage_24h')
      final double? priceChangePercentage24h,
      @JsonKey(name: 'market_cap_change_24h') final double? marketCapChange24h,
      @JsonKey(name: 'market_cap_change_percentage_24h')
      final double? marketCapChangePercentage24h,
      @JsonKey(name: 'circulating_supply') final double? circulatingSupply,
      @JsonKey(name: 'total_supply') final double? totalSupply,
      @JsonKey(name: 'max_supply') final double? maxSupply,
      final double? ath,
      @JsonKey(name: 'ath_change_percentage') final double? athChangePercentage,
      @JsonKey(name: 'ath_date') final String? athDate,
      final double? atl,
      @JsonKey(name: 'atl_change_percentage') final double? atlChangePercentage,
      @JsonKey(name: 'atl_date') final String? atlDate,
      final RoiModel? roi,
      @JsonKey(name: 'last_updated') final String? lastUpdated,
      @JsonKey(name: 'sparkline_in_7d')
      final SparklineIn7dModel? sparklineIn7d}) = _$CoinMarketImpl;

  factory _CoinMarket.fromJson(Map<String, dynamic> json) =
      _$CoinMarketImpl.fromJson;

  @override
  String? get id;
  @override
  String? get symbol;
  @override
  String? get name;
  @override
  String? get image;
  @override
  String? get description;
  @override
  @JsonKey(name: 'current_price')
  double? get currentPrice; // Nullable
  @override
  @JsonKey(name: 'market_cap')
  int? get marketCap; // Nullable
  @override
  @JsonKey(name: 'market_cap_rank')
  int? get marketCapRank; // Nullable
  @override
  @JsonKey(name: 'fully_diluted_valuation')
  int? get fullyDilutedValuation; // Nullable
  @override
  @JsonKey(name: 'total_volume')
  int? get totalVolume; // Nullable
  @override
  @JsonKey(name: 'high_24h')
  double? get high24h; // Nullable
  @override
  @JsonKey(name: 'low_24h')
  double? get low24h; // Nullable
  @override
  @JsonKey(name: 'price_change_24h')
  double? get priceChange24h; // Nullable
  @override
  @JsonKey(name: 'price_change_percentage_24h')
  double? get priceChangePercentage24h; // Nullable
  @override
  @JsonKey(name: 'market_cap_change_24h')
  double? get marketCapChange24h; // Nullable
  @override
  @JsonKey(name: 'market_cap_change_percentage_24h')
  double? get marketCapChangePercentage24h; // Nullable
  @override
  @JsonKey(name: 'circulating_supply')
  double? get circulatingSupply; // Nullable
  @override
  @JsonKey(name: 'total_supply')
  double? get totalSupply; // Nullable
  @override
  @JsonKey(name: 'max_supply')
  double? get maxSupply; // Nullable
  @override
  double? get ath; // Nullable
  @override
  @JsonKey(name: 'ath_change_percentage')
  double? get athChangePercentage; // Nullable
  @override
  @JsonKey(name: 'ath_date')
  String? get athDate; // Nullable
  @override
  double? get atl; // Nullable
  @override
  @JsonKey(name: 'atl_change_percentage')
  double? get atlChangePercentage; // Nullable
  @override
  @JsonKey(name: 'atl_date')
  String? get atlDate; // Nullable
  @override
  RoiModel? get roi; // Nullable
  @override
  @JsonKey(name: 'last_updated')
  String? get lastUpdated; // Nullable
  @override
  @JsonKey(name: 'sparkline_in_7d')
  SparklineIn7dModel? get sparklineIn7d;

  /// Create a copy of CoinMarket
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CoinMarketImplCopyWith<_$CoinMarketImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
