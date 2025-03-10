// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part "user_model.freezed.dart";

part "user_model.g.dart";

@freezed
class UserModel with _$UserModel {
  @JsonSerializable(includeIfNull: false)
  const factory UserModel({
    @Default('') String id,
    @JsonKey(name: 'firstname') @Default('') String firstName,
    @JsonKey(name: 'lastname') @Default('') String lastName,
    @Default('') String phone,
    @Default('') String address,
    @JsonKey(name: 'date_of_birth') @Default(0) int dateOfBirth,
    @Default('') String gender,
    @Default('') String avatar,
    @JsonKey(name: 'user_id') @Default('') String userId,
    @Default('') String email,
    @Default('DRIVER') String role,
    @Default(true) bool accepted,
    @JsonKey(name: 'active_status') @Default('ACCEPT') String activeStatus,
    @Default(true) bool active,
    @Default(0) double rating,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
