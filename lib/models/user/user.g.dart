// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as String,
      email: json['email'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      profileImageUrl: json['profileImageUrl'] as String,
      walletPrivateKey: json['walletPrivateKey'] as String,
      walletPublicKey: json['walletPublicKey'] as String,
      role: json['role'] as String,
      listFavoriteCoins: (json['listFavoriteCoins'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      listFavoriteNews: (json['listFavoriteNews'] as List<dynamic>?)
              ?.map((e) => News.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'profileImageUrl': instance.profileImageUrl,
      'walletPrivateKey': instance.walletPrivateKey,
      'walletPublicKey': instance.walletPublicKey,
      'role': instance.role,
      'listFavoriteCoins': instance.listFavoriteCoins,
      'listFavoriteNews': instance.listFavoriteNews,
    };
