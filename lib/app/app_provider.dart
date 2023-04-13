import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../router/router.dart';

part 'app_provider.g.dart';

@riverpod
class AppInit extends _$AppInit {
  @override
  void build() {}

  void init() {
    Future.delayed(const Duration(seconds: 2), () {
      router.go(Pages.home);
    });
  }
}
