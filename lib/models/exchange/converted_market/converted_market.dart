import 'package:freezed_annotation/freezed_annotation.dart';

part 'converted_market.freezed.dart';
part 'converted_market.g.dart';

@freezed
class ConvertedMarket with _$ConvertedMarket {
  factory ConvertedMarket({
    double? btc,
    double? eth,
    double? usd,
  }) = _ConvertedMarket;

  factory ConvertedMarket.fromJson(Map<String, dynamic> json) =>
      _$ConvertedMarketFromJson(json);
}
