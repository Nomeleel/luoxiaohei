import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ValueStateNotifierProvider<NotifierT extends ValueStateNotifier<T>, T> {
  const ValueStateNotifierProvider._();
  static ValueStateNotifierProviderBuilder create = const ValueStateNotifierProviderBuilder();
}

class ValueStateNotifierProviderBuilder {
  const ValueStateNotifierProviderBuilder();

  StateNotifierProvider<ValueStateNotifier<T>, T> call<T>(
    T Function(StateNotifierProviderRef<ValueStateNotifier<T>, T>) initialValueFn, {
    ValueChanged<T>? valueChanged,
    String? name,
  }) {
    return StateNotifierProvider<ValueStateNotifier<T>, T>(
      (ref) {
        // If initialValueFn has ref watch, listenSelf will be triggered to call by dependencies,
        // even if the value is not updated.
        // if (valueChanged != null) ref.listenSelf((previous, next) {if (!identical(previous, next)) valueChanged(next);});
        return ValueStateNotifier<T>(
          initialValueFn(ref),
          valueChanged: valueChanged,
        );
      },
      name: name,
    );
  }
}

class ValueStateNotifier<T> extends StateController<T> {
  ValueStateNotifier(
    super.state, {
    this.valueChanged,
  }) {
    if (valueChanged != null) addListener(fireImmediately: false, valueChanged!);
  }

  final ValueChanged<T>? valueChanged;
}

extension StateControllerValueExtension<T> on StateController<T> {
  T change(T value) => state = value;
}
