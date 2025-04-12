
abstract interface class ITokenService{
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<void> deleteToken();
}