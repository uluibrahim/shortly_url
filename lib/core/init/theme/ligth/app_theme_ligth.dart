import 'package:flutter/material.dart';

import '../app_theme.dart';
import 'i_theme_ligth.dart';

class AppThemeLight extends AppTheme with IThemeLigth {
  static AppThemeLight? _instance;
  static AppThemeLight get instance => _instance ??= AppThemeLight._init();
  AppThemeLight._init();

  @override
  ThemeData? get theme => ThemeData.light().copyWith(
        colorScheme: colorSchemeLight?.colorScheme,
        scaffoldBackgroundColor: colorSchemeLight?.grey100,
        primaryColorDark: colorSchemeLight?.primaryDarkColor,
      );
}
