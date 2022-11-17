import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../preferences/provider.dart';
import 'extension.dart';
import 'platform_brightness_provider.dart';
import 'theme.dart';

final useSystemThemeModeProvider = createProviderWithPreferences(
  'useSystemThemeMode',
  false,
  providerName: 'UseSystemThemeModeProvider',
);

final useLightThemeModeProvider = createProviderWithPreferences(
  'useLightThemeMode',
  true,
  providerName: 'UseLightThemeModeProvider',
);

final colorSchemeSeedProvider = createProviderWithPreferences<Color>(
  'colorSchemeSeed',
  Colors.purple,
  providerName: 'ColorSchemeSeedProvider',
);

final themeProvider = StateProvider<ThemeData>(
  (ref) {
    bool useLightThemeMode = ref.watch(useLightThemeModeProvider);

    if (ref.watch(useSystemThemeModeProvider)) {
      useLightThemeMode = ref.watch(platformBrightnessProvider).isLight;
    }

    return ThemeDataFactory(
      useLightThemeMode,
      ref.watch(colorSchemeSeedProvider),
    ).create();
  },
  name: 'ThemeProvider',
);
