abstract interface class CredentialStorage {
  Future<void> saveTokens(String access, String refresh, String sessionId);

  Future<void> saveAccessToken(String access);

  Future<void> saveRefreshToken(String refresh);

  Future<void> saveSessionId(String sessionId);

  Future<String?> getAccessToken();

  Future<String?> getRefreshToken();

  Future<String?> getSessionId();

  Future<void> deleteTokens();
}
