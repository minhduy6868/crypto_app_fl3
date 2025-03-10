import 'package:crypto_app/models/coin/coin_market.dart';
import 'package:crypto_app/models/exchange/exchange/exchange.dart';
import 'package:crypto_app/services/apis/api_client.dart';

class CoinResponse {
  final ApiClient apis;

  const CoinResponse({required this.apis});

  Future<List<Exchange>?> getListExchange() async {
    try {
      // Gọi API để lấy dữ liệu
      final response = await apis.getListExchange('usd', true);
      print("API Response: $response");

      // Kiểm tra nếu response là null
      if (response == null) {
        print('No data available');
        return null;
      }
      return response;
    } catch (e) {
      // In ra lỗi chi tiết nếu có
      print('Error occurred while fetching coin market data: $e');
      return null;
    }
  }

  /// Fetch the list of coins from the API
  Future<List<CoinMarket>?> getListCoinMarket() async {
    try {
      // Gọi API để lấy dữ liệu
      final response = await apis.getListCoinMarket('usd', true);
      print("API Response: $response");

      // Kiểm tra nếu response là null
      if (response == null) {
        print('No data available');
        return null;
      }
        return response;
    } catch (e) {
      // In ra lỗi chi tiết nếu có
      print('Error occurred while fetching coin market data: $e');
      return null;
    }
  }

  Future<CoinMarket?> getCoinbyId(String coinId) async {
    try {
      // Gọi API để lấy dữ liệu coin theo ID
      final response = await apis.getCoinbyId(coinId, 'usd', true);
      print("API Response getCoinbyID: $response");

      // Kiểm tra nếu response là null
      if (response == null || response is! Map) {
        print('Invalid or no data available');
        return null;
      }

      // Lấy dữ liệu từ response map
      var id = response['id'];
      var symbol = response['symbol'];
      var name = response['name'];
      var currentPrice = response['market_data']['current_price']['usd'];
      var image = response['image']['large'];
      var description = response['description']['en'];

      // Kiểm tra nếu dữ liệu cần thiết có trong response
      if (id == null ) {
        print('Missing required data fields in the response');
        return null;
      }

      // Trả về CoinMarket với các dữ liệu cần thiết
      return CoinMarket(
        id: id,
        symbol: symbol,
        name: name,
        currentPrice: currentPrice,
        image: image,
        description: description
      );
    } catch (e) {
      // In ra lỗi chi tiết nếu có
      print('Error occurred while fetching coin by ID: $e');
      return null;
    }
  }

  Future<Exchange?> getExchangeById(String exchangeId) async {
    try {
      // Gọi API để lấy dữ liệu sàn giao dịch theo ID
      final response = await apis.getExchangeById(exchangeId, 'usd', true);
      print("API Response getExchangeById: $response");

      // Kiểm tra dữ liệu trả về có hợp lệ không
      if (response == null) {
        print('Response is null');
        return null;
      }

      if (response is! Map<String, dynamic>) {
        print('Invalid data format received');
        return null;
      }

      // Chuyển đổi response thành đối tượng Exchange
      return Exchange.fromJson(response);
    } catch (e, stackTrace) {
      // Log lỗi chi tiết hơn
      print('Error fetching exchange by ID: $e');
      print('StackTrace: $stackTrace');
      return null;
    }
  }


  Future<List<dynamic>?> getChart(String coinId, int days) async {
    try {
      final response = await apis.getChart(coinId, 'usd', days);
      print("Chart Data: $response");

      // Kiểm tra nếu response là null
      if (response == null) {
        print('No chart data available');
        return null;
      }

      // Trả về dữ liệu chart
      return response;
    } catch (e) {
      // In ra lỗi chi tiết nếu có
      print('Error occurred while fetching chart data: $e');
      return null;
    }
  }

}
