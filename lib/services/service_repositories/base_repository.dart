
import 'package:crypto_app/services/api_news/api_news.dart';

import '../../get_it_dependencies.dart';
import '../apis/api_client.dart';
class BaseRepository {
  late final ApiClient apis;
  late final ApiNews apinews;

  BaseRepository() {
    apis = getIt.get<ApiClient>();
    apinews = getIt.get<ApiNews>();
  }
}
