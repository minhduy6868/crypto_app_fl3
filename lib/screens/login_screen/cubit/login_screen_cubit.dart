import 'package:bloc/bloc.dart';
import 'package:crypto_app/public_providers/config/bloc_base_state.dart';
import 'package:crypto_app/public_providers/config/update_bloc_base_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../app_common_data/common_data/global_variable.dart';
import '../../../services/service_repositories/authentication_reponsitiory_firebase.dart';
import '../../../shared_customization/data/screen_value.dart';
import '../../../shared_customization/helpers/utilizations/storages.dart';
import 'package:flutter/foundation.dart';

part 'login_screen_cubit.freezed.dart';
part 'login_screen_state.dart';

class LoginScreenCubit extends Cubit<LoginScreenState> with UpdateBlocBaseState<LoginScreenState> {
  final AuthenticationRepositoryFirebase authRepo;

  LoginScreenCubit(this.authRepo) : super(const LoginScreenState.initial(isLoading: false));

  void updateEmail(String email) {
    emit(state.copyWith(email: email));
  }

  void updatePassword(String password) {
    emit(state.copyWith(password: password));
  }

  Future<void> login() async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      await authRepo.login(
        email: state.email ?? '',
        password: state.password ?? '',
      );

      // Retrieve user info from Firestore
      final userInfo = await authRepo.getUserInfo();
      debugPrint("DEBUG: Firestore user info - $userInfo");

      // Save user info to SharedPreferences
      await sp.init();
      await sp.setUserInfo(
        userInfo['email'] ?? '',
        userInfo['firstName'] ?? '',
        userInfo['lastName'] ?? '',
      );

      // Verify saved info
      final savedInfo = await sp.getUserInfo();
      debugPrint("DEBUG: Verified saved user info - $savedInfo");

      emit(state.copyWith(
        isLoading: false,
        isLoggedIn: true,
        status: ScreenValue.success(),
      ));
    } catch (e) {
      debugPrint("DEBUG: Login error - $e");

      // Handle admin account creation if login fails for admin@gmail.com
      if ((e.toString().contains('user-not-found') || e.toString().contains('invalid-credential')) &&
          state.email == 'admin@gmail.com') {
        try {
          // Attempt to create admin account
          await authRepo.register(
            email: 'admin@gmail.com',
            password: state.password ?? '12345678Aa',
            firstName: 'Admin',
            lastName: 'User',
            role: 'admin',
          );
          debugPrint("DEBUG: Admin account created successfully");

          // Retry login
          await authRepo.login(
            email: 'admin@gmail.com',
            password: state.password ?? '12345678Aa',
          );

          // Retrieve and save user info
          final userInfo = await authRepo.getUserInfo();
          await sp.init();
          await sp.setUserInfo(
            userInfo['email'] ?? '',
            userInfo['firstName'] ?? '',
            userInfo['lastName'] ?? '',
          );

          // Verify saved info
          final savedInfo = await sp.getUserInfo();
          debugPrint("DEBUG: Verified saved user info after admin creation - $savedInfo");

          emit(state.copyWith(
            isLoading: false,
            isLoggedIn: true,
            status: ScreenValue.success(),
            errorMessage: null,
          ));
        } catch (registerError) {
          debugPrint("DEBUG: Admin registration error - $registerError");
          emit(state.copyWith(
            isLoading: false,
            errorMessage: 'Failed to create admin account: $registerError',
            status: ScreenValue.failed(),
          ));
        }
      } else {
        String errorMessage;
        if (e.toString().contains('invalid-credential')) {
          errorMessage = 'Invalid email or password. Please try again.';
        } else if (e.toString().contains('user-not-found')) {
          errorMessage = 'No user found with this email.';
        } else if (e.toString().contains('wrong-password')) {
          errorMessage = 'Incorrect password. Please try again.';
        } else {
          errorMessage = 'Login failed: ${e.toString()}';
        }

        emit(state.copyWith(
          isLoading: false,
          errorMessage: errorMessage,
          status: ScreenValue.failed(),
        ));
      }
    }
  }

  Future<void> logout() async {
    try {
      await authRepo.logout();

      // Clear user data
      await sp.init();
      await sp.clear();
      debugPrint("DEBUG: User data cleared after logout");

      // Verify cleared data
      final savedInfo = await sp.getUserInfo();
      debugPrint("DEBUG: User info after logout - $savedInfo");

      emit(state.copyWith(
        isLoggedIn: false,
        status: ScreenValue.success(),
      ));
    } catch (e) {
      debugPrint("DEBUG: Logout error - $e");
      emit(state.copyWith(
        errorMessage: e.toString(),
        status: ScreenValue.failed(),
      ));
    }
  }

  Future<void> checkStoredUserInfo() async {
    await sp.init();
    final userInfo = await sp.getUserInfo();
    debugPrint("DEBUG: Checked stored user info - $userInfo");
    emit(state.copyWith(
      errorMessage: userInfo['email'] == null ? 'No user info stored' : null,
      status: userInfo['email'] != null ? ScreenValue.success() : ScreenValue.failed(),
    ));
  }

  @override
  void resetErrorMessage() => emit(state.copyWith(errorMessage: null));

  @override
  void resetStatus() => emit(state.copyWith(status: null));
}