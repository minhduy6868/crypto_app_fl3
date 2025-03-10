import 'package:freezed_annotation/freezed_annotation.dart';

import '../roi_model/roi_model.dart';
import '../sparkline_in_7d_model/sparkline_in_7d_model.dart';

part 'coin_market.freezed.dart';
part 'coin_market.g.dart';

@freezed
class CoinMarket with _$CoinMarket {
  factory CoinMarket({
     String? id,
     String? symbol,
     String? name,
     String? image,
    String? description,
    @JsonKey(name: 'current_price')  double? currentPrice, // Nullable
    @JsonKey(name: 'market_cap')  int? marketCap, // Nullable
    @JsonKey(name: 'market_cap_rank')  int? marketCapRank, // Nullable
    @JsonKey(name: 'fully_diluted_valuation')  int? fullyDilutedValuation, // Nullable
    @JsonKey(name: 'total_volume')  int? totalVolume, // Nullable
    @JsonKey(name: 'high_24h')  double? high24h, // Nullable
    @JsonKey(name: 'low_24h')  double? low24h, // Nullable
    @JsonKey(name: 'price_change_24h')  double? priceChange24h, // Nullable
    @JsonKey(name: 'price_change_percentage_24h')  double? priceChangePercentage24h, // Nullable
    @JsonKey(name: 'market_cap_change_24h')  double? marketCapChange24h, // Nullable
    @JsonKey(name: 'market_cap_change_percentage_24h')  double? marketCapChangePercentage24h, // Nullable
    @JsonKey(name: 'circulating_supply')  double? circulatingSupply, // Nullable
    @JsonKey(name: 'total_supply')  double? totalSupply, // Nullable
    @JsonKey(name: 'max_supply') double? maxSupply, // Nullable
     double? ath, // Nullable
    @JsonKey(name: 'ath_change_percentage')  double? athChangePercentage, // Nullable
    @JsonKey(name: 'ath_date')  String? athDate, // Nullable
     double? atl, // Nullable
    @JsonKey(name: 'atl_change_percentage')  double? atlChangePercentage, // Nullable
    @JsonKey(name: 'atl_date')  String? atlDate, // Nullable
     RoiModel? roi, // Nullable
    @JsonKey(name: 'last_updated')  String? lastUpdated, // Nullable
    @JsonKey(name: 'sparkline_in_7d')  SparklineIn7dModel? sparklineIn7d, // Nullable
  }) = _CoinMarket;

  factory CoinMarket.fromJson(Map<String, dynamic> json) =>
      _$CoinMarketFromJson(json);
}
