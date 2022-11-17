import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

extension SharedPreferencesExtension on SharedPreferences {
  T? getValue<T>(String key) {
    final value = get(key);
    return (value is T?) ? value : _mapVariantValue<T>(value);
  }

  Future<bool> setValue<T>(String key, T value) async {
    switch (T) {
      case bool:
        return setBool(key, value as bool);
      case int:
        return setInt(key, value as int);
      case double:
        return setDouble(key, value as double);
      case String:
        return setString(key, value as String);
      case List<String>:
        return setStringList(key, value as List<String>);
      default:
        return _setVariantValue<T>(key, value);
    }
  }

  Future<bool> set(String key, Object value) => setValue(key, value);

  T? _mapVariantValue<T>(Object? value) {
    switch (T) {
      case Color:
        return Color(value as int) as T;
      default:
        return null;
    }
  }

  Future<bool> _setVariantValue<T>(String key, T value) async {
    switch (T) {
      case Color:
        return setInt(key, (value as Color).value);
      default:
        return false;
    }
  }
}
