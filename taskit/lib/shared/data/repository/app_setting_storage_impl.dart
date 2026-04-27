import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../extension/string_hardcoded.dart';
import '../source/local/storage_provider.dart';
import 'app_setting_storage.dart';

final appSettingStorageProvider = Provider<AppSettingStorage>((ref) {
  final localSource = ref.read(localStorageProvider).requireValue;
  return AppSettingStorageImpl(localSource);
});

class AppSettingStorageImpl implements AppSettingStorage {
  final SharedPreferences _storage;

  AppSettingStorageImpl(this._storage);

  static final String _notificationKey = 'IS_NOTIFICATION_ENABLED'.hardcoded;
  static final String _languageKey = 'LANGUAGE'.hardcoded;
  static final String _themeKey = 'THEME'.hardcoded;
  static final String _remindBeforeKey = 'REMIND_BEFORE'.hardcoded;
  static final String _categoriesKey = 'CATEGORIES'.hardcoded;

  @override
  Future<void> saveNotification(bool isNotificationEnabled) async =>
      _storage.setBool(_notificationKey, isNotificationEnabled);

  @override
  Future<bool?> getNotification() async => _storage.getBool(_notificationKey);

  @override
  Future<void> saveRemindBefore(int remindBefore) async =>
      _storage.setInt(_remindBeforeKey, remindBefore);

  @override
  Future<int?> getRemindBefore() async => _storage.getInt(_remindBeforeKey);

  @override
  Future<void> saveCategories(List<String> categories) async =>
      _storage.setStringList(_categoriesKey, categories);

  @override
  Future<List<String>?> getCategories() async =>
      _storage.getStringList(_categoriesKey);

  @override
  Future<void> saveLanguage(String language) async =>
      _storage.setString(_languageKey, language);

  @override
  Future<String?> getLanguage() async => _storage.getString(_languageKey);

  @override
  Future<void> saveTheme(String theme) async =>
      _storage.setString(_themeKey, theme);

  @override
  Future<String?> getTheme() async => _storage.getString(_themeKey);
}
