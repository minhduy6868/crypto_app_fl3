import 'package:bloc/bloc.dart';
import 'package:crypto_app/models/coin/coin_market.dart';
import 'package:crypto_app/public_providers/config/bloc_base_state.dart';
import 'package:crypto_app/public_providers/config/update_bloc_base_state.dart';
import 'package:crypto_app/services/service_repositories/ai_reponsitory.dart';
import 'package:crypto_app/shared_customization/extensions/api_page_response_ext.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../app_common_data/common_data/global_variable.dart';
import '../../../models/chart/chart.dart';
import '../../../services/models/api_page_response/api_page_response.dart';
import '../../../services/service_repositories/coin_reponaitory.dart';
import '../../../shared_customization/data/screen_value.dart';

part 'detail_coin_screen_cubit.freezed.dart';
part 'detail_coin_screen_state.dart';

class DetailCoinScreenCubit extends Cubit<DetailCoinScreenState>
    with UpdateBlocBaseState<DetailCoinScreenState> {
  DetailCoinScreenCubit() : super(DetailCoinScreenState.initial());

  final apiMusic = CoinResponse(apis: apis);
  final aiResponse = AiResponse(); // Thêm AiResponse để gọi API AI


  Future<void> loadData(String coinId, int days) async {
    try {
      await getCoinbyId(coinId);
      await getChart(coinId, days);
    } catch (err) {
      print("Đã xảy ra lỗi khi khởi tạo dữ liệu");
    }
  }

  Future<void> getCoinbyId(String coinId) async {
    try {
      var response = await apiMusic.getCoinbyId(coinId);
      print("in ra response coinID là $response");
      print('API Response: $response');

      if (response != null) {
        emit(state.copyWith(coins: response));
      } else {
        emit(state.copyWith(errorMessage: 'Response is null'));
      }
    } catch (err) {
      print('Error: $err');
      emit(state.copyWith(errorMessage: err.toString()));
    }
  }

  Future<void> getChart(String coinId, int days) async {
    try {
      var response = await apiMusic.getChart(coinId, days);
      print("Chart Data: $response");

      if (response != null) {
        List<Chart> chartData = response.map((e) => Chart(
          time: e[0] as int?,
          open: e[1] as double?,
          high: e[2] as double?,
          low: e[3] as double?,
          close: e[4] as double?,
        )).toList();
        print(chartData);
        emit(state.copyWith(chartData: chartData));
      } else {
        emit(state.copyWith(errorMessage: 'Chart data is null'));
      }
    } catch (err) {
      print('Error: $err');
      emit(state.copyWith(errorMessage: err.toString()));
    }
  }

  Future<void> predictWithAI(String coinId) async {
    emit(state.copyWith(isLoadingAI: true, aiPrediction: null));

    try {
      // Lấy dữ liệu biểu đồ hiện tại
      if (state.chartData == null || state.chartData!.isEmpty) {
        emit(state.copyWith(errorMessage: "Không có dữ liệu biểu đồ để phân tích", isLoadingAI: false));
        return;
      }

      // Định dạng thời gian
      final dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss'); // Định dạng ngày giờ tháng năm

      // Chuyển dữ liệu biểu đồ thành chuỗi JSON để gửi cho AI
      final chartJson = state.chartData!
          .map((e) {
        final formattedTime = dateFormat.format(DateTime.fromMillisecondsSinceEpoch(e.time!)); // Chuyển đổi timestamp sang DateTime và định dạng
        return "Thời gian: $formattedTime, Open: ${e.open}, High: ${e.high}, Low: ${e.low}, Close: ${e.close}";
      })
          .join("\n");

      final prompt = """
    Tôi có dữ liệu biểu đồ giá của đồng tiền mã hóa $coinId:
    $chartJson
    Dự đoán xu hướng giá trong những ngày tới.
    """;

      final aiResult = await aiResponse.getGeminiResponse(prompt);
      print("in ra kết quả: $aiResult");
      emit(state.copyWith(aiPrediction: aiResult ?? "Không có kết quả từ AI", isLoadingAI: false));
    } catch (err) {
      emit(state.copyWith(errorMessage: err.toString(), isLoadingAI: false));
    }
  }
  // Cập nhật selectedDays
  void updateSelectedDays(int days) {
    emit(state.copyWith(selectedDays: days));
    getChart(state.coins?.id ?? '', days); // Gọi lại getChart với ngày mới
  }

  void toggleDescriptionExpanded() {
    emit(state.copyWith(isDescriptionExpanded: !state.isDescriptionExpanded));
  }

  @override
  void resetErrorMessage() => emit(state.copyWith(errorMessage: null));

  @override
  void resetStatus() => emit(state.copyWith(status: null));
}