import 'package:flutter/material.dart';

class ColorSchemeLight {
  static ColorSchemeLight? _instace;
  static ColorSchemeLight? get instance =>
      _instace ??= ColorSchemeLight._init();

  ColorSchemeLight._init();

  get colorScheme => ThemeData.light().colorScheme.copyWith(
        primary: cyan,
      );

  final Color cyan = Colors.cyan;
  final Color grey100 = Colors.grey.shade100;
  final Color primaryDarkColor = const Color.fromARGB(255, 26, 29, 75);
}
