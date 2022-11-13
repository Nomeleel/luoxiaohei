import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:luoxiaohei/app/app_provider.dart';

import '../router/router.dart';

class HeiApp extends ConsumerWidget {
  const HeiApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(appProvider).init();
    return MaterialApp.router(
      title: 'LuoXiaoHei',
      routerConfig: router,
    );
  }
}
