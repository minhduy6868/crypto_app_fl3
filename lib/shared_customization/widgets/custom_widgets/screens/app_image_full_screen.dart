import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:uuid/uuid.dart';

import '/models/file_content/file_content.dart';
import '/shared_customization/extensions/string_ext.dart';
import '../app_image.dart';
import 'app_video_view_screen.dart';
import '/app_common_data/app_colors.dart';
import '../../../animations/circular_loading_animation.dart';
import '../../app_layout.dart';
import '../app_dismiss_keyboard.dart';

class AppImageFullScreenParams {
  final List<FileContent> files;
  final int initIndex;
  AppImageFullScreenParams({required this.files, required this.initIndex});
}

class AppImageFullScreen extends StatefulWidget {
  final AppImageFullScreenParams params;
  const AppImageFullScreen({super.key, required this.params});

  @override
  State<AppImageFullScreen> createState() => _AppImageFullScreenState();
}

class _AppImageFullScreenState extends State<AppImageFullScreen> {
  late int currentIndex;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.params.initIndex);
    currentIndex = widget.params.initIndex;
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void _onChangePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppDismissKeyboard(
      canPop: true,
      child: AppLayout(
          title: '${currentIndex + 1}/${widget.params.files.length.toString()}',
          onWillPop: () => Future.value(true),
          appBarColor: AppColors.primaryBackground,
          backgroundColor: AppColors.primaryBackground,
          body: PhotoViewGallery.builder(
            scrollPhysics: const BouncingScrollPhysics(),
            enableRotation: false,
            builder: (context, index) {
              return PhotoViewGalleryPageOptions.customChild(
                  heroAttributes: PhotoViewHeroAttributes(
                      tag: widget.params.files[index].url ?? const Uuid().v4()),
                  basePosition: Alignment.center,
                  minScale: PhotoViewComputedScale.contained,
                  maxScale: PhotoViewComputedScale.contained * 2,
                  initialScale: PhotoViewComputedScale.contained,
                  child: _imageItem(widget.params.files[index]));
            },
            itemCount: widget.params.files.length,
            loadingBuilder: (context, event) =>
                const CircularLoadingAnimation(),
            backgroundDecoration:
                const BoxDecoration(color: AppColors.primaryBackground),
            pageController: _pageController,
            onPageChanged: _onChangePage,
            scrollDirection: Axis.horizontal,
          )),
    );
  }

  Widget _imageItem(FileContent item) {
    return (item.name ?? "").isVideo
        ? GestureDetector(
            onTap: () {
              if ((item.name ?? "").isVideo) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Container()
                        //  AppVideoViewScreen(file: item)
                  ),
                );
              }
            },
            child: const AppImage(
              assetUrl: 'assets/images/video_thumbnail.png',
              fit: BoxFit.contain,
            ),
          )
        : AppImage(
            url: item.url,
            fit: BoxFit.cover,
            borderRadius: BorderRadius.circular(0),
          );
  }
}
