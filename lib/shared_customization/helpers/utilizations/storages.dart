import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/shared_customization/extensions/string_ext.dart';

class CustomSharedPreferences {
  late final SharedPreferences prefs;


  // Getter và setter cho private key của ví
  String? get walletPrivateKey => prefs.getString('wallet_private_key');

  set walletPrivateKey(String? value) =>
      prefs.setString('wallet_private_key', value ?? '');

  // Getter và setter cho private key của ví
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

  // Initialize shared preferences
  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  // Set tokens and debug print
  Future setToken(String accessToken, String refreshToken) async {
    await prefs.setString('access_token', accessToken);
    await prefs.setString('refresh_token', refreshToken);
    debugPrint(
        "DEBUG: ===> Check storages: $accessToken -------- $refreshToken");
  }

  // Save user details
  Future setUserInfo(String email, String firstName, String lastName) async {
    await prefs.setString('email', email);
    await prefs.setString('first_name', firstName);
    await prefs.setString('last_name', lastName);
    debugPrint(
        "DEBUG: ===> Saved user info: $email - $firstName $lastName");
  }

  // Check if tokens are empty
  bool isEmtpty() {
    return (prefs.getString('access_token').isEmptyOrNull ||
        prefs.getString('refresh_token').isEmptyOrNull);
  }

  // Clear all stored data
  Future clear() async {
    await prefs.remove('access_token');
    await prefs.remove('refresh_token');
    await prefs.remove('email');
    await prefs.remove('first_name');
    await prefs.remove('last_name');
    await prefs.remove('wallet_private_key');
  }
}
