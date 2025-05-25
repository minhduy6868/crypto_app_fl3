// ignore_for_file: depend_on_referenced_packages

import 'package:crypto_app/firebase_options.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:device_preview/device_preview.dart';
import 'package:crypto_app/app_common_data/common_data/global_variable.dart';
import 'package:crypto_app/screens/my_app/my_app.dart';
import 'package:crypto_app/services/apis/api_client.dart';
import 'package:crypto_app/services/app_dio.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

// Hàm xử lý thông báo nền
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  print("Handling background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Khởi tạo Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Khởi tạo Firebase Messaging
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  // Yêu cầu quyền thông báo
  await messaging.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );

  // Đăng ký xử lý thông báo nền
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // Xử lý thông báo tiền cảnh
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Received foreground message: ${message.notification?.title}');
    if (message.notification != null) {
      // Hiển thị thông báo trong ứng dụng (sẽ xử lý chi tiết trong UserHomeScreen)
      print('Message title: ${message.notification!.title}, body: ${message.notification!.body}');
    }
  });

  // Cấu hình Firebase Auth
  FirebaseAuth.instance.setSettings(appVerificationDisabledForTesting: true);

  // Khởi tạo Google Mobile Ads
  MobileAds.instance.initialize();

  // Khởi tạo EasyLocalization
  await EasyLocalization.ensureInitialized();

  // Khởi tạo SharedPreferences
  await sp.init();

  // Tải file .env
  await dotenv.load(fileName: ".env.development");

  // Khởi tạo API clients
  apinews = ApiClient(AppDio(), baseUrl: dotenv.env['API_KEY_NEWS']!);
  apis = ApiClient(AppDio(), baseUrl: dotenv.env['BASE_URL']!);

  // Get saved language or use default 'vi'
  final savedLanguage = sp.currentLanguage;

  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) {
        return EasyLocalization(
          supportedLocales: const [Locale('vi'), Locale('en'), Locale('ja')],
          path: 'assets/translations',
          saveLocale: true,
          startLocale: Locale(savedLanguage),
          fallbackLocale: const Locale('en'),
          child: const MyApp(),
        );
      },
    ),
  );
}