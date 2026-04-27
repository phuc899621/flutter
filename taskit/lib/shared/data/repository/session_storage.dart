abstract class SessionStorage {
  Future<void> saveActiveUserId(int id);

  int? getActiveUserId();

  Future<void> deleteActiveUserId();
}
