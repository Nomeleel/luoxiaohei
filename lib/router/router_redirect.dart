part of 'router.dart';

typedef DependentOnChanged<T> = void Function(void Function(T? previous, T next));

final routerRedirectProvider = ChangeNotifierProvider((ref) {
  DependentOnChanged<T> addProviderDependent<T>(AlwaysAliveProviderListenable<T> provider) {
    return (onChanged) => ref.onDispose(ref.listen<T>(provider, onChanged, fireImmediately: true).close);
  }

  return RouterRedirect(
    addProviderDependent(authProvider),
  );
});

class RouterRedirect extends ChangeNotifier {
  RouterRedirect(
    DependentOnChanged<bool> auth,
  ) {
    auth(_listener<bool>((value) => isAuth = value));
  }

  late bool isAuth;

  _listener<T>(ValueChanged<T> valueChanged) {
    return (pre, cur) {
      valueChanged(cur);
      notifyListeners();
    };
  }

  Future<String?> _redirect(BuildContext context, GoRouterState state) async {
    return isAuth ? null : '/';
  }
}
