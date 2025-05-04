abstract interface class ILocalService{
  Future<void> saveNotification(bool isNotificationEnabled);
  Future<bool?> getNotification();
  Future<void> saveRemindBefore(int remindBefore);
  Future<int?> getRemindBefore();
  Future<void> saveCategories(List<String> categories);
  Future<List<String>?> getCategories();
  Future<void> saveLanguage(String language);
  Future<String?> getLanguage();
  Future<void> saveTheme(String theme);
  Future<String?> getTheme();
}