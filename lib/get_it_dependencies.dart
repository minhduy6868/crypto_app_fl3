import 'package:crypto_app/services/app_dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:crypto_app/services/apis/api_client.dart';
import '../../get_it_dependencies.dart';
final getIt = GetIt.instance;

Future<void> initGetItDependencies() async {
  // ///
  // /// Talker
  // ///
  // getIt.registerSingleton<Talker>(TalkerFlutter.init());
  //
  // ///
  // /// Storages
  // ///
  // var storages = getIt.registerSingleton<Storages>(Storages());
  // await storages.init();

  ///
  /// Dio & Api client
  ///
  var appDio = getIt.registerSingleton<AppDio>(AppDio());
  var apiClient = getIt.registerSingleton<ApiClient>(
      ApiClient(appDio, baseUrl: dotenv.env['BASE_URL']!));
  appDio.api = apiClient;
}
