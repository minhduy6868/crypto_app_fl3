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
  String get email => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get profileImageUrl => throw _privateConstructorUsedError;
  String get walletPrivateKey => throw _privateConstructorUsedError;
  String get walletPublicKey => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  List<String> get listFavoriteCoins => throw _privateConstructorUsedError;
  List<News> get listFavoriteNews => throw _privateConstructorUsedError;

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
      String email,
      String firstName,
      String lastName,
      String profileImageUrl,
      String walletPrivateKey,
      String walletPublicKey,
      String role,
      List<String> listFavoriteCoins,
      List<News> listFavoriteNews});
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
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? profileImageUrl = null,
    Object? walletPrivateKey = null,
    Object? walletPublicKey = null,
    Object? role = null,
    Object? listFavoriteCoins = null,
    Object? listFavoriteNews = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      profileImageUrl: null == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      walletPrivateKey: null == walletPrivateKey
          ? _value.walletPrivateKey
          : walletPrivateKey // ignore: cast_nullable_to_non_nullable
              as String,
      walletPublicKey: null == walletPublicKey
          ? _value.walletPublicKey
          : walletPublicKey // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      listFavoriteCoins: null == listFavoriteCoins
          ? _value.listFavoriteCoins
          : listFavoriteCoins // ignore: cast_nullable_to_non_nullable
              as List<String>,
      listFavoriteNews: null == listFavoriteNews
          ? _value.listFavoriteNews
          : listFavoriteNews // ignore: cast_nullable_to_non_nullable
              as List<News>,
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
      String email,
      String firstName,
      String lastName,
      String profileImageUrl,
      String walletPrivateKey,
      String walletPublicKey,
      String role,
      List<String> listFavoriteCoins,
      List<News> listFavoriteNews});
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
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? profileImageUrl = null,
    Object? walletPrivateKey = null,
    Object? walletPublicKey = null,
    Object? role = null,
    Object? listFavoriteCoins = null,
    Object? listFavoriteNews = null,
  }) {
    return _then(_$UserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      profileImageUrl: null == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      walletPrivateKey: null == walletPrivateKey
          ? _value.walletPrivateKey
          : walletPrivateKey // ignore: cast_nullable_to_non_nullable
              as String,
      walletPublicKey: null == walletPublicKey
          ? _value.walletPublicKey
          : walletPublicKey // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      listFavoriteCoins: null == listFavoriteCoins
          ? _value._listFavoriteCoins
          : listFavoriteCoins // ignore: cast_nullable_to_non_nullable
              as List<String>,
      listFavoriteNews: null == listFavoriteNews
          ? _value._listFavoriteNews
          : listFavoriteNews // ignore: cast_nullable_to_non_nullable
              as List<News>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  _$UserImpl(
      {required this.id,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.profileImageUrl,
      required this.walletPrivateKey,
      required this.walletPublicKey,
      required this.role,
      final List<String> listFavoriteCoins = const [],
      final List<News> listFavoriteNews = const []})
      : _listFavoriteCoins = listFavoriteCoins,
        _listFavoriteNews = listFavoriteNews;

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  final String id;
  @override
  final String email;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String profileImageUrl;
  @override
  final String walletPrivateKey;
  @override
  final String walletPublicKey;
  @override
  final String role;
  final List<String> _listFavoriteCoins;
  @override
  @JsonKey()
  List<String> get listFavoriteCoins {
    if (_listFavoriteCoins is EqualUnmodifiableListView)
      return _listFavoriteCoins;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listFavoriteCoins);
  }

  final List<News> _listFavoriteNews;
  @override
  @JsonKey()
  List<News> get listFavoriteNews {
    if (_listFavoriteNews is EqualUnmodifiableListView)
      return _listFavoriteNews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listFavoriteNews);
  }

  @override
  String toString() {
    return 'User(id: $id, email: $email, firstName: $firstName, lastName: $lastName, profileImageUrl: $profileImageUrl, walletPrivateKey: $walletPrivateKey, walletPublicKey: $walletPublicKey, role: $role, listFavoriteCoins: $listFavoriteCoins, listFavoriteNews: $listFavoriteNews)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                other.profileImageUrl == profileImageUrl) &&
            (identical(other.walletPrivateKey, walletPrivateKey) ||
                other.walletPrivateKey == walletPrivateKey) &&
            (identical(other.walletPublicKey, walletPublicKey) ||
                other.walletPublicKey == walletPublicKey) &&
            (identical(other.role, role) || other.role == role) &&
            const DeepCollectionEquality()
                .equals(other._listFavoriteCoins, _listFavoriteCoins) &&
            const DeepCollectionEquality()
                .equals(other._listFavoriteNews, _listFavoriteNews));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      email,
      firstName,
      lastName,
      profileImageUrl,
      walletPrivateKey,
      walletPublicKey,
      role,
      const DeepCollectionEquality().hash(_listFavoriteCoins),
      const DeepCollectionEquality().hash(_listFavoriteNews));

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
  factory _User(
      {required final String id,
      required final String email,
      required final String firstName,
      required final String lastName,
      required final String profileImageUrl,
      required final String walletPrivateKey,
      required final String walletPublicKey,
      required final String role,
      final List<String> listFavoriteCoins,
      final List<News> listFavoriteNews}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  String get id;
  @override
  String get email;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get profileImageUrl;
  @override
  String get walletPrivateKey;
  @override
  String get walletPublicKey;
  @override
  String get role;
  @override
  List<String> get listFavoriteCoins;
  @override
  List<News> get listFavoriteNews;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
