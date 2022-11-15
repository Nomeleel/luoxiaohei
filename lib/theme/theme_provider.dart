import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'platform_brightness_provider.dart';
import 'theme.dart';

final useSystemThemeModeProvider = StateProvider<bool>(
  (ref) {
    // TODO: From sp.
    return false;
  },
  name: 'UseSystemThemeModeProvider',
);

final useLightThemeModeProvider = StateProvider<bool>(
  (ref) {
    // TODO: From sp.
    return true;
  },
  name: 'UseLightThemeModeProvider',
);

// TODO: move color config.
final colorSchemeSeedProvider = StateProvider<Color>(
  (ref) {
    return Colors.purple;
  },
  name: 'ColorSchemeSeedProvider',
);

final themeProvider = StateProvider<ThemeData>(
  (ref) {
    bool useLightThemeMode = ref.watch(useLightThemeModeProvider);

    if (ref.watch(useSystemThemeModeProvider)) {
      useLightThemeMode = ref.watch(platformBrightnessProvider) == Brightness.light;
    }

    return ThemeDataFactory(
      useLightThemeMode,
      ref.watch(colorSchemeSeedProvider),
    ).create();
  },
  name: 'ThemeProvider',
);
