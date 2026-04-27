import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskit/shared/data/repository/session_storage.dart';

import '../../extension/string_hardcoded.dart';
import '../source/local/storage_provider.dart';

final sessionStorageProvider = Provider<SessionStorage>((ref) {
  final storage = ref.read(localStorageProvider).requireValue;
  return SessionStorageImpl(storage);
});

class SessionStorageImpl implements SessionStorage {
  final SharedPreferences _storage;
  static final String _activeUserId = 'ACTIVE_USER_ID'.hardcoded;

  SessionStorageImpl(this._storage);

  @override
  Future<void> saveActiveUserId(int id) async {
    await _storage.setInt(_activeUserId, id);
  }

  @override
  Future<void> deleteActiveUserId() => _storage.remove(_activeUserId);

  @override
  int? getActiveUserId() => _storage.getInt(_activeUserId);
}
