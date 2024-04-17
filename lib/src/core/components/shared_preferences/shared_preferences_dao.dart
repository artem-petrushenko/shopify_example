import 'package:shared_preferences/shared_preferences.dart';

//TODO: Rewrite this class
class SharedPreferencesDao {
  const SharedPreferencesDao({
    required final SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  final SharedPreferences _sharedPreferences;

  Future<void> updateString(String key, String value) async {
    await _sharedPreferences.setString(key, value);
  }

  String? readString(String key) {
    return _sharedPreferences.getString(key);
  }

  Future<void> updateBool(String key, bool value) async {
    await _sharedPreferences.setBool(key, value);
  }

  bool? readBool(String key) {
    return _sharedPreferences.getBool(key);
  }

  Future<void> delete(String key) async => await _sharedPreferences.remove(key);
}
