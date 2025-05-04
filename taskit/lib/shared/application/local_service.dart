
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/repository/ilocal_repository.dart';
import '../data/repository/local_repository.dart';
import 'ilocal_service.dart';

final localServiceProvider=Provider<ILocalService>((ref){
  return LocalService(ref.read(localRepositoryProvider));
});

class LocalService implements ILocalService{
  final ILocalRepository _iLocalRepository;
  LocalService(this._iLocalRepository);
  @override
  Future<void> saveNotification(bool isNotificationEnabled) =>_iLocalRepository.saveNotification(isNotificationEnabled);

  @override
  Future<bool?> getNotification() =>_iLocalRepository.getNotification();

  @override
  Future<void> saveRemindBefore(int remindBefore) =>_iLocalRepository.saveRemindBefore(remindBefore);

  @override
  Future<int?> getRemindBefore() =>_iLocalRepository.getRemindBefore();

  @override
  Future<void> saveCategories(List<String> categories) =>_iLocalRepository.saveCategories(categories);

  @override
  Future<List<String>?> getCategories() =>_iLocalRepository.getCategories();

  @override
  Future<void> saveLanguage(String language) =>_iLocalRepository.saveLanguage(language);

  @override
  Future<String?> getLanguage() =>_iLocalRepository.getLanguage();

  @override
  Future<void> saveTheme(String theme) =>_iLocalRepository.saveTheme(theme);

  @override
  Future<String?> getTheme() =>_iLocalRepository.getTheme();

}
