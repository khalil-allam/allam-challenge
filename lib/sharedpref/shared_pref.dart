import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static late SharedPreferences sharedPref;
  static Future<void> initSharedPref() async {
    sharedPref = await SharedPreferences.getInstance();
  }
}
