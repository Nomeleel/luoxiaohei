import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ErrorHandler {
  const ErrorHandler._();

  static const ErrorHandler instance = ErrorHandler._();

  void errorHandle() {
    FlutterError.onError = _onError;

    PlatformDispatcher.instance.onError = _onUnhandledError;

    ErrorWidget.builder = _errorWidgetBuilder;
  }

  void _onError(FlutterErrorDetails details) {
    FlutterError.presentError(details);

    /// TODO: Imp
  }

  bool _onUnhandledError(Object exception, StackTrace stackTrace) {
    /// TODO: Imp
    return true;
  }

  Widget _errorWidgetBuilder(FlutterErrorDetails details) {
    return Container(
      color: Colors.purple,
      child: ErrorWidget.builder(details),
    );
  }
}
