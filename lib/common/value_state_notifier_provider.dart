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
        // if (valueChanged != null) ref.listenSelf((previous, next) => valueChanged(next));
        return ValueStateNotifier<T>(
          initialValueFn(ref),
          valueChanged: valueChanged,
        );
      },
      name: name,
    );
  }
}

class ValueStateNotifier<T> extends StateNotifier<T> {
  ValueStateNotifier(
    super.state, {
    this.valueChanged,
  });

  final ValueChanged<T>? valueChanged;

  T update(T Function(T state) change) => this.change(change(state));

  T change(T value) {
    valueChanged?.call(value);
    return state = value;
  }
}

extension StateControllerValueExtension<T> on StateController<T> {
  T change(T value) => state = value;
}