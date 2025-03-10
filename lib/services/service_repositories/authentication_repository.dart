import 'package:crypto_app/models/credential/credential.dart';
import 'package:crypto_app/services/apis/api_client.dart';
import 'package:crypto_app/services/models/api_response/api_response.dart';

class AuthenticationRepository {
  final ApiClient apis;
  AuthenticationRepository({required this.apis});

  Future login(String email, String password) => apis.login({
        "email": email,
        "password": password,
      });

  Future register(String firstName, String lastName, String email,
          String password, String passwordConfirm, String role) =>
      apis.register({
        "firstname": firstName,
        "lastname": lastName,
        "email": email,
        "password": password,
        "password_confirmation": passwordConfirm,
        "role": role
      });
  Future forgotPassword(String email) => apis.forgotPassword({
        "email": email,
      });

  Future<bool> resetPassword(String email, String password,
      String passwordConfirmation, String resetPasswordToken) async {
    try {
      ApiResponse res = await apis.resetPassword({
        "email": email,
        "password": password,
        "password_confirmation": passwordConfirmation,
        "reset_password_token": resetPasswordToken
      });
      return res.status == "success";
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> changePassword(
      String oldPassword, String newPassword, String confirmNewPassword) async {
    try {
      ApiResponse res = await apis.changePassword({
        "old_password": oldPassword,
        "new_password": newPassword,
        "confirm_new_password": confirmNewPassword,
      });
      return res.status == "success";
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> confirmAccount(String token) async {
    try {
      ApiResponse response = await apis.confirmAccount(token);
      return response.status == 'success';
    } catch (e) {
      rethrow;
    }
  }

  Future logOut() => apis.logout();

  Future<bool> resendEmail(String email) async {
    ApiResponse res = await apis.resendMail({"email": email});
    return (res.status == "success");
  }

  Future<Credential> refreshToken(String refreshToken) async {
    ApiResponse<Credential> response =
        await apis.refreshToken({"refresh_token": refreshToken});
    return response.data as Credential;
  }

  Future requestRemove() => apis.requestRemove();
  Future deleteAccount(String token) => apis.deleteUser({"token": token});
}
