import 'package:freezed_annotation/freezed_annotation.dart';

part 'roi_model.freezed.dart';
part 'roi_model.g.dart';

@freezed
class RoiModel with _$RoiModel {
  factory RoiModel({
    required double times,
    required String currency,
    required double percentage,
  }) = _RoiModel;

  factory RoiModel.fromJson(Map<String, dynamic> json) =>
      _$RoiModelFromJson(json);
}
