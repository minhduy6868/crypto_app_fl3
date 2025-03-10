import 'package:flutter/material.dart';

enum MediaOption { file, photo, video, location }

extension MediaOptionExt on MediaOption? {
  String get label => {}[this]!;
  IconData get icon => {}[this]!;
  Color get color => {}[this]!;
}
