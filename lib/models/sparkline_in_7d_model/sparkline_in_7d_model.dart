// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'sparkline_in_7d_model.freezed.dart';
part 'sparkline_in_7d_model.g.dart';

@freezed
class SparklineIn7dModel with _$SparklineIn7dModel {
  factory SparklineIn7dModel({
    required List<double> price,
  }) = _SparklineIn7dModel;

  factory SparklineIn7dModel.fromJson(Map<String, dynamic> json) =>
      _$SparklineIn7dModelFromJson(json);
}
