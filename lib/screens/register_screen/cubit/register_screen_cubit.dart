import 'package:bloc/bloc.dart';
import 'package:crypto_app/public_providers/config/bloc_base_state.dart';
import 'package:crypto_app/public_providers/config/update_bloc_base_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../services/service_repositories/authentication_reponsitiory_firebase.dart';
import '../../../shared_customization/data/screen_value.dart';

part 'register_screen_cubit.freezed.dart';
part 'register_screen_state.dart';

class RegisterScreenCubit extends Cubit<RegisterScreenState> with UpdateBlocBaseState<RegisterScreenState> {
  final AuthenticationRepositoryFirebase authRepo;

  /// Khởi tạo trạng thái ban đầu
  RegisterScreenCubit(this.authRepo) : super(const RegisterScreenState.initial(isLoading: false));

  /// Cập nhật thông tin người dùng
  void updateFirstName(String firstName) => emit(state.copyWith(firstName: firstName));
  void updateLastName(String lastName) => emit(state.copyWith(lastName: lastName));
  void updateEmail(String email) => emit(state.copyWith(email: email));
  void updatePassword(String password) => emit(state.copyWith(password: password));
  void updateConfirmPassword(String confirmPassword) => emit(state.copyWith(confirmPassword: confirmPassword));

  /// Hàm xử lý đăng ký tài khoản và lưu thông tin vào Firestore
  Future<void> register() async {
    // Kiểm tra mật khẩu xác nhận
    if (state.password != state.confirmPassword) {
      emit(state.copyWith(
        errorMessage: "Mật khẩu xác nhận không khớp!",
        status: ScreenValue.failed(),
      ));
      return;
    }

    emit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      // Thực hiện đăng ký người dùng mới
      await authRepo.register(
        email: state.email ?? '',
        password: state.password ?? '',
        firstName: state.firstName ?? '',
        lastName: state.lastName ?? '',
      );

      // Cập nhật trạng thái thành công
      emit(state.copyWith(
        isLoading: false,
        isRegistered: true,
        status: ScreenValue.success(),
      ));
    } catch (e) {
      // Xử lý lỗi khi đăng ký thất bại
      emit(state.copyWith(
        isLoading: false,
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
