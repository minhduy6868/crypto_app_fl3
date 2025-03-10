import 'package:flutter/material.dart';

import '/app_common_data/app_colors.dart';
import '../../../widgets/app_container.dart';

class BaseDialogContent extends StatelessWidget {
  final Widget Function(BuildContext context) builder;
  const BaseDialogContent({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      color: AppColors.white,
      margin: const EdgeInsets.all(16),
      borderRadius: BorderRadius.circular(10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      width: MediaQuery.of(context).size.width,
      child: builder.call(context),
    );
  }
}
