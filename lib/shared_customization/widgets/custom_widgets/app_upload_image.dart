import 'dart:io';

import 'package:flutter/material.dart';

import '/shared_customization/extensions/list_ext.dart';
import '/shared_customization/helpers/image_helper.dart';
import '/app_common_data/app_colors.dart';
import '/app_common_data/common_data/global_variable.dart';
import '../buttons/app_icon_button.dart';
import '../app_container.dart';
import 'app_image.dart';

class AppUploadImage extends StatefulWidget {
  final void Function(File file)? onSelectFile;
  final String? imagePlaceholderAssetUrl;
  final String? initialUrl;
  final File? initialFile;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final BoxFit fit;

  const AppUploadImage({
    super.key,
    required this.onSelectFile,
    this.imagePlaceholderAssetUrl,
    this.initialUrl,
    this.initialFile,
    this.width,
    this.height,
    this.borderRadius =
        const BorderRadius.all(Radius.circular(BORDER_RADIUS_VALUE)),
    this.fit = BoxFit.cover,
  });

  const AppUploadImage.avatar({
    super.key,
    required this.onSelectFile,
    this.imagePlaceholderAssetUrl,
    this.initialUrl,
    this.initialFile,
    this.borderRadius =
        const BorderRadius.all(Radius.circular(BORDER_RADIUS_VALUE)),
    this.fit = BoxFit.cover,
    required double size,
  })  : width = size,
        height = size;

  @override
  State<AppUploadImage> createState() => _AppUploadImageState();
}

class _AppUploadImageState extends State<AppUploadImage> {
  File? currentSelectedFile;

  @override
  void initState() {
    currentSelectedFile = widget.initialFile;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AppImage(
          assetUrl: widget.imagePlaceholderAssetUrl ??
              'assets/images/image_loading.png',
          imagePadding: (widget.initialUrl ?? currentSelectedFile) == null
              ? const EdgeInsets.all(16)
              : EdgeInsets.zero,
          backgroundColor: AppColors.grey,
          url: widget.initialUrl,
          file: currentSelectedFile,
          width: widget.width,
          height: widget.height,
          borderRadius: widget.borderRadius,
          fit: (widget.initialUrl ?? currentSelectedFile) == null
              ? BoxFit.contain
              : widget.fit,
        ),
        Positioned.fill(
            child: AppContainer(
          color: AppColors.black.withOpacity(0.15),
          borderRadius: widget.borderRadius,
        )),
        Positioned.fill(
            child: Center(
          child: AppIconButton(
            icon: Icons.upload_rounded,
            backgroundColor: AppColors.white.withOpacity(0.35),
            color: AppColors.white,
            padding: const EdgeInsets.all(4),
            onPressed: () async {
              List<File>? files = await ImagePickerHelper.showImagePicker(
                  context: context, multiSelection: false);
              if (files.isNotEmptyOrNull) {
                setState(() {
                  currentSelectedFile = files.first;
                  widget.onSelectFile?.call(files.first);
                });
              }
            },
          ),
        ))
      ],
    );
  }
}
