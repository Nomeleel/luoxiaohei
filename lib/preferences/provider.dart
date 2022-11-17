import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/value_state_notifier_provider.dart';
import '../preferences/shared_preferences.dart';

/// [valueChanged] will only be called when the state value changes, 
/// but [listenSelf] will also be called when the provider it watches. 
/// If there is no watch, the two create function are equivalent.

StateProvider<T> createProviderWithPreferences<T>(
  String preferencesKey,
  T defaultValue, {
  String? providerName,
}) {
  return StateProvider(
    (ref) {
      ref.listenSelf((previous, next) => preferences.setValue<T>(preferencesKey, next));
      return (preferences.getValue<T>(preferencesKey) ?? defaultValue);
    },
    name: providerName,
  );
}

StateNotifierProvider<ValueStateNotifier<T>, T> createValueProviderWithPreferences<T>(
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
