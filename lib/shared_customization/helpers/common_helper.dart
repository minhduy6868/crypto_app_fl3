// ignore_for_file: depend_on_referenced_packages

import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart' as dio;
import 'package:path/path.dart' show basename;
import 'package:path_provider/path_provider.dart';
import 'package:http_parser/http_parser.dart';

import '/shared_customization/extensions/string_ext.dart';

class CommonHelper {
  CommonHelper._();

  static Future<File> downloadFile(String url, String filename) async {
    String downloadDirectory = '';
    if (Platform.isAndroid) {
      final externalStorageFolder = await getExternalStorageDirectory();
      if (externalStorageFolder != null) {
        downloadDirectory = externalStorageFolder.path;
      }
    } else {
      final downloadFolder = await getApplicationDocumentsDirectory();
      downloadDirectory = downloadFolder.path;
    }

    http.Client client = http.Client();
    var req = await client.get(Uri.parse(url));
    var bytes = req.bodyBytes;

    File file = File('$downloadDirectory/$filename');

    await file.writeAsBytes(bytes);
    return file;
  }

  static Future<List<dio.MultipartFile>> processListFile(
      List<File> filesToProcess) async {
    List<dio.MultipartFile> processedFiles =
        await Future.wait(filesToProcess.map((file) async {
      String name = basename(file.path);
      Uri? parsedName = Uri.tryParse(name);
      String? imageNameDecoded = parsedName != null
          ? Uri.decodeFull(parsedName.toString()).trim()
          : name.trim();
      return await dio.MultipartFile.fromFile(
        file.path,
        filename: imageNameDecoded,
        contentType: file.path.isImage ? MediaType('image', 'jpg') : null,
      );
    }).toList());
    return processedFiles;
  }
}
