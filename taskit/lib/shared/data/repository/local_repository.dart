import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/shared/data/repository/ilocal_repository.dart';

import '../source/local/local_source.dart';

final localRepositoryProvider=Provider<ILocalRepository>((ref){
  return LocalRepository(ref.read(localSourceProvider));
});



class LocalRepository implements ILocalRepository{
  final LocalSource _localSource;
  LocalRepository(this._localSource);

  @override
  Future<List<String>?> getCategories()=>_localSource.getCategories();

  @override
  Future<String?> getLanguage() =>_localSource.getLanguage();

  @override
  Future<bool?> getNotification() =>_localSource.getNotification();

  @override
  Future<int?> getRemindBefore() =>_localSource.getRemindBefore();

  @override
  Future<String?> getTheme() =>_localSource.getTheme();

  @override
  Future<void> saveCategories(List<String> categories) =>_localSource.saveCategories(categories);

  @override
  Future<void> saveLanguage(String language) =>_localSource.saveLanguage(language);

  @override
  Future<void> saveNotification(bool isNotificationEnabled) =>_localSource.saveNotification(isNotificationEnabled);

  @override
  Future<void> saveRemindBefore(int remindBefore) =>_localSource.saveRemindBefore(remindBefore);
  @override
  Future<void> saveTheme(String theme) =>_localSource.saveTheme(theme);

}