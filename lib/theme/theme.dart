import 'package:flutter/material.dart';

class ThemeDataFactory {
  const ThemeDataFactory(
    this.useLightThemeMode,
    this.colorSchemeSeed,
  );

  final bool useLightThemeMode;
  final Color colorSchemeSeed;

  ThemeData create() {
    return ThemeData(
      brightness: useLightThemeMode ? Brightness.light : Brightness.dark,
      useMaterial3: true,
      colorSchemeSeed: colorSchemeSeed,
    );
  }
}
