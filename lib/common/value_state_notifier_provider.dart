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
      (ref) => ValueStateNotifier<T>(
        initialValueFn(ref),
        valueChanged: valueChanged,
      ),
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
