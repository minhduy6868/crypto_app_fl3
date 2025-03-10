import 'package:crypto_app/app_common_data/routes/app_routes.dart';
import 'package:crypto_app/shared_customization/extensions/build_context.ext.dart';
import 'package:crypto_app/shared_customization/widgets/buttons/app_button.dart';
import 'package:crypto_app/shared_customization/widgets/texts/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              child: Stack(
                children: [
                  UserAccountsDrawerHeader(
                    currentAccountPicture: CircleAvatar(
                      radius: 5,
                      backgroundImage: AssetImage('assets/images/avatar_placeholder.png'),
                    ),
                    currentAccountPictureSize: Size(50, 50),
                      accountName: AppText(
                        "Nguyễn Duy"
                      ),
                      accountEmail: AppText(
                        'nmduy1412@gmail.com'
                      ),
                    decoration: BoxDecoration()
                  )
                ],
              )
          ),
          AppButton(
            child: AppText('Log out'),
              onPressed: () {
              Navigator.popAndPushNamed(context, Routes.loginScreen);
          })
        ],
      ),
    );
  }
}
