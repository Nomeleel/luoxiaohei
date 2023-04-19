import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../pages/home/home_page.dart';
import '../pages/settings/settings_page.dart';
import '../pages/splash/splash_page.dart';

part 'pages.dart';
part 'route.dart';
part 'router_redirect.dart';

final GoRouter router = GoRouter(
  routes: routes,
);

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
