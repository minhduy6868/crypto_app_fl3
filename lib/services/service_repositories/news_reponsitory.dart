

import 'package:crypto_app/models/news_crypto/news_crypto.dart';

import '../apis/api_client.dart';

class NewsReponsitory {
  final ApiClient apinews;

  const NewsReponsitory({required this.apinews});

  Future<List<NewsCrypto>?> getListNews(String? language, String? cate) async {
    try {
      final response = await apinews.getListNews(language, cate);
      print("API Response: $response");

      if (response == null || response['results'] == null) {
        print('No data available');
        return null;
      }

      final List<dynamic> rawList = response['results'];
      final List<NewsCrypto> newsList = rawList
          .map((item) => NewsCrypto.fromJson(item as Map<String, dynamic>))
          .toList();

      return newsList;
    } catch (e) {
      print('Error occurred while fetching news data: $e');
      return null;
    }
  }



}