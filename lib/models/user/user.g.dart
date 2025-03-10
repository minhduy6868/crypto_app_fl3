// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as String? ?? '',
      userId: json['user_id'] as String? ?? '',
      builderId: json['builder_id'] as String? ?? '',
      email: json['email'] as String? ?? '',
      role: json['role'] as String? ?? 'USER',
      activeStatus: json['active_status'] as String? ?? '',
      provider: json['provider'] as String? ?? '',
      reason: json['reason'] as String? ?? '',
      active: json['active'] as bool? ?? true,
      name: json['name'] as String? ?? '',
      nickname: json['nickname'] as String? ?? '',
      firstName: json['first_name'] as String? ?? '',
      lastName: json['last_name'] as String? ?? '',
      avatarUrl: json['avatar_url'] as String? ?? '',
      avatar: json['avatar'] as String? ?? '',
      birthday: json['birthday'] as String? ?? '',
      gender:
          $enumDecodeNullable(_$GenderEnumMap, json['gender']) ?? Gender.other,
      emailConfirmedAt: json['email_confirmed_at'] as String? ?? '',
      activatedAt: json['activated_at'] as String? ?? '',
      lockedAt: json['locked_at'] as String? ?? '',
      createdAt: json['created_at'] as String? ?? '',
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'builder_id': instance.builderId,
      'email': instance.email,
      'role': instance.role,
      'active_status': instance.activeStatus,
      'provider': instance.provider,
      'reason': instance.reason,
      'active': instance.active,
      'name': instance.name,
      'nickname': instance.nickname,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'avatar_url': instance.avatarUrl,
      'avatar': instance.avatar,
      'birthday': instance.birthday,
      'gender': _$GenderEnumMap[instance.gender]!,
      'email_confirmed_at': instance.emailConfirmedAt,
      'activated_at': instance.activatedAt,
      'locked_at': instance.lockedAt,
      'created_at': instance.createdAt,
    };

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
  Gender.other: 'other',
};
