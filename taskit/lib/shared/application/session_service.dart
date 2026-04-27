import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/shared/data/repository/session_storage.dart';
import 'package:taskit/shared/data/repository/session_storage_impl.dart';

final sessionServiceProvider = Provider<SessionService>((ref) {
  final storage = ref.read(sessionStorageProvider);
  return SessionService(storage);
});

class SessionService {
  final SessionStorage _storage;

  SessionService(this._storage);

  int? getActiveUserId() => _storage.getActiveUserId();

  Future<void> deleteActiveUserId() => _storage.deleteActiveUserId();

  Future<void> saveActiveUserId(int id) => _storage.saveActiveUserId(id);
}
