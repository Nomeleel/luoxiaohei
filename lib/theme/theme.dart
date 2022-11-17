import 'package:flutter/material.dart';

import 'extension.dart';

class ThemeDataFactory {
  const ThemeDataFactory(
    this.useLightThemeMode,
    this.colorSchemeSeed,
  );

  final bool useLightThemeMode;
  final Color colorSchemeSeed;

  ThemeData create() {
    return ThemeData(
      brightness: BrightnessExtension.resolve(useLightThemeMode),
      useMaterial3: true,
      colorSchemeSeed: colorSchemeSeed,
    );
  }
}
