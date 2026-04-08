import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskit/shared/extension/string_hardcoded.dart';

final appSettingLocalStorageProvider=FutureProvider<SharedPreferences>((ref) async {
  return SharedPreferences.getInstance();
});

final appSettingLocalSourceProvider=Provider<AppSettingLocalSource>((ref){
  final storage=ref.watch(appSettingLocalStorageProvider);
  return AppSettingLocalSource(storage);
});


class AppSettingLocalSource {

  final AsyncValue<SharedPreferences> _storage;
  static final String _notificationKey = 'isNotificationEnabled'.hardcoded;
  static final String _languageKey = 'language'.hardcoded;
  static final String _themeKey = 'theme'.hardcoded;
  static final String _remindBeforeKey = 'remindBefore'.hardcoded;
  static final String _categoriesKey = 'categories'.hardcoded;

  AppSettingLocalSource(this._storage);
  Future<SharedPreferences> get _instance async => _storage.requireValue;

  Future<void> saveNotification(bool isNotificationEnabled) async {
    final storage = await _instance;
    await storage.setBool(_notificationKey, isNotificationEnabled);
  }

  Future<bool?> getNotification() async {
    final storage = await _instance;
    return storage.getBool(_notificationKey);
  }
  Future<void> saveRemindBefore(int remindBefore) async {
    final storage = await _instance;
    await storage.setInt(_remindBeforeKey, remindBefore);
  }
  Future<int?> getRemindBefore() async {
    final storage = await _instance;
    return storage.getInt(_remindBeforeKey);
  }
  Future<void> saveCategories(List<String> categories) async {
    final storage = await _instance;
    await storage.setStringList(_categoriesKey, categories);
  }
  Future<List<String>?> getCategories() async {
    final storage = await _instance;
    return storage.getStringList(_categoriesKey);
  }
  Future<void> saveLanguage(String language) async {
    final storage = await _instance;
    await storage.setString(_languageKey, language);
  }
  Future<String?> getLanguage() async {
    final storage = await _instance;
    return storage.getString(_languageKey);
  }
  Future<void> saveTheme(String theme) async {
    final storage = await _instance;
    await storage.setString(_themeKey, theme);
  }
  Future<String?> getTheme() async {
    final storage = await _instance;
    return storage.getString(_themeKey);
  }
}
