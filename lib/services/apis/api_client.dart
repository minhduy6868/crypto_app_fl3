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

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  ///
  /// Authentication
  ///
  @POST('/oauth/token')
  Future<ApiResponse<Credential>> login(@Body() Map<String, dynamic> body);

  @POST('/refresh_tokens')
  Future<ApiResponse<Credential>> refreshToken(
      @Body() Map<String, dynamic> body);

  @POST('/user/sign-up')
  Future<ApiResponse<UserModel>> register(@Body() Map<String, dynamic> body);

  @POST('/user/passwords/forgot')
  Future<ApiResponse<Credential>> forgotPassword(
      @Body() Map<String, dynamic> body);

  @POST('/user/passwords/reset')
  Future<ApiResponse<Credential>> resetPassword(
      @Body() Map<String, dynamic> body);

  @POST('/user/change_password')
  Future<ApiResponse<Credential>> changePassword(
      @Body() Map<String, dynamic> body);

  @GET('/user/confirmation')
  Future<ApiResponse> confirmAccount(@Query('confirmation_token') String token);

  @POST('/user/resend-mail')
  Future<ApiResponse<Credential>> resendMail(@Body() Map<String, dynamic> body);

  @POST('/oauth/revoke')
  Future<ApiResponse<Credential>> logout();

  @POST('/user/remove')
  Future<ApiResponse<Credential>> deleteUser(@Body() Map<String, dynamic> body);

  @POST('/user/request-remove')
  Future<ApiResponse<Credential>> requestRemove();

  ///
  /// User
  ///
  

  ///
  /// Coin
  ///

  @GET('coins/markets')
  Future<List<CoinMarket>> getListCoinMarket(
      @Query('vs_currency') String currency,
      @Query('sparkline') bool sparkline
      );

  @GET('coins/{coinId}')
  Future<dynamic> getCoinbyId(
      @Path('coinId') String? coinId,
      @Query('vs_currency') String currency,
      @Query('sparkline') bool sparkline
      );

  @GET('coins/{coinId}/ohlc')
  Future<dynamic> getChart(
      @Path('coinId') String? coinId,
      @Query('vs_currency') String currency,
      @Query('days') int days
      );
  
  
/// 
/// Exchange
/// 

  @GET('exchanges')
  Future<List<Exchange>> getListExchange(
      @Query('vs_currency') String currency,
      @Query('sparkline') bool sparkline
      );

  @GET('exchanges/{exchangeId}')
  Future<dynamic> getExchangeById(
      @Path('exchangeId') String? coinId,
      @Query('vs_currency') String currency,
      @Query('sparkline') bool sparkline
      );


}
