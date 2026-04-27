import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/repository/app_setting_storage.dart';
import '../data/repository/app_setting_storage_impl.dart';

final appSettingServiceProvider = Provider<AppSettingService>((ref) {
  final localRepository = ref.watch(appSettingStorageProvider);
  return AppSettingService(localRepository);
});

class AppSettingService {
  final AppSettingStorage _storage;

  AppSettingService(this._storage);

  Future<void> saveNotification(bool isNotificationEnabled) =>
      _storage.saveNotification(isNotificationEnabled);

  Future<bool?> getNotification() => _storage.getNotification();

  Future<void> saveRemindBefore(int remindBefore) =>
      _storage.saveRemindBefore(remindBefore);

  Future<int?> getRemindBefore() => _storage.getRemindBefore();

  Future<void> saveCategories(List<String> categories) =>
      _storage.saveCategories(categories);

  Future<List<String>?> getCategories() => _storage.getCategories();

  Future<void> saveLanguage(String language) => _storage.saveLanguage(language);

  Future<String?> getLanguage() => _storage.getLanguage();

  Future<void> saveTheme(String theme) => _storage.saveTheme(theme);

  Future<String?> getTheme() => _storage.getTheme();
}
