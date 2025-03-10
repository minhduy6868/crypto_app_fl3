import 'package:freezed_annotation/freezed_annotation.dart';

part 'chart.freezed.dart';
part 'chart.g.dart';

@freezed
class Chart with _$Chart {
  factory Chart({
    int? time,
    double? open,
    double? high,
    double? low,
    double? close,
  }) = _Chart;

  factory Chart.fromJson(Map<String, dynamic> json) => _$ChartFromJson(json);
}
