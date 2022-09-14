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
}
