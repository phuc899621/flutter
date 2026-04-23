abstract interface class TokenRepository {
  Future<void> saveTokens(String access, String refresh, String sessionId);

  Future<String?> getAccessToken();

  Future<String?> getRefreshToken();

  Future<String?> getSessionId();

  Future<void> deleteTokens();
}
