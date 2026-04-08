
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/repository/app_setting_repository.dart';
import '../data/repository/app_setting_repository_impl.dart';
import 'app_setting_service.dart';

final appSettingServiceProvider=Provider<AppSettingService>((ref){
  final localRepository=ref.watch(appSettingRepositoryProvider);
  return AppSettingServiceImpl(localRepository);
});

class AppSettingServiceImpl implements AppSettingService{
  final AppSettingRepository _repository;
  AppSettingServiceImpl(this._repository);
  @override
  Future<void> saveNotification(bool isNotificationEnabled) =>_repository.saveNotification(isNotificationEnabled);

  @override
  Future<bool?> getNotification() =>_repository.getNotification();

  @override
  Future<void> saveRemindBefore(int remindBefore) =>_repository.saveRemindBefore(remindBefore);

  @override
  Future<int?> getRemindBefore() =>_repository.getRemindBefore();

  @override
  Future<void> saveCategories(List<String> categories) =>_repository.saveCategories(categories);

  @override
  Future<List<String>?> getCategories() =>_repository.getCategories();

  @override
  Future<void> saveLanguage(String language) =>_repository.saveLanguage(language);

  @override
  Future<String?> getLanguage() =>_repository.getLanguage();

  @override
  Future<void> saveTheme(String theme) =>_repository.saveTheme(theme);

  @override
  Future<String?> getTheme() =>_repository.getTheme();

}
