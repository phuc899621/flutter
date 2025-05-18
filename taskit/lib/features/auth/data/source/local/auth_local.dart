import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/auth/data/dto/res/login/login_data.dart';
import 'package:taskit/features/auth/data/dto/res/setting/setting_data.dart';
import 'package:taskit/features/auth/data/dto/res/user/user_data.dart';
import 'package:taskit/features/auth/data/source/local/iauth_local.dart';
import 'package:taskit/shared/data/source/local/drift/dao/category.dart';
import 'package:taskit/shared/data/source/local/drift/dao/task.dart';
import 'package:taskit/shared/data/source/local/drift/dao/user.dart';
import 'package:taskit/shared/data/source/local/drift/database/database.dart';

import '../../../../../shared/data/source/local/drift/dao/setting.dart';

final authLocalDataSourceProvider = Provider<AuthLocalDataSource>((ref) {
  final userDao = ref.watch(userDaoProvider);
  final settingDao = ref.watch(settingDaoProvider);
  final taskDao = ref.watch(taskDaoProvider);
  final categoryDao = ref.watch(categoryDaoProvider);
  final subtaskDao = ref.watch(subtaskDaoProvider);
  return AuthLocalDataSource(
    userDao: userDao,
    settingDao: settingDao,
    taskDao: taskDao,
    categoryDao: categoryDao,
    subtaskDao: subtaskDao,
  );
});


class AuthLocalDataSource implements IAuthLocalDataSource {
  final UserDao userDao;
  final SettingDao settingDao;
  final TaskDao taskDao;
  final CategoryDao categoryDao;
  final SubtaskDao subtaskDao;
  AuthLocalDataSource({
    required this.userDao,
    required this.settingDao,
    required this.categoryDao,
    required this.taskDao,
    required this.subtaskDao,})

  @override
  Future<void> cacheLogin(LoginData loginData) async {
    try{
      final userLocalId= await userDao.insertUser(UserTableCompanion(
        remoteId:Value(loginData.user.id),
        name: Value(loginData.user.name),
        email: Value(loginData.user.email),
        avatar: Value(loginData.user.avatar),
      ));
      await settingDao.insertSetting(SettingTableCompanion(
        remoteId: Value(loginData.settings.id),
        userLocalId: Value(userLocalId),
        isNotificationEnabled: Value(loginData.settings.isNotificationEnabled),
        theme: Value(loginData.settings.theme),
        language: Value(loginData.settings.language),
        remindBefore: Value(loginData.settings.remindBefore),
      ));
      final categoryList=loginData.settings.categories.map((e) => CategoryTableCompanion(
        remoteId: Value(e),
        name: Value(e.name),
      )).toList();
      await categoryDao.insertAllCategories();
      await taskDao.insertAllTasks(loginData.tasks);

      return;
    }catch(e,s){
      return Future.error(e);
    }
  }
}
