import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../app_common_data/common_data/global_variable.dart';

/// Lớp xử lý các chức năng xác thực với Firebase Authentication và lưu dữ liệu vào Firestore
class AuthenticationRepositoryFirebase {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Lấy thông tin người dùng hiện tại
  User? get currentUser => _firebaseAuth.currentUser;

  /// Kiểm tra trạng thái đăng nhập
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  /// Đăng ký người dùng mới với email, mật khẩu và lưu thông tin vào Firestore
  Future<UserCredential> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    try {
      print("in ra dữ liệu đầu vào: ${firstName}");
      // Tạo tài khoản
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Kiểm tra xem người dùng đã được tạo chưa
      if (userCredential.user != null) {
        // Lưu thông tin người dùng vào Firestore
        await _firestore.collection('users').doc(userCredential.user!.uid).set({
          'email': email,
          'firstName': firstName,
          'lastName': lastName,
          'profileImageUrl': "", // Để trống khi đăng ký
          'createdAt': FieldValue.serverTimestamp(), // Lưu thời gian tạo tài khoản
          'walletPrivateKey': "",
          'walletPublicKey': "",
        }).then((_) {
          print("✅ Dữ liệu đã được lưu vào Firestore");
        }).catchError((error) {
          print("❌ Lỗi khi lưu dữ liệu vào Firestore: $error");
        });
      } else {
        throw Exception("Không thể tạo người dùng. Vui lòng thử lại.");
      }

      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw Exception("Email này đã được sử dụng.");
      } else if (e.code == 'weak-password') {
        throw Exception("Mật khẩu quá yếu.");
      } else if (e.code == 'invalid-email') {
        throw Exception("Email không hợp lệ.");
      } else {
        throw Exception("Lỗi đăng ký: ${e.message}");
      }
    } catch (e) {
      throw Exception("Đã xảy ra lỗi khi đăng ký: $e");
    }
  }

  /// Đăng nhập bằng email và mật khẩu
  Future<UserCredential> login({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception("Không tìm thấy người dùng với email này.");
      } else if (e.code == 'wrong-password') {
        throw Exception("Sai mật khẩu. Vui lòng thử lại.");
      } else {
        throw Exception("Lỗi đăng nhập: ${e.message}");
      }
    } catch (e) {
      rethrow;
    }
  }

  /// Đặt lại mật khẩu qua email
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception("Không tìm thấy người dùng với email này.");
      } else {
        throw Exception("Lỗi gửi email đặt lại mật khẩu: ${e.message}");
      }
    } catch (e) {
      rethrow;
    }
  }

  /// Đăng xuất khỏi tài khoản hiện tại
  Future<void> logout() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      throw Exception("Lỗi khi đăng xuất: $e");
    }
  }

  /// Đổi mật khẩu
  Future<void> changePassword(String newPassword) async {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      await user.updatePassword(newPassword);
    } else {
      throw Exception("User not logged in.");
    }
  }

  /// Xóa tài khoản
  Future<void> deleteAccount() async {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      await _firestore.collection('users').doc(user.uid).delete(); // Xóa dữ liệu Firestore
      await user.delete(); // Xóa tài khoản Firebase Auth
    } else {
      throw Exception("User not logged in.");
    }
  }

  Future<void> updateUserAvatar(String avatarPath) async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user != null) {
        await _firestore.collection('users').doc(user.uid).update({
          'profileImageUrl': avatarPath, // Lưu đường dẫn ảnh vào Firestore
        });
      } else {
        throw Exception("User not logged in.");
      }
    } catch (e) {
      throw Exception("Error updating avatar: $e");
    }
  }

  Future<void> updateUserName(String firstName, String lastName) async {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      await _firestore.collection('users').doc(user.uid).update({
        'firstName': firstName,
        'lastName': lastName,
      });
    } else {
      throw Exception("User not logged in.");
    }
  }

  Future<void> updateWallet(String walletPrivateKey, String walletPublicKey) async {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      await _firestore.collection('users').doc(user.uid).update({
        'walletPrivateKey': walletPrivateKey,
        'walletPublicKey': walletPublicKey,
      });
    } else {
      throw Exception("Đã xảy ra lỗi khi lưu mã ví.");
    }
  }



  /// Gửi lại email xác nhận
  Future<void> resendEmailVerification() async {
    try {
      User? user = _firebaseAuth.currentUser;
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
      } else {
        throw Exception("Email đã được xác minh hoặc không tìm thấy người dùng.");
      }
    } catch (e) {
      throw Exception("Lỗi gửi lại email xác nhận: $e");
    }
  }

  /// Xác minh xem người dùng đã xác nhận email chưa
  Future<bool> isEmailVerified() async {
    User? user = _firebaseAuth.currentUser;
    if (user != null) {
      await user.reload();
      return user.emailVerified;
    }
    return false;
  }

  /// Lấy thông tin người dùng từ Firestore
  Future<Map<String, dynamic>> getUserInfo() async {
    try {
      User? user = _firebaseAuth.currentUser;
      if (user != null) {
        DocumentSnapshot userDoc =
        await _firestore.collection('users').doc(user.uid).get();

        if (userDoc.exists) {
          return userDoc.data() as Map<String, dynamic>;
        } else {
          throw Exception("Không tìm thấy thông tin người dùng trong Firestore.");
        }
      } else {
        throw Exception("Người dùng chưa đăng nhập.");
      }
    } catch (e) {
      throw Exception("Lỗi khi lấy thông tin người dùng: $e");
    }
  }

}
