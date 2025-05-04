import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:taskit/shared/extension/string_hardcoded.dart';


final localStorageProvider=Provider<FlutterSecureStorage>((ref){
  return const FlutterSecureStorage();
});

final localSourceProvider=Provider<LocalSource>((ref){
  return LocalSource(ref.read(localStorageProvider));
});


class LocalSource {

  final FlutterSecureStorage _storage;
  static final String _notificationKey = 'isNotificationEnabled'.hardcoded;
  static final String _languageKey = 'language'.hardcoded;
  static final String _themeKey = 'theme'.hardcoded;
  static final String _remindBeforeKey = 'remindBefore'.hardcoded;
  static final String _categoriesKey = 'categories'.hardcoded;

  LocalSource(this._storage);

  Future<void> saveNotification(bool isNotificationEnabled) async {
    await _storage.write(key: _notificationKey, value: isNotificationEnabled.toString());
  }

  Future<bool?> getNotification() async {
    final value = await _storage.read(key: _notificationKey);
    if(value==null){
      return null;
    }
    return value=='true';
  }
  Future<void> saveRemindBefore(int remindBefore) async {
    await _storage.write(key: _remindBeforeKey, value: remindBefore.toString());
  }
  Future<int?> getRemindBefore() async {
    final value = await _storage.read(key: _remindBeforeKey);
    if(value==null){
      return null;
    }
    return int.tryParse(value);
  }
  Future<void> saveCategories(List<String> categories) async {
    await _storage.write(key: _categoriesKey, value: categories.join(','));
  }
  Future<List<String>?> getCategories() async {
    final value = await _storage.read(key: _categoriesKey);
    if(value==null){
      return null;
    }
    return value.split(',');
  }
  Future<void> saveLanguage(String language) async {
    await _storage.write(key: _languageKey, value: language);
  }
  Future<String?> getLanguage() async {
    final value = await _storage.read(key: _languageKey);
    if(value==null){
      return null;
    }
    return value;
  }
  Future<void> saveTheme(String theme) async {
    await _storage.write(key: _themeKey, value: theme);
  }
  Future<String?> getTheme() async {
    final value = await _storage.read(key: _themeKey);
    if(value==null){
      return null;
    }
    return value;
  }
}
