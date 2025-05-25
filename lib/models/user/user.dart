import 'package:crypto_app/models/news/news.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  factory User({
    required String id,
    required String email,
    required String firstName,
    required String lastName,
    required String profileImageUrl,
    required String walletPrivateKey,
    required String walletPublicKey,
    required String role,
    @Default([]) List<String> listFavoriteCoins,
    @Default([]) List<News> listFavoriteNews,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}