import 'dart:async';

import 'package:flutter/material.dart';

import 'error_handler.dart';

Future<void> bootstrap(
  FutureOr Function() init,
  Widget rootWidget,
) async {
  ErrorHandler.instance.errorHandle();

  await init();

  WidgetsFlutterBinding.ensureInitialized();
  runApp(rootWidget);
}
