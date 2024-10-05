import 'package:flutter/material.dart';

import '../../../core_ui.dart';

class LightColorsTheme extends AppColorsTheme {
  const LightColorsTheme();

  @override
  Color get transparent => AppColors.transparent;

  @override
  Color get background => AppColors.babyPowder;

  @override
  Color get accent => AppColors.cadmiumOrange;

  @override
  Color get primaryText => AppColors.black;

  @override
  Color get secondaryText => AppColors.oldSilver;

  @override
  Color get hintText => AppColors.oldSilver;

  @override
  Color get title => AppColors.cadmiumOrange;

  @override
  Color get link => AppColors.cadmiumOrange;

  @override
  Color get successBackground => AppColors.honeydew;

  @override
  Color get successContent => AppColors.caribbeanGreen;

  @override
  Color get textInputBackground => AppColors.alabaster;

  @override
  Color get buttonContent => AppColors.babyPowder;

  @override
  Color get listTileBackground => AppColors.seashell;

  @override
  ThemeExtension<AppColorsTheme> copyWith() {
    return this;
  }

  @override
  ThemeExtension<AppColorsTheme> lerp(
    covariant ThemeExtension<AppColorsTheme>? other,
    double t,
  ) {
    return this;
  }
}
