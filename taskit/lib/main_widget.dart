import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/config/routers/router_provider.dart';
import 'package:taskit/shared/data/source/local/drift/dao/category.dart';
import 'package:taskit/shared/data/source/local/drift/dao/setting.dart';
import 'package:taskit/shared/data/source/local/drift/dao/subtask.dart';
import 'package:taskit/shared/data/source/local/drift/dao/task.dart';
import 'package:taskit/shared/data/source/local/drift/dao/user.dart';
import 'package:taskit/shared/data/source/local/drift/database/database.dart';

import 'config/app/app_color.dart';

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
      final tasks = await taskDao.getAllTasks();
      debugPrint("$tasks\n");
      final categories = await categoryDao.getCategories();
      debugPrint("$categories\n");
      final subtasks = await subtaskDao.fetchSubtasks();
      debugPrint("$subtasks\n");
    });
    return MaterialApp.router(
      routerConfig: router,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Quicksand',
//primary
        primaryColor: ConstColor.primary,
        scaffoldBackgroundColor: ConstColor.surface,
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
              color: ConstColor.onPrimary, fontWeight: FontWeight.w600),
          headlineSmall: TextStyle(
              color: ConstColor.onPrimary, fontWeight: FontWeight.w600),
          titleLarge: TextStyle(fontWeight: FontWeight.w500),
          titleMedium: TextStyle(fontWeight: FontWeight.w500),
          labelMedium: TextStyle(fontWeight: FontWeight.w500),
          labelSmall: TextStyle(fontWeight: FontWeight.w500),
          labelLarge: TextStyle(fontWeight: FontWeight.w500),
        ),

//text
        colorScheme: const ColorScheme.light(
          primary: ConstColor.primary,
          onPrimary: ConstColor.onPrimary,
          primaryContainer: ConstColor.primaryContainer,
          onPrimaryContainer: ConstColor.onPrimaryContainer,
          secondary: ConstColor.secondary,
          onSecondary: ConstColor.onSecondary,
          secondaryContainer: ConstColor.secondaryContainer,
          onSecondaryContainer: ConstColor.onSecondaryContainer,
          tertiary: ConstColor.tertiary,
          onTertiary: ConstColor.onTertiary,
          tertiaryContainer: ConstColor.tertiaryContainer,
          onTertiaryContainer: ConstColor.onTertiaryContainer,
          surface: ConstColor.surface,
          surfaceDim: ConstColor.surfaceDim,
          surfaceContainer: ConstColor.surfaceContainer,
          surfaceContainerHighest: ConstColor.surfaceContainerHighest,
          surfaceContainerHigh: ConstColor.surfaceContainerHigh,
          surfaceContainerLow: ConstColor.surfaceContainerLow,
          surfaceContainerLowest: ConstColor.surfaceContainerLowest,
          onSurface: ConstColor.primaryText,
          onSurfaceVariant: ConstColor.secondaryText,
          outline: ConstColor.outline,
          outlineVariant: ConstColor.outlineVariant,
          error: ConstColor.error,
          onError: ConstColor.onError,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: ConstColor.primary,
          foregroundColor: ConstColor.onPrimary,
        ),
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: ConstColor.surfaceContainerLow,
          elevation: 10,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          indicatorColor: ConstColor.primaryContainer,
          indicatorShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: ConstColor.surfaceContainer,
            selectedItemColor: ConstColor.primaryContainer,
            unselectedItemColor: ConstColor.surfaceContainer,
            selectedIconTheme: IconThemeData(
              color: ConstColor.onPrimaryContainer,
            ),
            unselectedIconTheme: IconThemeData(
              color: ConstColor.onSurfaceVariant,
            )),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: ConstColor.primary,
          foregroundColor: ConstColor.onPrimary,
        ),
      ),
    );
  }
}
