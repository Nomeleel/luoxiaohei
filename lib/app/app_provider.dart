import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../router/router.dart';

final appProvider = Provider(
  (ref) => const AppProvider(),
  name: 'AppProvider',
);

class AppProvider {
  const AppProvider();

  void init() {
    Future.delayed(const Duration(seconds: 2), () {
      router.go(Pages.home);
    });
  }
}
