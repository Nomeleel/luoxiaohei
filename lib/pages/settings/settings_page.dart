import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/value_state_notifier_provider.dart';
import '../../theme/theme_provider.dart';
import '../../widgets/common/luo_scaffold.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final useSystemThemeMode = ref.watch(useSystemThemeModeProvider);
    final useLightThemeMode = ref.watch(useLightThemeModeProvider);
    final colorSchemeSeed = ref.watch(colorSchemeSeedProvider);
    return LuoScaffold(
      child: Center(
        child: Column(
          children: [
            IconButton(
              icon: Icon(Icons.settings, color: Colors.grey.withOpacity(useSystemThemeMode ? 1.0 : .2)),
              onPressed: () {
                ref.read(useSystemThemeModeProvider.notifier).update((state) => !state);
              },
            ),
            if (!useSystemThemeMode)
              IconButton(
                icon: Icon(useLightThemeMode ? Icons.dark_mode : Icons.light_mode),
                onPressed: () {
                  ref.read(useLightThemeModeProvider.notifier).update((state) => !state);
                },
              ),
            IconButton(
              icon: Icon(Icons.color_lens, color: colorSchemeSeed),
              onPressed: () {
                ref
                    .read(colorSchemeSeedProvider.notifier)
                    .change(Colors.primaries[Random().nextInt(Colors.primaries.length)]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
