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

part 'admin_management_screen_cubit.freezed.dart';
part 'admin_management_screen_state.dart';

class AdminManagementScreenCubit extends Cubit<AdminManagementScreenState> with UpdateBlocBaseState<AdminManagementScreenState> {
  final AuthenticationRepositoryFirebase authRepo;

  AdminManagementScreenCubit(this.authRepo) : super(const AdminManagementScreenState.initial()) {
    getAdminInfo();
  }

  Future<void> getAdminInfo() async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      final userInfo = await authRepo.getUserInfo();
      final isAdmin = await authRepo.isAdmin();
      final currentGasPrice = await authRepo.getGasPrice();
      if (!isAdmin) {
        throw Exception("Tài khoản không có quyền admin.");
      }
      print("DEBUG: Admin info fetched - Email: ${userInfo['email']}, Gas Price: $currentGasPrice Gwei");
      emit(state.copyWith(
        isLoading: false,
        email: userInfo['email'] ?? '',
        firstName: userInfo['firstName'] ?? '',
        lastName: userInfo['lastName'] ?? '',
        profileImageUrl: userInfo['profileImageUrl'] ?? '',
        currentGasPrice: currentGasPrice,
        status: ScreenValue.success(),
      ));
    } catch (e) {
      print("DEBUG: Error in getAdminInfo: $e");
      emit(state.copyWith(
        isLoading: false,
        errorMessage: 'Lỗi khi lấy thông tin admin: $e',
        status: ScreenValue.failed(),
      ));
    }
  }

  Future<void> setGasPrice(double gasPrice) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      await authRepo.setGasPrice(gasPrice);
      print("DEBUG: Gas price set to $gasPrice Gwei");
      emit(state.copyWith(
        isLoading: false,
        currentGasPrice: gasPrice,
        status: ScreenValue.success(),
      ));
    } catch (e) {
      print("DEBUG: Error setting gas price: $e");
      emit(state.copyWith(
        isLoading: false,
        errorMessage: "Cập nhật phí gas thất bại: $e",
        status: ScreenValue.failed(),
      ));
    }
  }

  Future<void> logout() async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      await authRepo.logout();
      final sp = CustomSharedPreferences();
      await sp.init();
      await sp.clear();
      print("DEBUG: Logout successful");
      emit(state.copyWith(
        isLoading: false,
        email: null,
        firstName: null,
        lastName: null,
        profileImageUrl: null,
        currentGasPrice: null,
        status: ScreenValue.success(),
      ));
    } catch (e) {
      print("DEBUG: Error during logout: $e");
      emit(state.copyWith(
        isLoading: false,
        errorMessage: "Đăng xuất thất bại: $e",
        status: ScreenValue.failed(),
      ));
    }
  }

  Future<void> changePassword(String newPassword) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      await authRepo.changePassword(newPassword);
      print("DEBUG: Password changed successfully");
      emit(state.copyWith(isLoading: false, status: ScreenValue.success()));
    } catch (e) {
      print("DEBUG: Error changing password: $e");
      emit(state.copyWith(
        isLoading: false,
        errorMessage: "Đổi mật khẩu thất bại: $e",
        status: ScreenValue.failed(),
      ));
    }
  }

  Future<void> resetPassword() async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      if (state.email == null || state.email!.isEmpty) {
        throw Exception("Email không hợp lệ.");
      }
      await authRepo.sendPasswordResetEmail(state.email!);
      print("DEBUG: Password reset email sent");
      emit(state.copyWith(isLoading: false, status: ScreenValue.success()));
    } catch (e) {
      print("DEBUG: Error resetting password: $e");
      emit(state.copyWith(
        isLoading: false,
        errorMessage: "Đặt lại mật khẩu thất bại: $e",
        status: ScreenValue.failed(),
      ));
    }
  }

  Future<void> deleteUserAccount(String userId) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      await authRepo.deleteUserAccount(userId);
      print("DEBUG: User account deleted: $userId");
      emit(state.copyWith(isLoading: false, status: ScreenValue.success()));
    } catch (e) {
      print("DEBUG: Error deleting user account: $e");
      emit(state.copyWith(
        isLoading: false,
        errorMessage: "Xóa tài khoản thất bại: $e",
        status: ScreenValue.failed(),
      ));
    }
  }

  Future<void> pickAndUpdateAvatar() async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        final File imageFile = File(pickedFile.path);
        final uploadedImageUrl = await StringHelper().uploadImageToCloudinary(imageFile);
        if (uploadedImageUrl != null) {
          await authRepo.updateUserAvatar(uploadedImageUrl);
          print("DEBUG: Avatar updated: $uploadedImageUrl");
          emit(state.copyWith(
            profileImageUrl: uploadedImageUrl,
            isLoading: false,
            status: ScreenValue.success(),
          ));
        } else {
          throw Exception("Tải ảnh lên thất bại.");
        }
      } else {
        print("DEBUG: No image picked");
        emit(state.copyWith(isLoading: false));
      }
    } catch (e) {
      print("DEBUG: Error updating avatar: $e");
      emit(state.copyWith(
        isLoading: false,
        errorMessage: "Cập nhật ảnh đại diện thất bại: $e",
        status: ScreenValue.failed(),
      ));
    }
  }

  Future<void> updateUserName(String firstName, String lastName) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      await authRepo.updateUserName(firstName, lastName);
      print("DEBUG: User name updated: $firstName $lastName");
      emit(state.copyWith(
        firstName: firstName,
        lastName: lastName,
        isLoading: false,
        status: ScreenValue.success(),
      ));
    } catch (e) {
      print("DEBUG: Error updating user name: $e");
      emit(state.copyWith(
        isLoading: false,
        errorMessage: "Cập nhật tên thất bại: $e",
        status: ScreenValue.failed(),
      ));
    }
  }

  Future<Map<String, dynamic>?> fetchUserInfoForWarning(String userId) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      final userInfo = await authRepo.getUserInfoById(userId);
      if (userInfo != null) {
        print("DEBUG: User info fetched for warning - UserId: $userId, Email: ${userInfo['email']}");
        emit(state.copyWith(
          isLoading: false,
          warningUserInfo: userInfo,
          status: ScreenValue.success(),
        ));
        return userInfo;
      } else {
        throw Exception("Không tìm thấy thông tin người dùng.");
      }
    } catch (e) {
      print("DEBUG: Error fetching user info for warning: $e");
      emit(state.copyWith(
        isLoading: false,
        errorMessage: "Lỗi khi lấy thông tin người dùng: $e",
        status: ScreenValue.failed(),
      ));
      rethrow;
    }
  }

  Future<void> addTransactionWarning(String txHash, String warning) async {
    emit(state.copyWith(isLoading: true, errorMessage: null, notificationMessage: null));
    try {
      await authRepo.addTransactionWarning(txHash, warning);
      print("DEBUG: Transaction warning added: $txHash");
      emit(state.copyWith(
        isLoading: false,
        notificationMessage: 'Đã thêm cảnh báo và gửi thông báo',
        status: ScreenValue.success(),
        warningUserInfo: null,
      ));
    } catch (e) {
      print("DEBUG: Error adding transaction warning: $e");
      emit(state.copyWith(
        isLoading: false,
        errorMessage: "Thêm cảnh báo thất bại: $e",
        status: ScreenValue.failed(),
      ));
    }
  }

  @override
  void resetErrorMessage() => emit(state.copyWith(errorMessage: null, notificationMessage: null));

  @override
  void resetStatus() => emit(state.copyWith(status: null));
}