
abstract interface class ITokenRepository{
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<void> deleteToken();
}