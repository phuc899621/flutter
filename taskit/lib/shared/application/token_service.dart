abstract interface class TokenService {
  Future<void> saveTokens(String access, String refresh, String sessionId);

  Future<int?> getActiveUserId();

  Future<void> deleteActiveUserId();

  Future<void> saveActiveUserId(int id);

  Future<String?> getAccessToken();

  Future<String?> getRefreshToken();

  Future<String?> getSessionId();

  Future<void> deleteTokens();
}
