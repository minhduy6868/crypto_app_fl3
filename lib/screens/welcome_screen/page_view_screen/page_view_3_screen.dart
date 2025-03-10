import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../app_common_data/app_text_sytle.dart';
import '../../../shared_customization/widgets/texts/app_text.dart';

class PageView3Screen extends StatelessWidget {
  const PageView3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.orange
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: AppText('Khám phá ngay!!!',
                    style: AppTextStyle.titleText.copyWith(fontSize: 24), color: Colors.white,),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(),
            child: Image.asset('assets/images/battle.gif'),
          ),
          Padding(
            padding: EdgeInsets.only(left: 87, right: 87),
            child: Image.asset('assets/images/music_note4.gif'),
          )
        ],
      ),
    );
  }
}
