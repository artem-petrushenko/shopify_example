import 'package:shopify_example/src/core/components/shared_preferences/shared_preferences_dao.dart';
import 'package:shopify_example/src/feature/auth/data/provider/local/session_storage.dart';

final class SessionStorageImpl implements SessionStorage {
  const SessionStorageImpl({
    required final SharedPreferencesDao sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  final SharedPreferencesDao _sharedPreferences;

  @override
  Future<void> saveAccessToken(String accessToken) async =>
      await _sharedPreferences.updateString(
        'accessToken',
        accessToken,
      );

  @override
  String? getAccessToken() => _sharedPreferences.readString('accessToken');

  @override
  Future<void> cleanSession() async {
    await _sharedPreferences.delete('accessToken');
  }
}
