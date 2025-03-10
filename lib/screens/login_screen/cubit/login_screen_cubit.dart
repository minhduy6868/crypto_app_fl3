import 'package:bloc/bloc.dart';
import 'package:crypto_app/public_providers/config/bloc_base_state.dart';
import 'package:crypto_app/public_providers/config/update_bloc_base_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../services/service_repositories/authentication_reponsitiory_firebase.dart';
import '../../../shared_customization/data/screen_value.dart';
import '../../../shared_customization/helpers/utilizations/storages.dart';

part 'login_screen_cubit.freezed.dart';
part 'login_screen_state.dart';

class LoginScreenCubit extends Cubit<LoginScreenState> with UpdateBlocBaseState<LoginScreenState> {
  final AuthenticationRepositoryFirebase authRepo;
  final CustomSharedPreferences sp = CustomSharedPreferences(); // Khởi tạo SharedPreferences

  /// Khởi tạo Cubit với trạng thái ban đầu và repository Firebase
  LoginScreenCubit(this.authRepo) : super(const LoginScreenState.initial(isLoading: false));

  /// Cập nhật email
  void updateEmail(String email) {
    emit(state.copyWith(email: email));
  }

  /// Cập nhật mật khẩu
  void updatePassword(String password) {
    emit(state.copyWith(password: password));
  }
  /// Hàm đăng nhập với email và mật khẩu
  Future<void> login() async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      await authRepo.login(
        email: state.email ?? '',
        password: state.password ?? '',
      );

      // Lấy thông tin người dùng từ Firestore
      final userInfo = await authRepo.getUserInfo();

      // Lưu thông tin vào SharedPreferences
      await sp.init();
      await sp.setUserInfo(
        userInfo['email'] ?? '',
        userInfo['firstName'] ?? '',
        userInfo['lastName'] ?? '',
      );

      emit(state.copyWith(
        isLoading: false,
        isLoggedIn: true,
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
  /// Hàm đăng xuất khỏi tài khoản và xóa toàn bộ dữ liệu lưu trữ
  Future<void> logout() async {
    try {
      // Đăng xuất khỏi Firebase
      await authRepo.logout();

      // Xóa toàn bộ dữ liệu lưu trong SharedPreferences
      await sp.init();
      await sp.clear(); // Xóa toàn bộ dữ liệu người dùng khi đăng xuất

      emit(state.copyWith(
        isLoggedIn: false,
        status: ScreenValue.success(),
      ));
    } catch (e) {
      emit(state.copyWith(
        errorMessage: e.toString(),
        status: ScreenValue.failed(),
      ));
    }
  }


  /// Reset lỗi sau khi hiển thị
  @override
  void resetErrorMessage() => emit(state.copyWith(errorMessage: null));

  /// Reset trạng thái sau khi thực hiện hành động
  @override
  void resetStatus() => emit(state.copyWith(status: null));
}
