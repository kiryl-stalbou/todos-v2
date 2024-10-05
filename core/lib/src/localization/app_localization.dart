import 'package:flutter/material.dart';

class AppLocalization {
  static const String langsFolderPath = 'packages/core/resources/langs';

  static List<Locale> get supportedLocales => <Locale>[_enLocale];

  static Locale get fallbackLocale => _enLocale;

  static const Locale _enLocale = Locale('en', 'US');
}
