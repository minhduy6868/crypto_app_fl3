import 'package:crypto_app/models/coin/coin_market.dart';
import 'package:crypto_app/models/exchange/exchange/exchange.dart';
import 'package:dio/dio.dart';
import 'package:crypto_app/models/music_song/music_song_model.dart';
import 'package:crypto_app/services/models/api_music_response/api_music_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:crypto_app/models/user_model/user_model.dart';

import '../models/api_page_response/api_page_response.dart';
import '/models/credential/credential.dart';
import '/services/models/api_response/api_response.dart';

part 'api_news.g.dart';

@RestApi()
abstract class ApiNews {
  factory ApiNews(Dio dio, {String baseUrl}) = _ApiNews;

  ///
  /// News Crypto
  ///
  @GET('language={languageCode}&q={cate}')
  Future<dynamic> getListNews(
      @Path('languageCode') String? languageCode,
      @Path('cate') String? cate
      );
}
