import 'package:flutter/material.dart';

import '../../generated/assets.gen.dart';

enum ImageType { avatar, image }

extension ImageTypeExt on ImageType {
  Image get imagePlaceHolder => {
        ImageType.avatar: Assets.images.avatarPlaceholder.image(),
        ImageType.image: Assets.images.imageLoading.image(),
      }[this]!;
}
