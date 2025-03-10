import 'package:flutter/material.dart';

extension ScrollControllerExt on ScrollController {
  bool get loadMorePointPassed =>
      hasClients &&
      position.maxScrollExtent > 0 &&
      offset >= position.maxScrollExtent - 40;
}
