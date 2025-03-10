// ignore_for_file: depend_on_referenced_packages

import 'package:crypto_app/firebase_options.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:device_preview/device_preview.dart';
import 'package:crypto_app/app_common_data/common_data/global_variable.dart';
import 'package:crypto_app/screens/my_app/my_app.dart';
import 'package:crypto_app/services/apis/api_client.dart';
import 'package:crypto_app/services/app_dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() async {
  ///
  /// Init global variable
  ///
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  FirebaseAuth.instance.setSettings(appVerificationDisabledForTesting: true);
  MobileAds.instance.initialize();
  await EasyLocalization.ensureInitialized();
  await sp.init();
  await dotenv.load(fileName: ".env.development");
  apis = ApiClient(AppDio(), baseUrl: dotenv.env['BASE_URL']!);

  runApp(
    DevicePreview(
        enabled: false,
        builder: (context) {
          return EasyLocalization(
            supportedLocales: const [Locale('vi'), Locale('en'), Locale('ja')],
            path: 'assets/translations',
            startLocale: const Locale('vi'),
            fallbackLocale: const Locale('vi'),
            child: const MyApp(),
          );
        }),
  );
}
