import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/value_state_notifier_provider.dart';
import '../preferences/shared_preferences.dart';

// part 'provider.g.dart';

/// [valueChanged] will only be called when the state value changes,
/// but [listenSelf] will also be called when the provider it watches.
/// If there is no watch, the two create function are equivalent.

StateProvider<T> createProviderWithPreferences<T>(
  String preferencesKey,
  T defaultValue, {
  String? providerName,
  bool listenImmediately = false,
}) {
  return StateProvider(
    (ref) {
      ref.listenSelf((previous, next) {
        if (listenImmediately) {
          if (!identical(previous, next)) preferences.setValue<T>(preferencesKey, next);
        } else {
          listenImmediately = true;
        }
      });
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

/*
// TODO(riverpod): Cannot generate [StateProvider]. See https://github.com/rrousselGit/riverpod/blob/master/packages/riverpod_generator/lib/src/templates/stateless_provider.dart#L36-L45
// TODO(riverpod): Cannot generate <T> ！！！
@Riverpod(keepAlive: true)
dynamic createPreferences(
  CreatePreferencesRef ref,
  String preferencesKey,
  dynamic defaultValue, {
  bool listenImmediately = false,
}) {
  ref.listenSelf((previous, next) {
    if (listenImmediately) {
      if (!identical(previous, next)) preferences.setValue(preferencesKey, next);
    } else {
      listenImmediately = true;
    }
  });
  return (preferences.getValue(preferencesKey) ?? defaultValue);
}
*/

/*
// TODO(riverpod): Cannot generate <T> ！！！
@Riverpod(keepAlive: true)
class CreatePreferences extends _$CreatePreferences {
  @override
  dynamic build(
    String preferencesKey,
    dynamic defaultValue, {
    bool listenImmediately = false,
  }) {
    ref.listenSelf((previous, next) {
      if (listenImmediately) {
        if (!identical(previous, next)) preferences.setValue(preferencesKey, next);
      } else {
        listenImmediately = true;
      }
    });
    return (preferences.getValue(preferencesKey) ?? defaultValue);
  }
}

// ignore: invalid_use_of_internal_member
mixin NotifierControllerMixin<T> on BuildlessNotifier<T> {
  T change(T value) => state = value;
  T update(T Function(T state) cb) => state = cb(state);
}
*/