import 'package:bloc/bloc.dart';
import 'package:crypto_app/models/coin/coin_market.dart';
import 'package:crypto_app/public_providers/config/bloc_base_state.dart';
import 'package:crypto_app/public_providers/config/update_bloc_base_state.dart';
import 'package:crypto_app/shared_customization/extensions/api_page_response_ext.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app_common_data/common_data/global_variable.dart';
import '../../../models/exchange/exchange/exchange.dart';
import '../../../models/music_song/music_song_model.dart';
import '../../../services/models/api_page_response/api_page_response.dart';
import '../../../services/service_repositories/coin_reponaitory.dart';
import '../../../shared_customization/data/screen_value.dart';

part 'home_screen_cubit.freezed.dart';
part 'home_screen_state.dart';
class HomeScreenCubit extends Cubit<HomeScreenState> with UpdateBlocBaseState<HomeScreenState> {

  HomeScreenCubit() : super(HomeScreenState.initial());

  final apiMusic = CoinResponse(apis: apis);

  Future<void> loadData() async {
    getListCoinMarket();
    getListExchange();
  }


  Future<void> getListExchange() async {
    try {
      var response = await apiMusic.getListExchange();
      print("in ra response Exchang $response");


      if (response != null) {
        // Here, update the state with the new list
        emit(state.copyWith(listExchange: response));
      } else {
        // If no data is returned, emit an error message
        emit(state.copyWith(errorMessage: 'Response is null'));
      }
    } catch (err) {
      print('Error to call getlistExchange: $err');
      // Emit the error message
      emit(state.copyWith(errorMessage: err.toString()));
    }
  }


  Future<void> getListCoinMarket() async {
    try {
      var response = await apiMusic.getListCoinMarket();
      print("in ra response $response");
      print('API Response: $response');

      if (response != null) {
        // Here, update the state with the new list
        emit(state.copyWith(listcoinMarket: response));
      } else {
        // If no data is returned, emit an error message
        emit(state.copyWith(errorMessage: 'Response is null'));
      }
    } catch (err) {
      print('Error: $err');
      // Emit the error message
      emit(state.copyWith(errorMessage: err.toString()));
    }
  }

  @override
  void resetErrorMessage() => emit(state.copyWith(errorMessage: null));

  @override
  void resetStatus() => emit(state.copyWith(status: null));
}
