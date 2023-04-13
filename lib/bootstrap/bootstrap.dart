import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'error_handler.dart';

Future<void> bootstrap(
  FutureOr Function() init,
  Widget rootWidget,
) async {
  ErrorHandler.instance.errorHandle();
  WidgetsFlutterBinding.ensureInitialized();

  await init();

  runApp(ProviderScope(child: rootWidget));
}
