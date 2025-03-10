import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '/shared_customization/enums/image_type.dart';
import '/app_common_data/app_colors.dart';
import '/generated/assets.gen.dart';
import '/shared_customization/extensions/string_ext.dart';

// ignore: must_be_immutable
class AppNetworkImage extends StatelessWidget {
  final String? url;
  final Color? backgroundColor;
  final Widget? placeholderImage;
  final double? width;
  final double? height;
  final double? aspectRatio;
  final double? placeholderAspectRatio;
  final BorderRadius borderRadius;
  final BoxFit? fit;
  final ImageType imageType;
  BoxConstraints? constraints;

  AppNetworkImage({
    super.key,
    this.url,
    this.backgroundColor = AppColors.black,
    this.placeholderImage,
    this.width,
    this.height,
    this.borderRadius = BorderRadius.zero,
    this.fit,
    this.aspectRatio,
    this.placeholderAspectRatio,
    this.constraints,
    this.imageType = ImageType.image,
  });

  @override
  Widget build(BuildContext context) {
    constraints = BoxConstraints(
        maxWidth: constraints?.maxWidth ?? double.infinity,
        maxHeight: constraints?.maxHeight ?? double.infinity);
    Widget imageWidget = ClipRRect(
        borderRadius: borderRadius,
        child: Container(
            decoration: BoxDecoration(color: backgroundColor),
            child: url.isEmptyOrNull
                ? LayoutBuilder(builder: (context, boxConstraint) {
                    double constraintBoxWidth = width ??
                        min(constraints?.maxWidth ?? double.infinity,
                            boxConstraint.maxWidth);
                    double constraintBoxHeight = height ??
                        min(constraints?.maxHeight ?? double.infinity,
                            boxConstraint.maxHeight);
                    return Container(
                        width: constraintBoxWidth,
                        height: constraintBoxHeight,
                        color: AppColors.grey,
                        child: Center(
                            child: imageType == ImageType.image
                                ? SizedBox(
                                    height: constraintBoxHeight / 2,
                                    width: constraintBoxWidth / 2,
                                    child: Assets.images.imageLoading
                                        .image(fit: BoxFit.contain))
                                : SizedBox(
                                    height: constraintBoxHeight / 2 * 3,
                                    width: constraintBoxWidth / 2 * 3,
                                    child: Assets.images.imageLoading
                                        .image(fit: BoxFit.contain))));
                  })
                : CachedNetworkImage(
                    imageUrl: url!,
                    maxWidthDiskCache: 1260,
                    maxHeightDiskCache: 1260,
                    errorWidget: (context, _, __) =>
                        LayoutBuilder(builder: (context, constrain) {
                      return Container(
                          width: constrain.maxWidth,
                          height: constrain.maxHeight,
                          color: AppColors.grey,
                          child: Center(
                              child: SizedBox(
                                  height: constrain.maxHeight / 2,
                                  width: constrain.maxWidth / 2,
                                  child: Assets.images.imageLoading
                                      .image(fit: BoxFit.contain))));
                    }),
                    placeholder: (context, _) =>
                        LayoutBuilder(builder: (context, constrain) {
                      return Container(
                          width: constrain.maxWidth,
                          height: aspectRatio != null ||
                                  placeholderAspectRatio != null
                              ? (aspectRatio ?? placeholderAspectRatio)! *
                                  constrain.maxWidth
                              : constrain.maxHeight,
                          color: AppColors.grey,
                          child: Center(
                              child: SizedBox(
                                  height: constrain.maxHeight / 2,
                                  width: constrain.maxWidth / 2,
                                  child: Assets.images.imageLoading
                                      .image(fit: BoxFit.contain))));
                    }),
                    fit: fit ?? BoxFit.contain,
                  )));
    if (aspectRatio != null) {
      return SizedBox(
          width: width,
          height: height ?? width,
          child: AspectRatio(aspectRatio: aspectRatio!, child: imageWidget));
    }
    return SizedBox(width: width, height: height, child: imageWidget);
  }
}
