part of 'router.dart';

enum PageTransition {
  no,
  fade,
  scale,
  custom,
}

typedef PageTransitionsBuilder = Widget Function(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
);

class TransitionRoute extends GoRoute {
  TransitionRoute({
    required super.path,
    super.name,
    required GoRouterWidgetBuilder builder,
    super.parentNavigatorKey,
    super.redirect,
    List<RouteBase> routes = const <RouteBase>[],
    PageTransition? transition,
    PageTransitionsBuilder? transitionsBuilder,
  }) : super(
          pageBuilder: (context, state) {
            final child = builder(context, state);

            switch (transition) {
              case PageTransition.no:
                return NoTransitionPage(child: child);
              case null:
              case PageTransition.custom:
                if (transitionsBuilder == null) {
                  return MaterialPage(child: child);
                } else {
                  continue transition;
                }
              transition:
              default:
                transitionsBuilder ??= pageTransitionMap[transition];
                return CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionsBuilder: transitionsBuilder!,
                );
            }
          },
          routes: routes,
        );
}

const pageTransitionMap = {
  PageTransition.fade: pageFadeTransition,
  PageTransition.scale: pageScaleTransition,
};

Widget pageFadeTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  return FadeTransition(opacity: animation, child: child);
}

Widget pageScaleTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  return ScaleTransition(scale: animation, child: child);
}
