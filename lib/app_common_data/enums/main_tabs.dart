import 'package:crypto_app/screens/wallet_screen/wallet_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../generated/translations.g.dart';
import '../../public_providers/providers/app_notification_cubit/app_notification_cubit.dart';
import '../../screens/account_screen/account_screen.dart';
import '../../screens/conversation_screen/conversation_screen.dart';
import '../../screens/home_screen/home_screen.dart';
import '../../screens/notification_screen/notification_screen.dart';
import '../../shared_customization/helpers/dialogs/dialog_helper.dart';
import '../../shared_customization/widgets/buttons/app_icon_button.dart';
import '../app_colors.dart';
import '../routes/app_routes.dart';
enum MainTabs {
  home,
  conversations,
  notification,
  account,
}
extension MainTabsExt on MainTabs {
  String get title => {
    MainTabs.home: "home",
    MainTabs.conversations: 'conversation',
    MainTabs.notification: "notification",
    MainTabs.account: "account",
  }[this]!;

  IconData get icon => {
    MainTabs.home: CupertinoIcons.house_alt,
    MainTabs.conversations: Icons.explore_outlined,
    MainTabs.notification: CupertinoIcons.heart,
    MainTabs.account: Icons.account_circle_outlined,
  }[this]!;

  IconData get activeIcon => {
    MainTabs.home: CupertinoIcons.house_alt_fill,
    MainTabs.conversations: Icons.explore,
    MainTabs.notification: CupertinoIcons.heart_circle_fill,
    MainTabs.account: Icons.account_circle_sharp,
  }[this]!;

  Widget get widget => {
    MainTabs.home: const HomeScreen(),
    MainTabs.conversations: const WalletScreen(),
    MainTabs.notification: const NotificationScreen(),
    MainTabs.account: const AccountScreen(),
  }[this]!;

  List<Widget> actions(BuildContext context) => {
    MainTabs.home: <Widget>[
      // AppIconButton(
      //   onPressed: () {
      //     final House house = context.read<HouseItemComponent>().house.id;// Lấy thông tin ngôi nhà từ một nguồn nào đó, ví dụ: từ một biến hoặc từ một danh sách ngôi nhà.
      //     if (house != null) {
      //       final String? houseId = house.id;
      //       context.pushNamed(
      //         Routes.listConversationScreen,
      //         arguments: ListConversationScreenArgs(
      //           houseId: houseId,
      //           houseName: house.name ?? "",
      //         ),
      //       );
      //     } else {
      //       // Xử lý trường hợp không tìm thấy thông tin về ngôi nhà.
      //     }
      //   },
      //   icon: CupertinoIcons.chat_bubble_2_fill,
      // )

    ],
    MainTabs.conversations: <Widget>[],
    MainTabs.notification: <Widget>[
      // AppIconButton(
      //   onPressed: () {
      //     if (context
      //         .read<AppNotificationCubit>()
      //         .state
      //         .unreadNotificationCount ==
      //         0)
      //       print("ấn nút đọc thông báo");
      //     showConfirmDialog(
      //       context,
      //       content: tr(LocaleKeys
      //           .Notification_MarkReadAllNotificationConfirmation),
      //       onAccept: () {
      //         context.read<ListNotificationsScreenCubit>().markReadAll();
      //         context.read<AppNotificationCubit>().updateState(
      //                 (s) => s.copyWith(unreadNotificationCount: 0));
      //       },
      //     );
      //   },
      //   icon: Icons.done_all_rounded,
      //   color: AppColors.white,
      //   padding: const EdgeInsets.only(right: 16),
      // )
    ],
    MainTabs.account: <Widget>[],
  }[this]!;
}
