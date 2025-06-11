import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/config/app/app_color.dart';
import 'package:taskit/config/routers/router_provider.dart';
import 'package:taskit/shared/data/source/local/drift/dao/category.dart';
import 'package:taskit/shared/data/source/local/drift/dao/setting.dart';
import 'package:taskit/shared/data/source/local/drift/dao/subtask.dart';
import 'package:taskit/shared/data/source/local/drift/dao/task.dart';
import 'package:taskit/shared/data/source/local/drift/dao/user.dart';
import 'package:taskit/shared/data/source/local/drift/database/database.dart';

class MainWidget extends ConsumerWidget {
  const MainWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);
    final db = ref.watch(appDatabaseProvider);
    final userDao = ref.watch(userDaoProvider);
    final settingDao = ref.watch(settingDaoProvider);
    final taskDao = ref.watch(taskDaoProvider);
    final categoryDao = ref.watch(categoryDaoProvider);
    final subtaskDao = ref.watch(subtaskDaoProvider);
    db.transaction(() async {
      final user = await userDao.getUser();
      debugPrint("$user\n");
      final setting = await settingDao.getSetting();
      debugPrint("$setting\n");
      final tasks = await taskDao.getTasks();
      debugPrint("$tasks\n");
      final categories = await categoryDao.getCategories();
      debugPrint("$categories\n");
      final subtasks = await subtaskDao.getSubtasks();
      debugPrint("$subtasks\n");
    });
    return MaterialApp.router(
        routerConfig: router,
        theme: ThemeData(
            //primary
            primaryColor: ConstColor.primary,
            scaffoldBackgroundColor: ConstColor.primaryBackground,
            textTheme: const TextTheme(
              displaySmall: TextStyle(
                color: ConstColor.primaryText,
              ),
              labelMedium: TextStyle(
                color: ConstColor.secondaryText,
              ),
              bodyMedium: TextStyle(
                color: ConstColor.primaryText,
              ),
            ),

            //text
            colorScheme: const ColorScheme.light(
              primary: ConstColor.primary,
              secondary: ConstColor.secondary,
              primaryContainer: ConstColor.primaryContainer,
              secondaryContainer: ConstColor.secondaryBackground,
              onPrimary: ConstColor.onPrimary,
              onSecondary: ConstColor.onSecondary,
              onPrimaryContainer: ConstColor.primaryText,
              onSecondaryContainer: ConstColor.secondaryText,
              onError: ConstColor.error,
              onSurface: ConstColor.secondaryText,
            )));
  }
}
