import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static SharedPreferencesHelper _instance;
  SharedPreferences _preferences;

  static Future<SharedPreferencesHelper> get instance async {
    if (_instance == null || _instance._preferences == null) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      _instance = SharedPreferencesHelper._internal(prefs);
    }
    return _instance;
  }

  SharedPreferencesHelper._internal(this._preferences);

  put<T>(String key, T value) async {
    if (value == null) {
      await _preferences.remove(key);
      return;
    }
    await _preferences.setString(key, value.toString());
  }

  T get<T>(String key) {
    return _preferences.get(key) as T;
  }

  remove(String key) async {
    await _preferences.remove(key);
  }

  clear() async {
    await _preferences.clear();
  }
}
