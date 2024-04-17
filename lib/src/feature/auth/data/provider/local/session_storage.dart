abstract interface class SessionStorage {
  Future<void> saveAccessToken(String accessToken);

  String? getAccessToken();

  Future<void> cleanSession();
}
