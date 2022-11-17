import 'package:shared_preferences/shared_preferences.dart';

export 'extension.dart';

late SharedPreferences preferences;

initSharedPreferences() async {
  preferences = await SharedPreferences.getInstance();
}

