import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
class StringHelper {
  //check am or pm
  static bool isMorning() {
    DateTime now = DateTime.now();
    return now.hour < 12;
  }
  static String removeSignAndSpaceVietnameseString(String str) {
    List<String> ecode = [
      'à',
      'á',
      'ạ',
      'ả',
      'ã',
      'â',
      'ầ',
      'ấ',
      'ậ',
      'ẩ',
      'ẫ',
      'ă',
      'ằ',
      'ắ',
      'ặ',
      'ẳ',
      'ẵ',
      'è',
      'é',
      'ẹ',
      'ẻ',
      'ẽ',
      'ê',
      'ề',
      'ế',
      'ệ',
      'ể',
      'ễ',
      'ì',
      'í',
      'ị',
      'ỉ',
      'ĩ',
      'ò',
      'ó',
      'ọ',
      'ỏ',
      'õ',
      'ô',
      'ồ',
      'ố',
      'ộ',
      'ổ',
      'ỗ',
      'ơ',
      'ờ',
      'ớ',
      'ợ',
      'ở',
      'ỡ',
      'ù',
      'ú',
      'ụ',
      'ủ',
      'ũ',
      'ư',
      'ừ',
      'ứ',
      'ự',
      'ử',
      'ữ',
      'ỳ',
      'ý',
      'ỵ',
      'ỷ',
      'ỹ',
      'đ',
      'Đ',
      ' '
    ];
    List<String> dcode = [
      'a',
      'a',
      'a',
      'a',
      'a',
      'a',
      'a',
      'a',
      'a',
      'a',
      'a',
      'a',
      'a',
      'a',
      'a',
      'a',
      'a',
      'e',
      'e',
      'e',
      'e',
      'e',
      'e',
      'e',
      'e',
      'e',
      'e',
      'e',
      'i',
      'i',
      'i',
      'i',
      'i',
      'o',
      'o',
      'o',
      'o',
      'o',
      'o',
      'o',
      'o',
      'o',
      'o',
      'o',
      'o',
      'o',
      'o',
      'o',
      'o',
      'o',
      'u',
      'u',
      'u',
      'u',
      'u',
      'u',
      'u',
      'u',
      'u',
      'u',
      'u',
      'y',
      'y',
      'y',
      'y',
      'y',
      'd',
      'đ',
      ''
    ];
    Map<String, String> map = Map.fromIterables(ecode, dcode);
    return map.entries.fold(str, (prev, e) => prev.replaceAll(e.key, e.value));
  }

  static String removeSignVietnameseString(String str) {
    List<String> ecode = [
      'à',
      'á',
      'ạ',
      'ả',
      'ã',
      'â',
      'ầ',
      'ấ',
      'ậ',
      'ẩ',
      'ẫ',
      'ă',
      'ằ',
      'ắ',
      'ặ',
      'ẳ',
      'ẵ',
      'è',
      'é',
      'ẹ',
      'ẻ',
      'ẽ',
      'ê',
      'ề',
      'ế',
      'ệ',
      'ể',
      'ễ',
      'ì',
      'í',
      'ị',
      'ỉ',
      'ĩ',
      'ò',
      'ó',
      'ọ',
      'ỏ',
      'õ',
      'ô',
      'ồ',
      'ố',
      'ộ',
      'ổ',
      'ỗ',
      'ơ',
      'ờ',
      'ớ',
      'ợ',
      'ở',
      'ỡ',
      'ù',
      'ú',
      'ụ',
      'ủ',
      'ũ',
      'ư',
      'ừ',
      'ứ',
      'ự',
      'ử',
      'ữ',
      'ỳ',
      'ý',
      'ỵ',
      'ỷ',
      'ỹ',
      'đ',
      'Đ',
    ];
    List<String> dcode = [
      'a',
      'a',
      'a',
      'a',
      'a',
      'a',
      'a',
      'a',
      'a',
      'a',
      'a',
      'a',
      'a',
      'a',
      'a',
      'a',
      'a',
      'e',
      'e',
      'e',
      'e',
      'e',
      'e',
      'e',
      'e',
      'e',
      'e',
      'e',
      'i',
      'i',
      'i',
      'i',
      'i',
      'o',
      'o',
      'o',
      'o',
      'o',
      'o',
      'o',
      'o',
      'o',
      'o',
      'o',
      'o',
      'o',
      'o',
      'o',
      'o',
      'o',
      'u',
      'u',
      'u',
      'u',
      'u',
      'u',
      'u',
      'u',
      'u',
      'u',
      'u',
      'y',
      'y',
      'y',
      'y',
      'y',
      'd',
      'đ',
    ];
    Map<String, String> map = Map.fromIterables(ecode, dcode);
    return map.entries.fold(str, (prev, e) => prev.replaceAll(e.key, e.value));
  }

  Future<String?> uploadImageToCloudinary(File imageFile) async {
    const String cloudName = 'dy5vntutj'; // Thay thế bằng cloud name của bạn
    const String uploadPreset = 'fsiiigpo'; // Tạo preset không cần xác thực trên Cloudinary

    final String uploadUrl = 'https://api.cloudinary.com/v1_1/$cloudName/image/upload';

    try {
      final request = http.MultipartRequest('POST', Uri.parse(uploadUrl))
        ..fields['upload_preset'] = uploadPreset
        ..files.add(await http.MultipartFile.fromPath('file', imageFile.path));

      final response = await request.send();

      if (response.statusCode == 200) {
        final responseData = await response.stream.bytesToString();
        final jsonResponse = json.decode(responseData);
        return jsonResponse['secure_url']; // Trả về URL ảnh đã upload
      } else {
        throw Exception("Upload failed: ${response.statusCode}");
      }
    } catch (e) {
      print("Error uploading image: $e");
      return null;
    }
  }


  String formatAIPrediction(String prediction) {
    // Tách các dòng
    final lines = prediction.trim().split('\n');

    final buffer = StringBuffer();

    for (var line in lines) {
      final trimmed = line.trim();

      // Bỏ qua dòng trống
      if (trimmed.isEmpty) continue;

      // Nếu là tiêu đề dạng "**Tiêu đề:**"
      if (trimmed.startsWith('**') && trimmed.endsWith(':**')) {
        buffer.writeln('\n${trimmed}\n');
      }
      // Nếu là dòng gạch đầu dòng bắt đầu bằng '*'
      else if (trimmed.startsWith('*')) {
        buffer.writeln('• ${trimmed.substring(1).trim()}');
      }
      // Nếu là đoạn văn thông thường
      else {
        buffer.writeln(trimmed);
      }
    }

    return buffer.toString().trim();
  }

}
