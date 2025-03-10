// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'builder_id')
  String get builderId => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  @JsonKey(name: 'active_status')
  String get activeStatus => throw _privateConstructorUsedError;
  String get provider => throw _privateConstructorUsedError;
  String get reason => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_url')
  String get avatarUrl => throw _privateConstructorUsedError;
  String get avatar => throw _privateConstructorUsedError;
  String get birthday => throw _privateConstructorUsedError;
  Gender get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'email_confirmed_at')
  String get emailConfirmedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'activated_at')
  String get activatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'locked_at')
  String get lockedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'builder_id') String builderId,
      String email,
      String role,
      @JsonKey(name: 'active_status') String activeStatus,
      String provider,
      String reason,
      bool active,
      String name,
      String nickname,
      @JsonKey(name: 'first_name') String firstName,
      @JsonKey(name: 'last_name') String lastName,
      @JsonKey(name: 'avatar_url') String avatarUrl,
      String avatar,
      String birthday,
      Gender gender,
      @JsonKey(name: 'email_confirmed_at') String emailConfirmedAt,
      @JsonKey(name: 'activated_at') String activatedAt,
      @JsonKey(name: 'locked_at') String lockedAt,
      @JsonKey(name: 'created_at') String createdAt});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? builderId = null,
    Object? email = null,
    Object? role = null,
    Object? activeStatus = null,
    Object? provider = null,
    Object? reason = null,
    Object? active = null,
    Object? name = null,
    Object? nickname = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? avatarUrl = null,
    Object? avatar = null,
    Object? birthday = null,
    Object? gender = null,
    Object? emailConfirmedAt = null,
    Object? activatedAt = null,
    Object? lockedAt = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      builderId: null == builderId
          ? _value.builderId
          : builderId // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      activeStatus: null == activeStatus
          ? _value.activeStatus
          : activeStatus // ignore: cast_nullable_to_non_nullable
              as String,
      provider: null == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: null == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      birthday: null == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender,
      emailConfirmedAt: null == emailConfirmedAt
          ? _value.emailConfirmedAt
          : emailConfirmedAt // ignore: cast_nullable_to_non_nullable
              as String,
      activatedAt: null == activatedAt
          ? _value.activatedAt
          : activatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      lockedAt: null == lockedAt
          ? _value.lockedAt
          : lockedAt // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'builder_id') String builderId,
      String email,
      String role,
      @JsonKey(name: 'active_status') String activeStatus,
      String provider,
      String reason,
      bool active,
      String name,
      String nickname,
      @JsonKey(name: 'first_name') String firstName,
      @JsonKey(name: 'last_name') String lastName,
      @JsonKey(name: 'avatar_url') String avatarUrl,
      String avatar,
      String birthday,
      Gender gender,
      @JsonKey(name: 'email_confirmed_at') String emailConfirmedAt,
      @JsonKey(name: 'activated_at') String activatedAt,
      @JsonKey(name: 'locked_at') String lockedAt,
      @JsonKey(name: 'created_at') String createdAt});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? builderId = null,
    Object? email = null,
    Object? role = null,
    Object? activeStatus = null,
    Object? provider = null,
    Object? reason = null,
    Object? active = null,
    Object? name = null,
    Object? nickname = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? avatarUrl = null,
    Object? avatar = null,
    Object? birthday = null,
    Object? gender = null,
    Object? emailConfirmedAt = null,
    Object? activatedAt = null,
    Object? lockedAt = null,
    Object? createdAt = null,
  }) {
    return _then(_$UserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      builderId: null == builderId
          ? _value.builderId
          : builderId // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      activeStatus: null == activeStatus
          ? _value.activeStatus
          : activeStatus // ignore: cast_nullable_to_non_nullable
              as String,
      provider: null == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: null == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      birthday: null == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender,
      emailConfirmedAt: null == emailConfirmedAt
          ? _value.emailConfirmedAt
          : emailConfirmedAt // ignore: cast_nullable_to_non_nullable
              as String,
      activatedAt: null == activatedAt
          ? _value.activatedAt
          : activatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      lockedAt: null == lockedAt
          ? _value.lockedAt
          : lockedAt // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl(
      {this.id = '',
      @JsonKey(name: 'user_id') this.userId = '',
      @JsonKey(name: 'builder_id') this.builderId = '',
      this.email = '',
      this.role = 'USER',
      @JsonKey(name: 'active_status') this.activeStatus = '',
      this.provider = '',
      this.reason = '',
      this.active = true,
      this.name = '',
      this.nickname = '',
      @JsonKey(name: 'first_name') this.firstName = '',
      @JsonKey(name: 'last_name') this.lastName = '',
      @JsonKey(name: 'avatar_url') this.avatarUrl = '',
      this.avatar = '',
      this.birthday = '',
      this.gender = Gender.other,
      @JsonKey(name: 'email_confirmed_at') this.emailConfirmedAt = '',
      @JsonKey(name: 'activated_at') this.activatedAt = '',
      @JsonKey(name: 'locked_at') this.lockedAt = '',
      @JsonKey(name: 'created_at') this.createdAt = ''});

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(name: 'builder_id')
  final String builderId;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String role;
  @override
  @JsonKey(name: 'active_status')
  final String activeStatus;
  @override
  @JsonKey()
  final String provider;
  @override
  @JsonKey()
  final String reason;
  @override
  @JsonKey()
  final bool active;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String nickname;
  @override
  @JsonKey(name: 'first_name')
  final String firstName;
  @override
  @JsonKey(name: 'last_name')
  final String lastName;
  @override
  @JsonKey(name: 'avatar_url')
  final String avatarUrl;
  @override
  @JsonKey()
  final String avatar;
  @override
  @JsonKey()
  final String birthday;
  @override
  @JsonKey()
  final Gender gender;
  @override
  @JsonKey(name: 'email_confirmed_at')
  final String emailConfirmedAt;
  @override
  @JsonKey(name: 'activated_at')
  final String activatedAt;
  @override
  @JsonKey(name: 'locked_at')
  final String lockedAt;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;

  @override
  String toString() {
    return 'User(id: $id, userId: $userId, builderId: $builderId, email: $email, role: $role, activeStatus: $activeStatus, provider: $provider, reason: $reason, active: $active, name: $name, nickname: $nickname, firstName: $firstName, lastName: $lastName, avatarUrl: $avatarUrl, avatar: $avatar, birthday: $birthday, gender: $gender, emailConfirmedAt: $emailConfirmedAt, activatedAt: $activatedAt, lockedAt: $lockedAt, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.builderId, builderId) ||
                other.builderId == builderId) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.activeStatus, activeStatus) ||
                other.activeStatus == activeStatus) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.birthday, birthday) ||
                other.birthday == birthday) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.emailConfirmedAt, emailConfirmedAt) ||
                other.emailConfirmedAt == emailConfirmedAt) &&
            (identical(other.activatedAt, activatedAt) ||
                other.activatedAt == activatedAt) &&
            (identical(other.lockedAt, lockedAt) ||
                other.lockedAt == lockedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        userId,
        builderId,
        email,
        role,
        activeStatus,
        provider,
        reason,
        active,
        name,
        nickname,
        firstName,
        lastName,
        avatarUrl,
        avatar,
        birthday,
        gender,
        emailConfirmedAt,
        activatedAt,
        lockedAt,
        createdAt
      ]);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {final String id,
      @JsonKey(name: 'user_id') final String userId,
      @JsonKey(name: 'builder_id') final String builderId,
      final String email,
      final String role,
      @JsonKey(name: 'active_status') final String activeStatus,
      final String provider,
      final String reason,
      final bool active,
      final String name,
      final String nickname,
      @JsonKey(name: 'first_name') final String firstName,
      @JsonKey(name: 'last_name') final String lastName,
      @JsonKey(name: 'avatar_url') final String avatarUrl,
      final String avatar,
      final String birthday,
      final Gender gender,
      @JsonKey(name: 'email_confirmed_at') final String emailConfirmedAt,
      @JsonKey(name: 'activated_at') final String activatedAt,
      @JsonKey(name: 'locked_at') final String lockedAt,
      @JsonKey(name: 'created_at') final String createdAt}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  @JsonKey(name: 'builder_id')
  String get builderId;
  @override
  String get email;
  @override
  String get role;
  @override
  @JsonKey(name: 'active_status')
  String get activeStatus;
  @override
  String get provider;
  @override
  String get reason;
  @override
  bool get active;
  @override
  String get name;
  @override
  String get nickname;
  @override
  @JsonKey(name: 'first_name')
  String get firstName;
  @override
  @JsonKey(name: 'last_name')
  String get lastName;
  @override
  @JsonKey(name: 'avatar_url')
  String get avatarUrl;
  @override
  String get avatar;
  @override
  String get birthday;
  @override
  Gender get gender;
  @override
  @JsonKey(name: 'email_confirmed_at')
  String get emailConfirmedAt;
  @override
  @JsonKey(name: 'activated_at')
  String get activatedAt;
  @override
  @JsonKey(name: 'locked_at')
  String get lockedAt;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
