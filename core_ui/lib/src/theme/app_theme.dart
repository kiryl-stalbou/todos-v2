part of core_ui;

final ThemeData darkTheme = _buildThemeData(
  base: ThemeData.dark().copyWith(
    extensions: <ThemeExtension<AppColorsTheme>>[
      const DarkColorsTheme(),
    ],
  ),
);

final ThemeData lightTheme = _buildThemeData(
  base: ThemeData.light().copyWith(
    extensions: <ThemeExtension<AppColorsTheme>>[
      const LightColorsTheme(),
    ],
  ),
);

ThemeData _buildThemeData({
  required ThemeData base,
}) {
  final AppColorsTheme colors = base.colors;

  return base.copyWith(
    scaffoldBackgroundColor: colors.background,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: colors.accent,
    ),
    textTheme: _getTextTheme(colors),
    inputDecorationTheme: _getInputDecorationTheme(colors),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: colors.background,
      secondary: colors.accent,
    ),
  );
}

TextTheme _getTextTheme(AppColorsTheme colors) {
  return const TextTheme(
    bodyMedium: AppFonts.raleway16Regular,
  ).apply(
    bodyColor: colors.primaryText,
  );
}

InputDecorationTheme _getInputDecorationTheme(AppColorsTheme colors) {
  return InputDecorationTheme(
    fillColor: colors.textInputBackground,
    focusColor: colors.textInputBackground,
    filled: true,
    contentPadding: const EdgeInsets.all(AppDimens.contentPadding),
    hintStyle: AppFonts.raleway16Regular.copyWith(
      color: colors.hintText,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(AppDimens.textInputBorderRadius),
      ),
      borderSide: BorderSide(
        color: colors.transparent,
        width: 0,
      ),
    ),
    border: OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(AppDimens.textInputBorderRadius),
      ),
      borderSide: BorderSide(
        color: colors.transparent,
        width: 0,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(AppDimens.textInputBorderRadius),
      ),
      borderSide: BorderSide(
        color: colors.transparent,
        width: 0,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(AppDimens.textInputBorderRadius),
      ),
      borderSide: BorderSide(
        color: colors.accent,
      ),
    ),
    labelStyle: AppFonts.raleway16Regular.copyWith(
      color: colors.primaryText,
    ),
  );
}
