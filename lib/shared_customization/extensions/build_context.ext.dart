import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../app_common_data/common_data/global_variable.dart';
import '../../app_common_data/routes/app_routes.dart';
import '../../public_providers/providers/app_notification_cubit/app_notification_cubit.dart';
import '../../public_providers/providers/app_user_cubit/app_user_cubit.dart';

extension BuildContextExt on BuildContext {
  ///
  /// MediaQuery
  ///
  Size get screenSize => MediaQuery.of(this).size;
  EdgeInsets get viewInset => MediaQuery.of(this).viewInsets;
  EdgeInsets get viewPadding => MediaQuery.of(this).padding;
  double get devicePixelRatio => MediaQuery.of(this).devicePixelRatio;
  Orientation get orientation => MediaQuery.of(this).orientation;
  double get textScaleFactor => MediaQuery.of(this).textScaleFactor;
  bool get alwaysUse24HourFormat => MediaQuery.of(this).alwaysUse24HourFormat;

  ///
  /// Localizations
  ///
  Locale get currentLocale => locale;
  String get currentLanguageCode => currentLocale.languageCode;


  ///
  /// Clipboard
  ///
  Future<void> copyToClipboard(String text) =>
      Clipboard.setData(ClipboardData(text: text));


  ///
  /// ThemeData
  ///
  ThemeData get theme => Theme.of(this);

  ///
  /// Focus manager
  ///
  void unfocus() => FocusScope.of(this).unfocus();

  ///
  /// Drawer
  ///
  bool get hasDrawer => Scaffold.of(this).hasDrawer;
  void openDrawer() => hasDrawer ? Scaffold.of(this).openDrawer() : null;
  void closeDrawer() => hasDrawer ? Scaffold.of(this).closeDrawer() : null;

  ///
  /// Navigator
  ///
  bool get canPop => Navigator.of(this).canPop();
  // Pop
  void pop<T extends Object?>([T? result]) => Navigator.of(this).pop(result);
  // Push route
  Future<T?> pushRoute<T extends Object?>(
      Widget Function(BuildContext context) builder) =>
      Navigator.of(this).push(MaterialPageRoute(builder: builder));
  // Push named
  Future<T?> pushNamed<T extends Object?>(String routeName,
      {Object? arguments}) =>
      Navigator.of(this).pushNamed<T>(routeName, arguments: arguments);
  // Pop and push named
  Future<T?> popAndPushNamed<T extends Object?, TO extends Object?>(
      String routeName,
      {TO? result,
        Object? arguments}) =>
      Navigator.of(this).popAndPushNamed<T, TO>(routeName,
          result: result, arguments: arguments);

  ///
  /// ModalRoute
  ///
  ModalRoute<dynamic>? get modalRoute => ModalRoute.of(this);
  T? getArguments<T>() =>
      modalRoute == null ? null : ModalRoute.of(this)!.settings.arguments as T;

//   ///
//   /// App data
//   ///
//   Future<void> clearAppData() async {
//     read<AppUserCubit>().cleanUserData();
//     read<AppNotificationCubit>().clearData();
//     await sp.clear();
//   }
//
//   ///
//   /// Navigate notification
//   ///
//   void navigateNotification(NotificationItem notiItem) {
//     String? routeName;
//     Object? args;
//     switch (notiItem.type) {
//       case NotificationType.ADMIN:
//         break;
//       case NotificationType.PAYMENT:
//         routeName = Routes.detailInvoiceScreen;
//         args = DetailInvoiceScreenArgs(
//             invoiceId: notiItem.objectableId!, );
//         break;
//       case NotificationType.MESSAGE:
//         break;
//       case NotificationType.CONVERSATION:
//         break;
//       default:
//     }
//     if (routeName.isNotEmptyOrNull) {
//       pushNamed(routeName!, arguments: args);
//     }
//   }
}
