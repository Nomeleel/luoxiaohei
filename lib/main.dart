import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/luo_app.dart';

void main() {
  runApp(
    const ProviderScope(
      child: HeiApp(),
    ),
  );
}
