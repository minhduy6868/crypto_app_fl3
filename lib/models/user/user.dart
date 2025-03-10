// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:crypto_app/shared_customization/enums/gender.dart';

part 'user.g.dart';
part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    @Default('') String id,
    @JsonKey(name: 'user_id') @Default('') String userId,
    @JsonKey(name: 'builder_id') @Default('') String builderId,
    @Default('') String email,
    @Default('USER') String role,
    @JsonKey(name: 'active_status') @Default('') String activeStatus,
    @Default('') String provider,
    @Default('') String reason,
    @Default(true) bool active,
    @Default('') String name,
    @Default('') String nickname,
    @JsonKey(name: 'first_name') @Default('') String firstName,
    @JsonKey(name: 'last_name') @Default('') String lastName,
    @JsonKey(name: 'avatar_url') @Default('') String avatarUrl,
    @Default('') String avatar,
    @Default('') String birthday,
    @Default(Gender.other) Gender gender,
    @JsonKey(name: 'email_confirmed_at') @Default('') String emailConfirmedAt,
    @JsonKey(name: 'activated_at') @Default('') String activatedAt,
    @JsonKey(name: 'locked_at') @Default('') String lockedAt,
    @JsonKey(name: 'created_at') @Default('') String createdAt,
  }) = _User;

  static User get empty => const User();

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
