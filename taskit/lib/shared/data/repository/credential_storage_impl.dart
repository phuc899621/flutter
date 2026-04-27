import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../extension/string_hardcoded.dart';
import '../source/local/storage_provider.dart';
import 'credential_storage.dart';

final credentialStorageProvider = Provider<CredentialStorage>((ref) {
  final storage = ref.read(secureStorageProvider);
  return CredentialStorageImpl(storage);
});

class CredentialStorageImpl implements CredentialStorage {
  final FlutterSecureStorage _storage;
  static final String _access = 'ACCESS_TOKEN'.hardcoded;
  static final String _refresh = 'REFRESH_TOKEN'.hardcoded;
  static final String _sessionId = 'SESSION_ID'.hardcoded;

  CredentialStorageImpl(this._storage);

  @override
  Future<void> saveTokens(
    String access,
    String refresh,
    String sessionId,
  ) async {
    await _storage.write(key: _access, value: access);
    await _storage.write(key: _refresh, value: refresh);
    await _storage.write(key: _sessionId, value: sessionId);
  }

  @override
  Future<void> saveAccessToken(String access) =>
      _storage.write(key: _access, value: access);

  @override
  Future<void> saveRefreshToken(String refresh) =>
      _storage.write(key: _refresh, value: refresh);

  @override
  Future<void> saveSessionId(String sessionId) =>
      _storage.write(key: _sessionId, value: sessionId);

  @override
  Future<String?> getAccessToken() => _storage.read(key: _access);

  @override
  Future<String?> getRefreshToken() => _storage.read(key: _refresh);

  @override
  Future<String?> getSessionId() => _storage.read(key: _sessionId);

  @override
  Future<void> deleteTokens() async {
    await _storage.delete(key: _access);
    await _storage.delete(key: _refresh);
    await _storage.delete(key: _sessionId);
  }
}
