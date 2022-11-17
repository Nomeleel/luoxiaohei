import 'dart:ui';

extension BrightnessExtension on Brightness {
  bool get isLight => this == Brightness.light;
  bool get isDark => this == Brightness.dark;

  static Brightness resolve(bool isLight) => isLight ? Brightness.light : Brightness.dark;
}
