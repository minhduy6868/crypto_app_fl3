import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:easy_localization/easy_localization.dart';

import '/shared_customization/extensions/string_ext.dart';

class CustomSharedPreferences {
  late SharedPreferences prefs;

  // Thêm key cho ngôn ngữ
  static const String _languageKey = 'selected_language';

  // Getter và setter cho private key của ví
  String? get walletPrivateKey => prefs.getString('wallet_private_key');

  set walletPrivateKey(String? value) =>
      prefs.setString('wallet_private_key', value ?? '');

  // Getter và setter cho public key của ví
  String? get walletPublicKey => prefs.getString('wallet_public_key');

  set walletPublicKey(String? value) =>
      prefs.setString('wallet_public_key', value ?? '');

  // Getters for tokens
  String? get accessToken => prefs.getString('access_token');
  String? get refreshToken => prefs.getString('refresh_token');

  // Getters and setters for login flags
  bool get loggedBefore => prefs.getBool('logged_before') ?? false;
  set loggedBefore(bool value) => prefs.setBool('logged_before', value);

  bool get keepLogin => prefs.getBool('keep_login') ?? false;

  // Getters and setters for user information
  String? get email => prefs.getString('email');
  set email(String? value) => prefs.setString('email', value ?? '');

  String? get firstName => prefs.getString('first_name');
  set firstName(String? value) => prefs.setString('first_name', value ?? '');

  String? get lastName => prefs.getString('last_name');
  set lastName(String? value) => prefs.setString('last_name', value ?? '');

  // Getter and setter for first-time launch check
  bool get isFirstLaunch => prefs.getBool('is_first_launch') ?? true;
  set isFirstLaunch(bool value) => prefs.setBool('is_first_launch', value);

  // Getter and setter cho ngôn ngữ
  String get currentLanguage => prefs.getString(_languageKey) ?? 'en';

  Future<void> setCurrentLanguage(String languageCode) async {
    await prefs.setString(_languageKey, languageCode);
    debugPrint("DEBUG: Language changed to: $languageCode");
  }

  // Initialize shared preferences
  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
    debugPrint("DEBUG: SharedPreferences initialized");
  }

  // Set tokens and debug print
  Future setToken(String accessToken, String refreshToken) async {
    await prefs.setString('access_token', accessToken);
    await prefs.setString('refresh_token', refreshToken);
    debugPrint("DEBUG: Tokens saved - Access: $accessToken, Refresh: $refreshToken");
  }

  // Save user details
  Future setUserInfo(String email, String firstName, String lastName) async {
    await prefs.setString('email', email);
    await prefs.setString('first_name', firstName);
    await prefs.setString('last_name', lastName);
    debugPrint("DEBUG: User info saved - Email: $email, FirstName: $firstName, LastName: $lastName");
  }

  // Check if tokens are empty
  bool isEmtpty() {
    return (prefs.getString('access_token').isEmptyOrNull ||
        prefs.getString('refresh_token').isEmptyOrNull);
  }

  // Clear all stored data (except language)
  Future clear() async {
    await prefs.remove('access_token');
    await prefs.remove('refresh_token');
    await prefs.remove('email');
    await prefs.remove('first_name');
    await prefs.remove('last_name');
    await prefs.remove('wallet_public_key');
    await prefs.remove('wallet_private_key');
    debugPrint("DEBUG: User data cleared (language preserved)");
  }

  // Clear all data, including language
  Future clearAll() async {
    await prefs.clear();
    debugPrint("DEBUG: All SharedPreferences data cleared, including language");
  }

  // Method to check stored user info
  Future<Map<String, String?>> getUserInfo() async {
    await init();
    final userInfo = {
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
    };
    debugPrint("DEBUG: Retrieved user info - $userInfo");
    return userInfo;
  }
}