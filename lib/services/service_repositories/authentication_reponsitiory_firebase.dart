// authentication_repository_firebase.dart
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../../app_common_data/routes/app_routes.dart';
import '../../models/news_crypto/news_crypto.dart';

class AuthenticationRepositoryFirebase {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> saveFcmToken(String userId) async {
    try {
      String? fcmToken = await FirebaseMessaging.instance.getToken();
      if (fcmToken != null) {
        await _firestore.collection('users').doc(userId).set(
          {'fcmToken': fcmToken},
          SetOptions(merge: true),
        );
        print('DEBUG: FCM Token saved: $fcmToken');
      }
    } catch (e) {
      print('DEBUG: Error saving FCM token: $e');
    }
  }

  Future<UserCredential> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    String role = 'user',
  }) async {
    try {
      print("DEBUG: Registering user - Email: $email, Role: $role");
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        await _firestore.collection('users').doc(userCredential.user!.uid).set({
          'email': email,
          'firstName': firstName,
          'lastName': lastName,
          'profileImageUrl': "",
          'createdAt': FieldValue.serverTimestamp(),
          'walletPrivateKey': "",
          'walletPublicKey': "",
          'role': role,
          'favoriteCoins': [],
          'favoriteNews': [],
        });
        await saveFcmToken(userCredential.user!.uid);
        print(
            "DEBUG: User data saved to Firestore for UID: ${userCredential.user!
                .uid}");
      } else {
        throw Exception("Không thể tạo người dùng. Vui lòng thử lại.");
      }

      return userCredential;
    } on FirebaseAuthException catch (e) {
      print("DEBUG: FirebaseAuthException during registration: ${e.code} - ${e
          .message}");
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
      print("DEBUG: General error during registration: $e");
      throw Exception("Đã xảy ra lỗi khi đăng ký: $e");
    }
  }

  Future<UserCredential> login({
    required String email,
    required String password,
  }) async {
    try {
      print("DEBUG: Attempting login - Email: $email");
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await saveFcmToken(userCredential.user!.uid);
      FirebaseMessaging.instance.onTokenRefresh.listen((newToken) async {
        await saveFcmToken(userCredential.user!.uid);
      });
      print("DEBUG: Login successful for UID: ${userCredential.user?.uid}");
      return userCredential;
    } on FirebaseAuthException catch (e) {
      print("DEBUG: FirebaseAuthException during login: ${e.code} - ${e
          .message}");
      if (e.code == 'user-not-found') {
        throw Exception("Không tìm thấy người dùng với email này.");
      } else if (e.code == 'wrong-password') {
        throw Exception("Sai mật khẩu. Vui lòng thử lại.");
      } else if (e.code == 'invalid-credential') {
        throw Exception("Thông tin đăng nhập không hợp lệ hoặc đã hết hạn.");
      } else {
        throw Exception("Lỗi đăng nhập: ${e.message}");
      }
    } catch (e) {
      print("DEBUG: General error during login: $e");
      rethrow;
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      print("DEBUG: Sending password reset email to: $email");
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      print("DEBUG: FirebaseAuthException during password reset: ${e.code} - ${e
          .message}");
      if (e.code == 'user-not-found') {
        throw Exception("Không tìm thấy người dùng với email này.");
      } else {
        throw Exception("Lỗi gửi email đặt lại mật khẩu: ${e.message}");
      }
    } catch (e) {
      print("DEBUG: General error during password reset: $e");
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      print("DEBUG: Logging out");
      await _firebaseAuth.signOut();
      print("DEBUG: Logout successful");
    } catch (e) {
      print("DEBUG: Error during logout: $e");
      throw Exception("Lỗi khi đăng xuất: $e");
    }
  }

  Future<void> changePassword(String newPassword) async {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      print("DEBUG: Changing password for UID: ${user.uid}");
      await user.updatePassword(newPassword);
      print("DEBUG: Password changed successfully");
    } else {
      print("DEBUG: No user logged in for password change");
      throw Exception("User not logged in.");
    }
  }

  Future<void> deleteUserAccount(String userId) async {
    final currentUser = _firebaseAuth.currentUser;
    if (currentUser != null) {
      final userDoc = await _firestore.collection('users')
          .doc(currentUser.uid)
          .get();
      if (userDoc.exists && userDoc.data()?['role'] == 'admin') {
        print("DEBUG: Deleting Firestore data for user: $userId");
        await _firestore.collection('users').doc(userId).delete();
        print("DEBUG: Firestore data deleted for user: $userId");
      } else {
        print("DEBUG: Non-admin user attempted to delete account: ${currentUser
            .uid}");
        throw Exception("Chỉ admin mới có quyền xóa tài khoản người dùng.");
      }
    } else {
      print("DEBUG: No user logged in for delete operation");
      throw Exception("User not logged in.");
    }
  }

  Future<void> updateUserAvatar(String avatarPath) async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user != null) {
        print("DEBUG: Updating avatar for UID: ${user.uid}");
        await _firestore.collection('users').doc(user.uid).update({
          'profileImageUrl': avatarPath,
        });
        print("DEBUG: Avatar updated successfully");
      } else {
        print("DEBUG: No user logged in for avatar update");
        throw Exception("User not logged in.");
      }
    } catch (e) {
      print("DEBUG: Error updating avatar: $e");
      throw Exception("Error updating avatar: $e");
    }
  }

  Future<void> updateUserName(String firstName, String lastName) async {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      print("DEBUG: Updating name for UID: ${user.uid}");
      await _firestore.collection('users').doc(user.uid).update({
        'firstName': firstName,
        'lastName': lastName,
      });
      print("DEBUG: Name updated successfully");
    } else {
      print("DEBUG: No user logged in for name update");
      throw Exception("User not logged in.");
    }
  }

  Future<void> updateWallet(String walletPrivateKey,
      String walletPublicKey) async {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      print("DEBUG: Updating wallet for UID: ${user.uid}");
      await _firestore.collection('users').doc(user.uid).update({
        'walletPrivateKey': walletPrivateKey,
        'walletPublicKey': walletPublicKey,
      });
      print("DEBUG: Wallet updated successfully");
    } else {
      print("DEBUG: No user logged in for wallet update");
      throw Exception("Đã xảy ra lỗi khi lưu mã ví.");
    }
  }

  Future<void> saveTransaction({
    required String txHash,
    required String fromAddress,
    required String toAddress,
    required double amountInEth,
    required BigInt gasFeeInWei,
    required String status,
    required String chain,
  }) async {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      print("DEBUG: Saving transaction for UID: ${user.uid}, TxHash: $txHash");
      await _firestore.collection('transactions').doc(txHash).set({
        'txHash': txHash,
        'fromAddress': fromAddress,
        'toAddress': toAddress,
        'amountInEth': amountInEth,
        'gasFeeInWei': gasFeeInWei.toString(),
        'timestamp': FieldValue.serverTimestamp(),
        'status': status,
        'chain': chain,
        'userId': user.uid,
      });
      print("DEBUG: Transaction saved successfully");
    } else {
      print("DEBUG: No user logged in for transaction save");
      throw Exception("User not logged in.");
    }
  }

  Future<void> updateTransactionStatus(String txHash, String status) async {
    print("DEBUG: Updating transaction status for TxHash: $txHash");
    await _firestore.collection('transactions').doc(txHash).update({
      'status': status,
      'timestamp': FieldValue.serverTimestamp(),
    });
    print("DEBUG: Transaction status updated successfully");
  }

  Future<void> sendPushNotification(String userId, String txHash,
      String warning) async {
    try {
      final userDoc = await _firestore.collection('users').doc(userId).get();
      final fcmToken = userDoc.data()?['fcmToken'] as String?;

      if (fcmToken == null) {
        print('DEBUG: No FCM token found for user: $userId');
        throw Exception('Không tìm thấy FCM token.');
      }

      final serverKey = dotenv.env['FCM_SERVER_KEY'];
      if (serverKey == null) {
        throw Exception('FCM Server Key không được cấu hình trong .env');
      }

      final url = Uri.parse('https://fcm.googleapis.com/fcm/send');
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'key=$serverKey',
      };
      final body = jsonEncode({
        'notification': {
          'title': 'Cảnh báo giao dịch',
          'body': 'Giao dịch $txHash bị cảnh báo: $warning',
        },
        'data': {
          'txHash': txHash,
          'route': Routes.walletScreen,
        },
        'to': fcmToken,
      });

      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        print('DEBUG: Notification sent successfully to user: $userId');
      } else {
        print('DEBUG: Failed to send notification: ${response.body}');
        throw Exception('Gửi thông báo thất bại: ${response.body}');
      }
    } catch (e) {
      print('DEBUG: Error sending push notification: $e');
      throw Exception('Lỗi khi gửi thông báo: $e');
    }
  }

  Future<void> addTransactionWarning(String txHash, String warning) async {
    final currentUser = _firebaseAuth.currentUser;
    if (currentUser != null) {
      final userDoc = await _firestore.collection('users')
          .doc(currentUser.uid)
          .get();
      if (userDoc.exists && userDoc.data()?['role'] == 'admin') {
        print("DEBUG: Adding warning to transaction: $txHash");
        final txDoc = await _firestore.collection('transactions')
            .doc(txHash)
            .get();
        final userId = txDoc.data()?['userId'] as String?;
        await _firestore.collection('transactions').doc(txHash).update({
          'warning': warning,
          'warnedBy': currentUser.email ?? 'Admin',
          'warnedAt': FieldValue.serverTimestamp(),
        });
        if (userId != null) {
          await sendPushNotification(userId, txHash, warning);
        }
        print("DEBUG: Warning added and notification sent successfully");
      } else {
        print("DEBUG: Non-admin user attempted to add warning: ${currentUser
            .uid}");
        throw Exception("Chỉ admin mới có quyền thêm cảnh báo giao dịch.");
      }
    } else {
      print("DEBUG: No user logged in for transaction warning");
      throw Exception("User not logged in.");
    }
  }

  Future<Map<String, dynamic>?> getUserInfoById(String userId) async {
    try {
      final currentUser = _firebaseAuth.currentUser;
      if (currentUser != null) {
        final adminDoc = await _firestore.collection('users').doc(
            currentUser.uid).get();
        if (adminDoc.exists && adminDoc.data()?['role'] == 'admin') {
          print(
              "DEBUG: Fetching user info for userId: $userId by admin UID: ${currentUser
                  .uid}");
          final userDoc = await _firestore.collection('users')
              .doc(userId)
              .get();
          if (userDoc.exists) {
            print("DEBUG: User info retrieved for userId: $userId");
            return userDoc.data() as Map<String, dynamic>;
          } else {
            print("DEBUG: User document not found for userId: $userId");
            return null;
          }
        } else {
          print(
              "DEBUG: Non-admin user attempted to fetch user info: ${currentUser
                  .uid}");
          throw Exception("Chỉ admin mới có quyền xem thông tin người dùng.");
        }
      } else {
        print("DEBUG: No user logged in for user info fetch");
        throw Exception("Người dùng chưa đăng nhập.");
      }
    } catch (e) {
      print("DEBUG: Error fetching user info for userId: $userId - $e");
      throw Exception("Lỗi khi lấy thông tin người dùng: $e");
    }
  }

  Future<List<Map<String, dynamic>>> getAllTransactions({
    String? userId,
    String? status,
    String? chain,
  }) async {
    final currentUser = _firebaseAuth.currentUser;
    if (currentUser != null) {
      final userDoc = await _firestore.collection('users')
          .doc(currentUser.uid)
          .get();
      if (userDoc.exists && userDoc.data()?['role'] == 'admin') {
        print("DEBUG: Fetching all transactions for admin UID: ${currentUser
            .uid}");
        try {
          Query query = _firestore
              .collection('transactions')
              .orderBy('timestamp', descending: true);

          if (userId != null) {
            query = query.where('userId', isEqualTo: userId);
          }
          if (status != null) {
            query = query.where('status', isEqualTo: status);
          }
          if (chain != null) {
            query = query.where('chain', isEqualTo: chain);
          }

          QuerySnapshot querySnapshot = await query.get();

          List<Map<String, dynamic>> transactions = querySnapshot.docs.map((
              doc) {
            Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
            data['block_timestamp'] =
                data['timestamp']?.toDate().toString() ?? '';
            return data;
          }).toList();

          print(
              "DEBUG: Retrieved ${transactions.length} transactions for admin");
          return transactions;
        } catch (e) {
          print("DEBUG: Error fetching transactions for admin: $e");
          throw Exception("Lỗi khi lấy danh sách giao dịch: $e");
        }
      } else {
        print(
            "DEBUG: Non-admin user attempted to fetch transactions: ${currentUser
                .uid}");
        throw Exception("Chỉ admin mới có quyền xem danh sách giao dịch.");
      }
    } else {
      print("DEBUG: No user logged in for transaction fetch");
      throw Exception("Người dùng chưa đăng nhập.");
    }
  }

  Future<bool> isAdmin() async {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      final userDoc = await _firestore.collection('users').doc(user.uid).get();
      bool isAdmin = userDoc.exists && userDoc.data()?['role'] == 'admin';
      print("DEBUG: Checking admin status for UID: ${user
          .uid} - IsAdmin: $isAdmin");
      return isAdmin;
    }
    print("DEBUG: No user logged in for admin check");
    return false;
  }

  Future<void> resendEmailVerification() async {
    try {
      User? user = _firebaseAuth.currentUser;
      if (user != null && !user.emailVerified) {
        print("DEBUG: Resending verification email for UID: ${user.uid}");
        await user.sendEmailVerification();
        print("DEBUG: Verification email sent successfully");
      } else {
        print("DEBUG: Email already verified or no user found");
        throw Exception(
            "Email đã được xác minh hoặc không tìm thấy người dùng.");
      }
    } catch (e) {
      print("DEBUG: Error resending verification email: $e");
      throw Exception("Lỗi gửi lại email xác nhận: $e");
    }
  }

  Future<bool> isEmailVerified() async {
    User? user = _firebaseAuth.currentUser;
    if (user != null) {
      await user.reload();
      print("DEBUG: Checking email verification for UID: ${user
          .uid} - Verified: ${user.emailVerified}");
      return user.emailVerified;
    }
    print("DEBUG: No user logged in for email verification check");
    return false;
  }

  Future<Map<String, dynamic>> getUserInfo() async {
    try {
      User? user = _firebaseAuth.currentUser;
      if (user != null) {
        print("DEBUG: Fetching user info for UID: ${user.uid}");
        DocumentSnapshot userDoc = await _firestore.collection('users').doc(
            user.uid).get();
        if (userDoc.exists) {
          print("DEBUG: User info retrieved successfully");
          return userDoc.data() as Map<String, dynamic>;
        } else {
          print("DEBUG: User document not found in Firestore");
          throw Exception(
              "Không tìm thấy thông tin người dùng trong Firestore.");
        }
      } else {
        print("DEBUG: No user logged in for user info fetch");
        throw Exception("Người dùng chưa đăng nhập.");
      }
    } catch (e) {
      print("DEBUG: Error fetching user info: $e");
      throw Exception("Lỗi khi lấy thông tin người dùng: $e");
    }
  }

  Future<double> getGasPrice() async {
    try {
      final doc = await _firestore.collection('config').doc('gasPrice').get();
      if (doc.exists) {
        final data = doc.data()!;
        final value = data['value'] as num?;
        if (value != null && value >= 1 && value <= 100) {
          print("DEBUG: Retrieved gas price: $value Gwei");
          return value.toDouble();
        }
      }
      print("DEBUG: Gas price not set or invalid, using default: 10 Gwei");
      await _firestore.collection('config').doc('gasPrice').set({
        'value': 10.0,
        'updatedBy': 'system',
        'updatedAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
      return 10.0;
    } catch (e) {
      print("DEBUG: Error fetching gas price: $e");
      return 10.0;
    }
  }

  Future<void> setGasPrice(double gasPrice) async {
    final currentUser = _firebaseAuth.currentUser;
    if (currentUser != null) {
      final userDoc = await _firestore.collection('users')
          .doc(currentUser.uid)
          .get();
      if (userDoc.exists && userDoc.data()?['role'] == 'admin') {
        if (gasPrice < 1 || gasPrice > 100) {
          print("DEBUG: Invalid gas price: $gasPrice Gwei (must be 1–100)");
          throw Exception("Phí gas phải nằm trong khoảng 1–100 Gwei.");
        }
        print(
            "DEBUG: Setting gas price to $gasPrice Gwei by admin UID: ${currentUser
                .uid}");
        await _firestore.collection('config').doc('gasPrice').set({
          'value': gasPrice,
          'updatedBy': currentUser.email ?? 'Admin',
          'updatedAt': FieldValue.serverTimestamp(),
        }, SetOptions(merge: true));
        print("DEBUG: Gas price updated successfully");
      } else {
        print("DEBUG: Non-admin user attempted to set gas price: ${currentUser
            .uid}");
        throw Exception("Chỉ admin mới có quyền điều chỉnh phí gas.");
      }
    } else {
      print("DEBUG: No user logged in for gas price update");
      throw Exception("Người dùng chưa đăng nhập.");
    }
  }

  Future<void> addFavoriteCoin(String coinId) async {
    final user = _firebaseAuth.currentUser;
    if (user == null) {
      print("DEBUG: No user logged in for adding favorite coin");
      throw Exception("User not logged in.");
    }

    try {
      print("DEBUG: Adding favorite coin $coinId for UID: ${user.uid}");
      await _firestore.collection('users').doc(user.uid).update({
        'favoriteCoins': FieldValue.arrayUnion([coinId]),
      });
      print("DEBUG: Coin $coinId added to favorites successfully");
    } catch (e) {
      print("DEBUG: Error adding favorite coin: $e");
      await _firestore.collection('users').doc(user.uid).set({
        'favoriteCoins': [coinId],
      }, SetOptions(merge: true));
      print("DEBUG: Created favoriteCoins field and added $coinId");
    }
  }

  Future<void> removeFavoriteCoin(String coinId) async {
    final user = _firebaseAuth.currentUser;
    if (user == null) {
      print("DEBUG: No user logged in for removing favorite coin");
      throw Exception("User not logged in.");
    }

    try {
      print("DEBUG: Removing favorite coin $coinId for UID: ${user.uid}");
      await _firestore.collection('users').doc(user.uid).update({
        'favoriteCoins': FieldValue.arrayRemove([coinId]),
      });
      print("DEBUG: Coin $coinId removed from favorites successfully");
    } catch (e) {
      print("DEBUG: Error removing favorite coin: $e");
      throw Exception("Error removing favorite coin: $e");
    }
  }

  Future<List<String>> getFavoriteCoinIds() async {
    final user = _firebaseAuth.currentUser;
    if (user == null) {
      print("DEBUG: No user logged in for fetching favorite coins");
      throw Exception("User not logged in.");
    }

    try {
      print("DEBUG: Fetching favorite coins for UID: ${user.uid}");
      final userDoc = await _firestore.collection('users').doc(user.uid).get();
      final favoriteCoins = userDoc.data()?['favoriteCoins'] as List<dynamic>?;
      return favoriteCoins?.cast<String>() ?? [];
    } catch (e) {
      print("DEBUG: Error fetching favorite coins: $e");
      throw Exception("Error fetching favorite coins: $e");
    }
  }

  Future<void> addFavoriteNews(NewsCrypto news) async {
    final user = _firebaseAuth.currentUser;
    if (user == null) throw Exception("User not logged in.");
    try {
      await _firestore.collection('users').doc(user.uid).update({
        'favoriteNews': FieldValue.arrayUnion([news.toJson()]),
      });
    } catch (e) {
      await _firestore.collection('users').doc(user.uid).set({
        'favoriteNews': [news.toJson()],
      }, SetOptions(merge: true));
    }
  }

  Future<void> removeFavoriteNews(String newsId) async {
    final user = _firebaseAuth.currentUser;
    if (user == null) throw Exception("User not logged in.");
    try {
      final userDoc = await _firestore.collection('users').doc(user.uid).get();
      final favoriteNews = userDoc.data()?['favoriteNews'] as List<dynamic>? ??
          [];
      final newsToRemove = favoriteNews.firstWhere(
            (news) => news['link'] == newsId,
        orElse: () => null,
      );
      if (newsToRemove != null) {
        await _firestore.collection('users').doc(user.uid).update({
          'favoriteNews': FieldValue.arrayRemove([newsToRemove]),
        });
      }
    } catch (e) {
      throw Exception("Error removing favorite news: $e");
    }
  }

  Future<List<NewsCrypto>> getFavoriteNews() async {
    final user = _firebaseAuth.currentUser;
    if (user == null) throw Exception("User not logged in.");
    try {
      final userDoc = await _firestore.collection('users').doc(user.uid).get();
      final favoriteNews = userDoc.data()?['favoriteNews'] as List<dynamic>?;
      return favoriteNews?.map((news) =>
          NewsCrypto.fromJson(news as Map<String, dynamic>)).toList() ?? [];
    } catch (e) {
      throw Exception("Error fetching favorite news: $e");
    }
  }
}