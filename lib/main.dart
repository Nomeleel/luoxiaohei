import 'app/luo_app.dart';
import 'bootstrap/bootstrap.dart';
import 'preferences/shared_preferences.dart';

void main() {
  bootstrap(
    () async {
      await initSharedPreferences();
    },
    const HeiApp(),
  );
}