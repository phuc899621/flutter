import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/auth/data/dto/res/login/login_data.dart';
import 'package:taskit/features/auth/data/source/local/iauth_local.dart';
import 'package:taskit/shared/data/source/local/drift/dao/category.dart';
import 'package:taskit/shared/data/source/local/drift/dao/task.dart';
import 'package:taskit/shared/data/source/local/drift/dao/user.dart';
import 'package:taskit/shared/data/source/local/drift/database/database.dart';
import 'package:taskit/shared/data/source/local/token_source.dart';
import 'package:taskit/shared/log/logger_provider.dart';

import '../../../../../shared/data/source/local/drift/dao/setting.dart';
import '../../../../../shared/data/source/local/drift/dao/subtask.dart';

final authLocalDataSourceProvider = Provider<IAuthLocalDataSource>((ref) {
  final userDao = ref.watch(userDaoProvider);
  final settingDao = ref.watch(settingDaoProvider);
  final taskDao = ref.watch(taskDaoProvider);
  final categoryDao = ref.watch(categoryDaoProvider);
  final subtaskDao = ref.watch(subtaskDaoProvider);
  final db = ref.watch(appDatabaseProvider);
  final tokenSource = ref.watch(tokenSourceProvider);
  return AuthLocalDataSource(
    db: db,
    userDao: userDao,
    settingDao: settingDao,
    taskDao: taskDao,
    categoryDao: categoryDao,
    subtaskDao: subtaskDao,
    tokenSource: tokenSource,
  );
});

class AuthLocalDataSource implements IAuthLocalDataSource {
  final UserDao userDao;
  final SettingDao settingDao;
  final TaskDao taskDao;
  final CategoryDao categoryDao;
  final SubtaskDao subtaskDao;
  final AppDatabase db;
  final TokenSource tokenSource;

  AuthLocalDataSource({
    required this.db,
    required this.userDao,
    required this.settingDao,
    required this.categoryDao,
    required this.taskDao,
    required this.subtaskDao,
    required this.tokenSource,
  });

  @override
  Future<void> cacheLogin(LoginData loginData) async {
    try {
      tokenSource.saveToken(loginData.token);
      db.transaction(() async {
        await userDao.deleteIfExist();
        final userLocalId = await userDao.insertUser(UserTableCompanion(
          remoteId: Value(loginData.user.id),
          name: Value(loginData.user.name),
          email: Value(loginData.user.email),
          avatar: Value(loginData.user.avatar),
        ));
        await settingDao.insertSetting(SettingTableCompanion(
          remoteId: Value(loginData.settings.id),
          userLocalId: Value(userLocalId),
          isNotificationEnabled:
              Value(loginData.settings.isNotificationEnabled),
          theme: Value(loginData.settings.theme),
          language: Value(loginData.settings.language),
          remindBefore: Value(loginData.settings.remindBefore),
          isSynced: const Value(true),
        ));
        final categories = loginData.categories
            .map((e) => CategoryTableCompanion(
                  remoteId: Value(e.id),
                  name: Value(e.name),
                  userLocalId: Value(userLocalId),
                  isSynced: const Value(true),
                  createdAt: Value(e.createdAt),
                  updatedAt: Value(e.updatedAt),
                ))
            .toList();
        await categoryDao.insertAllCategories(categories);
        final categoryTableDatas = await categoryDao.getCategories();
        logger.i('categoryTableDatas:$categoryTableDatas');
        final taskCompanions = loginData.tasks.map((e) {
          final category = categoryTableDatas.firstWhere(
            (element) => element.remoteId == e.categoryId,
            orElse: () => categoryTableDatas.firstWhere(
              (element) => element.name.toLowerCase() == 'any',
            ),
          );
          return TaskTableCompanion(
            remoteId: Value(e.id),
            title: Value(e.title),
            description: Value(e.description),
            categoryLocalId: Value(category.localId),
            priority: Value(e.priority),
            userLocalId: Value(userLocalId),
            status: Value(e.status),
            dueDate: Value(e.dueDate?.toLocal()),
            hasTime: Value(e.hasTime),
            createdAt: Value(e.updatedAt),
            updatedAt: Value(e.createdAt),
            isSynced: const Value(true),
          );
        }).toList();

        await taskDao.insertAllTasks(taskCompanions);
        final subtaskCompanions = await Future.wait(
          loginData.tasks.map((task) async {
            final taskData = await taskDao.getTaskByRemoteId(task.id);
            if (taskData == null) {
              return const <SubtaskTableCompanion>[];
            }
            return task.subtasks
                .map((e) => SubtaskTableCompanion(
                      remoteId: Value(e.id),
                      title: Value(e.title),
                      isCompleted: Value(e.isCompleted),
                      taskLocalId: Value(taskData.localId),
                      isSynced: const Value(true),
                      createdAt: Value(e.createdAt),
                      updatedAt: Value(e.updatedAt),
                    ))
                .toList();
          }),
        ).then((list) => list.expand((x) => x).toList());
        await subtaskDao.insertAllSubtasks(subtaskCompanions);
      });

      return;
    } catch (e, s) {
      debugPrint('error at cacheLogin:$e $s');
      throw Exception(e);
    }
  }
}
