import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:taskit/shared/extension/string_hardcoded.dart';


final tokenStorageProvider=Provider<FlutterSecureStorage>((ref){
  return const FlutterSecureStorage();
});

final tokenSourceProvider=Provider<TokenSource>((ref){
  return TokenSource(ref.read(tokenStorageProvider));
});


class TokenSource {

  final FlutterSecureStorage _storage;
  static String _key = 'AUTH_TOKEN'.hardcoded;
  TokenSource(this._storage);

  Future<void> saveToken(String token) async {
    await _storage.write(key: _key, value: token);
  }

  Future<String?> getToken() async {
    return await _storage.read(key: _key);
  }

  Future<void> deleteToken() async {
    await _storage.delete(key: _key);
  }
}
