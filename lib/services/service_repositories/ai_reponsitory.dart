import 'package:dio/dio.dart';

class AiResponse {
  final Dio _dio;
  static const String _apiKey = "AIzaSyD2WKCXbEywgABE8QhiJUOwqyMqES5STCA"; // Thay bằng API Key của bạn
  static const String _baseUrl = "https://generativelanguage.googleapis.com/v1beta";

  AiResponse() : _dio = Dio(BaseOptions(baseUrl: _baseUrl));

  Future<String?> getGeminiResponse(String prompt) async {
    try {
      final response = await _dio.post(
        '/models/gemini-2.0-flash:generateContent?key=$_apiKey', // Đúng model AI
        data: {
          "contents": [
            {"parts": [{"text": prompt}]}
          ]
        },
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (response.statusCode == 200 && response.data != null) {
        final data = response.data;
        if (data.containsKey('candidates') && data['candidates'].isNotEmpty) {
          return data['candidates'][0]['content']['parts'][0]['text'] ?? 'Không có phản hồi';
        }
      }
      return 'Không có kết quả từ AI';
    } catch (e) {
      print('Lỗi khi gọi API Gemini: $e');
      return null;
    }
  }
}
