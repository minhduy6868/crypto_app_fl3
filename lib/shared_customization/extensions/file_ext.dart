import 'dart:io';

import 'package:dio/dio.dart';

extension FileExt on File? {
  String get name =>
      this == null ? '' : this!.path.split(Platform.pathSeparator).last;

  Future<MultipartFile?> get toMultipartFile async {
    return this == null
        ? null
        : MultipartFile.fromFile(this!.path, filename: this!.path);
  }
}
