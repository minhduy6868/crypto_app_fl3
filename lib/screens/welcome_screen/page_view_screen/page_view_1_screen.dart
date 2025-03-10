import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:crypto_app/app_common_data/app_text_sytle.dart';
import 'package:crypto_app/shared_customization/widgets/texts/app_text.dart';

class PageView1Screen extends StatelessWidget {
  const PageView1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.tealAccent, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText('Chào mừng đến với',
                style: AppTextStyle.bodyText.copyWith(fontSize: 24), color: Colors.black,),
                AppText('D-music',
                  style: AppTextStyle.titleText.copyWith(fontSize: 30, color: Colors.teal.shade800), ),
              ],
            ),
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Image.asset('assets/images/girl_music.gif'),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Image.asset('assets/images/music_not_nobackground.gif'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
