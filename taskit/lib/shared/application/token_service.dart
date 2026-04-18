abstract interface class TokenService {
  Future<void> saveTokens(String access, String refresh);

  Future<String?> getAccessToken();

  Future<String?> getRefreshToken();

  Future<void> deleteTokens();
}
