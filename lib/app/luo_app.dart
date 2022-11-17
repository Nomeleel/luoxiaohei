import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:luoxiaohei/theme/theme_provider.dart';

import '../router/router.dart';

class HeiApp extends ConsumerWidget {
  const HeiApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'LuoXiaoHei',
      theme: ref.watch(themeProvider),
      routerConfig: router,
    );
  }
}
