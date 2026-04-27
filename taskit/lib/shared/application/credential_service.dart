import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/shared/data/repository/credential_storage.dart';
import 'package:taskit/shared/data/repository/credential_storage_impl.dart';

final credentialServiceProvider = Provider<CredentialService>((ref) {
  final storage = ref.read(credentialStorageProvider);
  return CredentialService(storage);
});

class CredentialService {
  final CredentialStorage _storage;

  CredentialService(this._storage);

  Future<void> deleteTokens() => _storage.deleteTokens();

  Future<String?> getAccessToken() => _storage.getAccessToken();

  Future<String?> getRefreshToken() => _storage.getRefreshToken();

  Future<String?> getSessionId() => _storage.getSessionId();

  Future<void> saveTokens(String access, String refresh, String sessionId) =>
      _storage.saveTokens(access, refresh, sessionId);
}
