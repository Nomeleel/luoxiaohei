import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/luo_app.dart';
import 'preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initSharedPreferences();
  runApp(
    const ProviderScope(
      child: HeiApp(),
    ),
  );
}
