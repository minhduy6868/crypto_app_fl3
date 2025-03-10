import 'package:flutter/material.dart';

import '../../../app_common_data/app_text_sytle.dart';
import '../../../shared_customization/widgets/texts/app_text.dart';

class PageView2Screen extends StatelessWidget {
  const PageView2Screen({super.key});

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
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: AppText(
                      'Khám phá thế giới âm nhạc cùng D_music\nNền tảng tuyệt vời để thưởng thức những giai điệu yêu thích. Với D_music',
                      style: AppTextStyle.bodyText.copyWith(fontSize: 14), color: Colors.white,),
                  ),
                ),
              ),

            ],
          ),
          Stack(
            alignment: Alignment.topRight,
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: Image.asset('assets/images/intro_2_nbgr.webp'),
              ),
              Padding(
                padding: EdgeInsets.all(78),
                child: Image.asset('assets/images/mmussic_notes2.gif'),
              ),

            ],
          )
        ],
      ),
    );
  }
}
