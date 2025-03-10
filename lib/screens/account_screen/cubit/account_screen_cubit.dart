import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:crypto_app/shared_customization/helpers/string_helper.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import '../../../public_providers/config/bloc_base_state.dart';
import '../../../public_providers/config/update_bloc_base_state.dart';
import '../../../services/service_repositories/authentication_reponsitiory_firebase.dart';
import '../../../shared_customization/data/screen_value.dart';
import '../../../shared_customization/helpers/utilizations/storages.dart';

part 'account_screen_cubit.freezed.dart';
part 'account_screen_state.dart';

class AccountScreenCubit extends Cubit<AccountScreenState> with UpdateBlocBaseState<AccountScreenState> {
  final AuthenticationRepositoryFirebase authRepo;

  AccountScreenCubit(this.authRepo) : super(const AccountScreenState.initial());

  Future<void> logout() async {
    try {
      // Đăng xuất khỏi Firebase
      await authRepo.logout();

      // Xóa toàn bộ dữ liệu lưu trữ trong SharedPreferences
      final sp = CustomSharedPreferences();
      await sp.init();
      await sp.clear(); // Xóa dữ liệu người dùng đã lưu

      // Cập nhật lại state sau khi đăng xuất
      emit(state.copyWith(
        email: null,
        firstName: null,
        lastName: null,
        profileImageUrl: null,
        status: ScreenValue.success(),
      ));
    } catch (e) {
      emit(state.copyWith(
        errorMessage: "Đăng xuất thất bại: ${e.toString()}",
        status: ScreenValue.failed(),
      ));
    }
  }

  /// Call API để lấy thông tin người dùng từ Firestore
  Future<void> getUserInfo() async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      final userInfo = await authRepo.getUserInfo(); // Lấy dữ liệu từ Firestore

      emit(state.copyWith(
        isLoading: false,
        email: userInfo['email'] ?? '',
        firstName: userInfo['firstName'] ?? '',
        lastName: userInfo['lastName'] ?? '',
        profileImageUrl: userInfo['profileImageUrl'] ?? '',
        status: ScreenValue.success(),
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
        status: ScreenValue.failed(),
      ));
    }
  }

  /// Đổi mật khẩu
  Future<void> changePassword(String newPassword) async {
    try {
      await authRepo.changePassword(newPassword);
      emit(state.copyWith(status: ScreenValue.success()));
    } catch (e) {
      emit(state.copyWith(
        errorMessage: "Change password failed: ${e.toString()}",
        status: ScreenValue.failed(),
      ));
    }
  }

  /// Đặt lại mật khẩu qua email
  Future<void> resetPassword() async {
    try {
      await authRepo.sendPasswordResetEmail(state.email ?? '');
      emit(state.copyWith(status: ScreenValue.success()));
    } catch (e) {
      emit(state.copyWith(
        errorMessage: "Reset password failed: ${e.toString()}",
        status: ScreenValue.failed(),
      ));
    }
  }

  /// Xóa tài khoản
  Future<void> deleteAccount() async {
    try {
      await authRepo.deleteAccount();
      emit(state.copyWith(status: ScreenValue.success()));
    } catch (e) {
      emit(state.copyWith(
        errorMessage: "Delete account failed: ${e.toString()}",
        status: ScreenValue.failed(),
      ));
    }
  }


  Future<void> pickAndUpdateAvatar() async {
    emit(state.copyWith(isLoading: true));

    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        final File imageFile = File(pickedFile.path);

        // Upload ảnh lên Cloudinary
        final uploadedImageUrl = await StringHelper().uploadImageToCloudinary(imageFile);

        if (uploadedImageUrl != null) {
          // Lưu đường dẫn ảnh đã upload vào Firestore
          await authRepo.updateUserAvatar(uploadedImageUrl);

          emit(state.copyWith(
            profileImageUrl: uploadedImageUrl,
            isLoading: false,
            status: ScreenValue.success(),
          ));
        } else {
          emit(state.copyWith(isLoading: false, errorMessage: "Image upload failed."));
        }
      } else {
        emit(state.copyWith(isLoading: false)); // Người dùng hủy chọn ảnh
      }
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
        status: ScreenValue.failed(),
      ));
    }
  }

  Future<void> updateUserName(String firstName, String lastName) async {
    emit(state.copyWith(isLoading: true));

    try {
      await authRepo.updateUserName(firstName, lastName);

      emit(state.copyWith(
        firstName: firstName,
        lastName: lastName,
        isLoading: false,
        status: ScreenValue.success(),
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
        status: ScreenValue.failed(),
      ));
    }
  }


  @override
  void resetErrorMessage() => emit(state.copyWith(errorMessage: null));

  @override
  void resetStatus() => emit(state.copyWith(status: null));
}
