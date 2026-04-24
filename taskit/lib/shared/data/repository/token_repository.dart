abstract interface class TokenRepository {
  Future<void> saveTokens(String access, String refresh, String sessionId);

  Future<void> saveActiveUserId(int id);

  Future<String?> getAccessToken();

  Future<int?> getActiveUserId();

  Future<String?> getRefreshToken();

  Future<String?> getSessionId();

  Future<void> deleteTokens();

  Future<void> deleteActiveUserId();
}
