import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../auth/auth_provider.dart';
import '../pages/home/home_page.dart';
import '../pages/settings/settings_page.dart';
import '../pages/splash/splash_page.dart';

part 'pages.dart';
part 'route.dart';
part 'router_redirect.dart';

final routerProvider = Provider((ref) {
  final routerRedirect = ref.read(routerRedirectProvider);
  return GoRouter(
    refreshListenable: routerRedirect,
    redirect: routerRedirect._redirect,
    routes: routes,
  );
});

final List<GoRoute> routes = [
  GoRoute(
    path: Pages.splash,
    builder: (context, state) => const SplashPage(),
  ),
  TransitionRoute(
    path: Pages.home,
    transition: PageTransition.scale,
    builder: (context, state) => const HomePage(),
  ),
  TransitionRoute(
    path: Pages.settings,
    transition: PageTransition.fade,
    builder: (context, state) => const SettingsPage(),
  ),
];
