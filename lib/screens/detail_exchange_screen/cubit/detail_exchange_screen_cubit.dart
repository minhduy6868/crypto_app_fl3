import 'package:bloc/bloc.dart';
import 'package:crypto_app/models/coin/coin_market.dart';
import 'package:crypto_app/public_providers/config/bloc_base_state.dart';
import 'package:crypto_app/public_providers/config/update_bloc_base_state.dart';
import 'package:crypto_app/shared_customization/extensions/api_page_response_ext.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../app_common_data/common_data/global_variable.dart';
import '../../../models/chart/chart.dart';
import '../../../models/exchange/exchange/exchange.dart';
import '../../../models/exchange/ticker_exchange/ticker_exchange.dart';
import '../../../models/music_song/music_song_model.dart';
import '../../../services/models/api_page_response/api_page_response.dart';
import '../../../services/service_repositories/coin_reponaitory.dart';
import '../../../shared_customization/data/screen_value.dart';
import '../../home_screen/cubit/home_screen_cubit.dart';


part 'detail_exchange_screen_cubit.freezed.dart';
part 'detail_exchange_screen_state.dart';

class DetailExchangeScreenCubit extends Cubit<DetailExchangeScreenState> with UpdateBlocBaseState<DetailExchangeScreenState> {

  DetailExchangeScreenCubit() : super(DetailExchangeScreenState.initial());

  final apiMusic = CoinResponse(apis: apis);


  Future<void> getExchangebyId(String exchangeId) async {
    try {
      var response = await apiMusic.getExchangeById(exchangeId);
      print("in ra response exchangeID là $response");

      if (response != null) {
        // Here, update the state with the new list
        emit(state.copyWith(exchange: response));
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
