
import 'package:crypto_app/screens/wallet_screen/wallet_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../generated/translations.g.dart';
import '../../screens/Account_screen/Account_screen.dart';
import '../../screens/conversation_screen/conversation_screen.dart';
import '../../screens/home_screen/home_screen.dart';
import '../../screens/list_news_screen/list_new_screen.dart';
import '../../shared_customization/helpers/dialogs/dialog_helper.dart';
import '../../shared_customization/widgets/buttons/app_icon_button.dart';
import '../app_colors.dart';
import '../routes/app_routes.dart';
enum MainTabs {
  Home,
 Wallet,
 News,
 Account,
}
extension MainTabsExt on MainTabs {
  String get title => {
    MainTabs.Home: "Home",
    MainTabs.Wallet: 'Wallet',
    MainTabs.News: "News",
    MainTabs.Account: "Account",
  }[this]!;

  IconData get icon => {
    MainTabs.Home: CupertinoIcons.house_alt,
    MainTabs.Wallet: Icons.explore_outlined,
    MainTabs.News: CupertinoIcons.news,
    MainTabs.Account: Icons.account_circle_outlined,
  }[this]!;

  IconData get activeIcon => {
    MainTabs.Home: CupertinoIcons.house_alt_fill,
    MainTabs.Wallet: Icons.explore,
    MainTabs.News: CupertinoIcons.news_solid,
    MainTabs.Account: Icons.account_circle_sharp,
  }[this]!;

  Widget get widget => {
    MainTabs.Home: const HomeScreen(),
    MainTabs.Wallet: const WalletScreen(),
    MainTabs.News: const ListNewsScreen(),
    MainTabs.Account: const AccountScreen(),
  }[this]!;

  List<Widget> actions(BuildContext context) => {
    MainTabs.Home: <Widget>[
      // AppIconButton(
      //   onPressed: () {
      //     final House house = context.read<HouseItemComponent>().house.id;// Lấy thông tin ngôi nhà từ một nguồn nào đó, ví dụ: từ một biến hoặc từ một danh sách ngôi nhà.
      //     if (house != null) {
      //       final String? houseId = house.id;
      //       context.pushNamed(
      //         Routes.listWalletcreen,
      //         arguments: ListWalletcreenArgs(
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
    MainTabs.Wallet: <Widget>[],
    MainTabs.News: <Widget>[
      // AppIconButton(
      //   onPressed: () {
      //     if (context
      //         .read<AppNewsCubit>()
      //         .state
      //         .unreadNewsCount ==
      //         0)
      //       print("ấn nút đọc thông báo");
      //     showConfirmDialog(
      //       context,
      //       content: tr(LocaleKeys
      //           .News_MarkReadAllNewsConfirmation),
      //       onAccept: () {
      //         context.read<ListNewssScreenCubit>().markReadAll();
      //         context.read<AppNewsCubit>().updateState(
      //                 (s) => s.copyWith(unreadNewsCount: 0));
      //       },
      //     );
      //   },
      //   icon: Icons.done_all_rounded,
      //   color: AppColors.white,
      //   padding: const EdgeInsets.only(right: 16),
      // )
    ],
    MainTabs.Account: <Widget>[],
  }[this]!;
}
