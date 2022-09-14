
import 'package:flutter/material.dart';

import '../app_theme.dart';

class AppThemeLight extends AppTheme {
  static AppThemeLight? _instance;
  static AppThemeLight get instance => _instance ??= AppThemeLight._init();
  AppThemeLight._init();

  @override
  ThemeData? get theme => ThemeData.light().copyWith();
}
