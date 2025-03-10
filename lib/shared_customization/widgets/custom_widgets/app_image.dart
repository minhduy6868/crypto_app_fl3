import 'dart:io';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../app_container.dart';
import '/generated/assets.gen.dart';
import '/app_common_data/common_data/global_variable.dart';
import '/app_common_data/app_colors.dart';
import '/shared_customization/enums/image_type.dart';
import '/shared_customization/extensions/string_ext.dart';

class AppImage extends StatelessWidget {
  final double? width;
  final double? height;
  final String? url;
  final String? assetUrl;
  final File? file;
  final BorderRadius? borderRadius;
  final BoxFit fit;
  final EdgeInsets imagePadding;
  final Color backgroundColor;
  final ImageType imageType;

  const AppImage({
    super.key,
    this.url,
    this.assetUrl,
    this.file,
    this.borderRadius,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.backgroundColor = AppColors.transparent,
    this.imagePadding = EdgeInsets.zero,
    this.imageType = ImageType.image,
  });

  const AppImage.avatar({
    super.key,
    this.url,
    this.assetUrl,
    this.file,
    this.borderRadius,
    this.fit = BoxFit.cover,
    this.backgroundColor = AppColors.transparent,
    this.imagePadding = EdgeInsets.zero,
    required double size,
  })  : imageType = ImageType.avatar,
        width = size,
        height = size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(BORDER_RADIUS_VALUE),
      child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(color: backgroundColor),
          padding: imagePadding,
          child: Builder(builder: (context) {
            if (file != null) {
              return Image.file(
                file!,
                fit: fit,
              );
            } else if (url.isNotEmptyOrNull) {
              return CachedNetworkImage(
                imageUrl: url!,
                fit: fit,
                maxHeightDiskCache: 1260,
                maxWidthDiskCache: 1260,
                placeholder: (context, url) => imageLoading,
                errorWidget: (context, url, error) => imageLoading,
              );
            } else if (assetUrl.isNotEmptyOrNull) {
              return Image.asset(
                assetUrl!,
                fit: fit,
              );
            }
            return imagePlaceHolder;
          })),
    );
  }

  Widget get imagePlaceHolder => LayoutBuilder(builder: (context, constraint) {
        return AppContainer(
          color: AppColors.primaryImageBackground,
          padding: EdgeInsets.all(
              min(12.0, min(constraint.maxHeight, constraint.maxWidth) / 4)),
          child: Center(
            child: imageType.imagePlaceHolder,
          ),
        );
      });

  Widget get imageLoading => LayoutBuilder(builder: (context, constraint) {
        return AppContainer(
          color: AppColors.primaryImageBackground,
          padding: EdgeInsets.all(
              min(12.0, min(constraint.maxHeight, constraint.maxWidth) / 4)),
          child: Center(
            child: Assets.images.imageLoading.image(),
          ),
        );
      });
}
