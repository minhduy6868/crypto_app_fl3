// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['id'] as String? ?? '',
      firstName: json['firstname'] as String? ?? '',
      lastName: json['lastname'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      address: json['address'] as String? ?? '',
      dateOfBirth: (json['date_of_birth'] as num?)?.toInt() ?? 0,
      gender: json['gender'] as String? ?? '',
      avatar: json['avatar'] as String? ?? '',
      userId: json['user_id'] as String? ?? '',
      email: json['email'] as String? ?? '',
      role: json['role'] as String? ?? 'DRIVER',
      accepted: json['accepted'] as bool? ?? true,
      activeStatus: json['active_status'] as String? ?? 'ACCEPT',
      active: json['active'] as bool? ?? true,
      rating: (json['rating'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstname': instance.firstName,
      'lastname': instance.lastName,
      'phone': instance.phone,
      'address': instance.address,
      'date_of_birth': instance.dateOfBirth,
      'gender': instance.gender,
      'avatar': instance.avatar,
      'user_id': instance.userId,
      'email': instance.email,
      'role': instance.role,
      'accepted': instance.accepted,
      'active_status': instance.activeStatus,
      'active': instance.active,
      'rating': instance.rating,
    };
