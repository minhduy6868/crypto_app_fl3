
import '../../get_it_dependencies.dart';
import '../apis/api_client.dart';

class BaseRepository {
  late final ApiClient apis;
  BaseRepository() {
    apis = getIt.get<ApiClient>();
  }
}
