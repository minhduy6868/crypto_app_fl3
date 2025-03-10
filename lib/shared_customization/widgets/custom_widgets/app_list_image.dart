import 'package:flutter/material.dart';

import '/app_common_data/app_colors.dart';
import '/app_common_data/common_data/global_variable.dart';
import '/models/file_content/file_content.dart';
import '/shared_customization/extensions/string_ext.dart';
import '../app_container.dart';
import 'app_image.dart';
import 'screens/app_image_full_screen.dart';
import 'screens/app_video_view_screen.dart';
import '../texts/app_text.dart';

class AppListImage extends StatelessWidget {
  final List<FileContent> files;
  final int amountOfImageShow;
  final double borderRadius;
  final double spaceXY;
  final void Function(int index)? onTap;
  const AppListImage({
    super.key,
    required this.files,
    this.amountOfImageShow = 3,
    this.spaceXY = 4,
    this.borderRadius = BORDER_RADIUS_VALUE,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = constraints.maxWidth / 3.07;
        return Wrap(
          alignment: WrapAlignment.end,
          runSpacing: spaceXY,
          spacing: spaceXY,
          children: [
            for (int i = 0; i < files.length; i++)
              if (i + 1 < amountOfImageShow)
                GestureDetector(
                  onTap: () {
                    if (onTap != null) {
                      onTap!.call(i);
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AppImageFullScreen(
                                  params: AppImageFullScreenParams(
                                      files: files, initIndex: i))));
                    }
                  },
                  child: _imageItem(files[i], context, size),
                ),
            if (files.length > amountOfImageShow - 1)
              GestureDetector(
                onTap: () {
                  if (onTap != null) {
                    onTap!.call(amountOfImageShow - 2);
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AppImageFullScreen(
                                params: AppImageFullScreenParams(
                                    files: files,
                                    initIndex: amountOfImageShow - 2))));
                  }
                },
                child: AppContainer(
                  width: size,
                  height: size,
                  color: AppColors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(borderRadius),
                  child: Center(
                    child: AppText(
                      "+${files.length - (amountOfImageShow - 1)}",
                      size: 20,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryImageBackground,
                    ),
                  ),
                ),
              )
          ],
        );
      },
    );
  }

  Widget _imageItem(FileContent item, BuildContext context, double size) {
    return (item.name ?? "").isVideo
        ? GestureDetector(
            onTap: () {
              if ((item.name ?? "").isVideo) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Container()
                          //AppVideoViewScreen(file: item)
               ),
                );
              }
            },
            child: AppImage(
              width: size,
              height: size,
              assetUrl: 'assets/images/video_thumbnail.png',
              fit: BoxFit.contain,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          )
        : AppImage(
            url: item.url,
            fit: BoxFit.cover,
            width: size,
            height: size,
            borderRadius: BorderRadius.circular(borderRadius),
          );
  }
}
