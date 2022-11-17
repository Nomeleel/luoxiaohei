import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/value_state_notifier_provider.dart';
import '../preferences/shared_preferences.dart';

StateNotifierProvider<ValueStateNotifier<T>, T> createProviderWithPreferences<T>(
  String preferencesKey,
  T defaultValue, {
  String? providerName,
}) {
  return ValueStateNotifierProvider.create(
    (ref) => (preferences.getValue<T>(preferencesKey) ?? defaultValue),
    valueChanged: (value) => preferences.setValue<T>(preferencesKey, value),
    name: providerName,
  );
}
