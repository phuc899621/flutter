abstract class SessionStorage {
  Future<void> saveActiveUserId(int id);

  int? getActiveUserId();

  Future<void> deleteActiveUserId();

  Future<void> saveLastSyncTime(String time);

  String? getLastSyncTime();

  Future<void> deleteLastSyncTime();
}
