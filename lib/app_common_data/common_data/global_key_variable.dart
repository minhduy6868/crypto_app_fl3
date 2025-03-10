import 'package:flutter/material.dart';

class GlobalKeyVariable {
  GlobalKeyVariable._();

  static final GlobalKey<ScaffoldMessengerState> scaffoldMessengerState =
      GlobalKey<ScaffoldMessengerState>();
  static final GlobalKey<NavigatorState> navigatorState =
      GlobalKey<NavigatorState>();
}
