import 'package:shared_preferences/shared_preferences.dart';

class PersistentStorage {
  static late final SharedPreferences _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static SharedPreferences get instance => _preferences;
}
