import 'package:flutter/material.dart';

import '../../../core_ui.dart';

class AppImage {
  final String iconKey;

  const AppImage(this.iconKey);

  Widget call({
    Color? color,
    double? height,
    double? width,
    BoxFit? fit,
    Function()? onTap,
  }) {
    return Image.asset(
      iconKey,
      package: AppImages.packageName,
      fit: fit ?? BoxFit.contain,
      height: height,
      width: width,
    );
  }
}
