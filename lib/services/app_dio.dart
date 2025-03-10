import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:crypto_app/app_common_data/common_data/global_key_variable.dart';
import 'package:crypto_app/app_common_data/common_data/global_variable.dart';
import 'package:crypto_app/app_common_data/routes/app_routes.dart';
import 'package:crypto_app/generated/translations.g.dart';
import 'package:crypto_app/services/service_repositories/authentication_repository.dart';
import 'package:crypto_app/shared_customization/extensions/build_context.ext.dart';
import 'package:crypto_app/shared_customization/helpers/dialogs/dialog_helper.dart';
import 'package:crypto_app/shared_customization/helpers/utilizations/dio_parse_error.dart';

import '../models/credential/credential.dart';
import 'apis/api_client.dart';

class AppDio with DioMixin implements Dio {
  ApiClient? api;
  AppDio() {
    options = BaseOptions(
      connectTimeout: const Duration(seconds: 60),
      sendTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      headers: {
        "Content-Type": "application/json",
        "x-cg-demo-api-key": dotenv.env['API_KEY']
      },
    );
    if (kDebugMode) {
      interceptors.add(
        PrettyDioLogger(requestBody: true),
      );
    }

    interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        final String? token = sp.prefs.getString('access_token');
        if (token != null && token.isNotEmpty) {
          options.headers.putIfAbsent('Authorization', () => 'Bearer $token');
        }
        return handler.next(options);
      },
      onError: (error, handler) async {
        final String? rfToken = sp.prefs.getString('refresh_token');
        if (error.response != null) {
          if (error.requestOptions.headers.containsKey('Authorization')) {
            if (error.response?.data['error']['code'] == 'ERR.TOK0102') {
              Credential? newToken = await refreshToken(rfToken ?? "");
              if (newToken != null) {
                error.requestOptions.headers["Authorization"] =
                    'Bearer ${newToken.accessToken}';
                return handler.resolve(await fetch(error.requestOptions));
              }
            }
            if (error.response?.data['error']['code'] == 'ERR.TOK0101' ||
                error.response?.data['error']['code'] == 'ERR.TOK0103') {
              showErrorDialog(
                GlobalKeyVariable.navigatorState.currentContext!,
                title: tr(LocaleKeys.CommonData_Error),
                content: parseError(error),
              ).then((value) {
                sp.prefs.clear();
                GlobalKeyVariable.navigatorState.currentContext!
                    .pushNamed(Routes.loginScreen);
              });
            }
            handler.next(error);
          } else {
            handler.next(error);
          }
        }
      },
    ));

    httpClientAdapter = HttpClientAdapter();
  }

  Future<Credential?> refreshToken(String refreshToken) async {
    try {
      final AuthenticationRepository authenticationRepository =
          AuthenticationRepository(apis: apis);
      sp.clear();
      Credential credential =
          await authenticationRepository.refreshToken(refreshToken);
      await sp.setToken(
          credential.accessToken ?? "", credential.refreshToken ?? "");
      return credential;
    } catch (err) {
      sp.clear();
      return null;
    }
  }
}
