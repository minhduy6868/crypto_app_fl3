import 'package:bloc/bloc.dart';
import 'package:crypto_app/models/coin/coin_market.dart';
import 'package:crypto_app/public_providers/config/bloc_base_state.dart';
import 'package:crypto_app/public_providers/config/update_bloc_base_state.dart';
import 'package:crypto_app/shared_customization/extensions/api_page_response_ext.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../app_common_data/common_data/global_variable.dart';
import '../../../models/chart/chart.dart';
import '../../../models/music_song/music_song_model.dart';
import '../../../services/models/api_page_response/api_page_response.dart';
import '../../../services/service_repositories/coin_reponaitory.dart';
import '../../../shared_customization/data/screen_value.dart';
import '../../home_screen/cubit/home_screen_cubit.dart';


part 'detail_coin_screen_cubit.freezed.dart';
part 'detail_coin_screen_state.dart';

class DetailCoinScreenCubit extends Cubit<DetailCoinScreenState> with UpdateBlocBaseState<DetailCoinScreenState> {

  DetailCoinScreenCubit() : super(DetailCoinScreenState.initial());

  final apiMusic = CoinResponse(apis: apis);


  Future<void> loadData(String coinId, int days) async {
    try {
      await getCoinbyId(coinId);
      await getChart(coinId, days);
    } catch(err) {
      print("Đã xảy ra lỗi khi khởi tạo dữ liệu");
    }
  }

  Future<void> getCoinbyId(String coinId) async {
    try {
      var response = await apiMusic.getCoinbyId(coinId);
      print("in ra response coinID là $response");
      print('API Response: $response');

      if (response != null) {
        // Here, update the state with the new list
        emit(state.copyWith(coins: response));
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

  // Add the getChart method
  Future<void> getChart(String coinId, int days) async {
    try {
      var response = await apiMusic.getChart(coinId, days);
      print("Chart Data: $response");

      if (response != null) {
        // Mapping the chart data to a list of Chart models
        List<Chart> chartData = response.map((e) => Chart(
          time: e[0] as int?,
          open: e[1] as double?,
          high: e[2] as double?,
          low: e[3] as double?,
          close: e[4] as double?,
        )).toList();
        print(chartData);
        // Update the state with chart data
        emit(state.copyWith(chartData: chartData));
      } else {
        // If no chart data is returned, emit an error message
        emit(state.copyWith(errorMessage: 'Chart data is null'));
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
