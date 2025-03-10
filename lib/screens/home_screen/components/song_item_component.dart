import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:crypto_app/models/music_song/music_song_model.dart';
import 'package:crypto_app/shared_customization/widgets/app_container.dart';

import '../../../app_common_data/app_text_sytle.dart';
import '../../../shared_customization/widgets/texts/app_text.dart';

class SongComp extends StatelessWidget {
  const SongComp({super.key, required this.song});
  final MusicSong song;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Xử lý sự kiện khi người dùng nhấn vào toàn bộ SongComp
      },
      child: AppContainer(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        color: CupertinoColors.white,
        child: Row(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                      image: NetworkImage('${song.image}'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // Xử lý sự kiện khi người dùng nhấn vào nút Play
                  },
                  icon: Icon(Icons.play_circle_filled_outlined),
                ),
              ],
            ),
            SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    song.title,
                    style: AppTextStyle.titleText,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  AppText(
                    song.artist,
                    style: AppTextStyle.defaultTextStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
