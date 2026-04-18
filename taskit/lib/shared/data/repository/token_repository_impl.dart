import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:taskit/shared/data/repository/token_repository.dart';

import '../../extension/string_hardcoded.dart';

final tokenSourceProvider = Provider<FlutterSecureStorage>((ref) {
  return const FlutterSecureStorage();
});

final tokenRepositoryProvider = Provider<TokenRepository>((ref) {
  return TokenRepositoryImpl(ref.read(tokenSourceProvider));
});

class TokenRepositoryImpl implements TokenRepository {
  final FlutterSecureStorage _storage;
  static final String _access = 'ACCESS_TOKEN'.hardcoded;
  static final String _refresh = 'REFRESH_TOKEN'.hardcoded;

  TokenRepositoryImpl(this._storage);

  @override
  Future<void> saveTokens(String access, String refresh) async {
    await _storage.write(key: _access, value: access);
    await _storage.write(key: _refresh, value: refresh);
  }

  @override
  Future<String?> getAccessToken() => _storage.read(key: _access);

  @override
  Future<String?> getRefreshToken() => _storage.read(key: _refresh);

  @override
  Future<void> deleteTokens() async {
    await _storage.delete(key: _access);
    await _storage.delete(key: _refresh);
  }
}
