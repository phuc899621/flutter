import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/shared/config/app/theme/app_color.dart';
import 'package:taskit/shared/config/routers/router_provider.dart';
import 'package:taskit/shared/data/source/local/drift/dao/category.dart';
import 'package:taskit/shared/data/source/local/drift/dao/setting.dart';
import 'package:taskit/shared/data/source/local/drift/dao/subtask.dart';
import 'package:taskit/shared/data/source/local/drift/dao/task.dart';
import 'package:taskit/shared/data/source/local/drift/dao/user.dart';
import 'package:taskit/shared/data/source/local/drift/database/database.dart';
import 'package:taskit/shared/data/source/remote/google_sign_in.dart';
import 'package:taskit/shared/log/logger_provider.dart';

final languageCodeProvider = Provider<String>((ref) {
  final locale = WidgetsBinding.instance.platformDispatcher.locale;
  return locale.languageCode;
});

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
    final googleInit = ref.watch(googleInitProvider);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColor.primary, // iOS
      ),
    );
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
    final languageCode = ref.read(languageCodeProvider);
    logger.i(languageCode);
    return MaterialApp.router(
      routerConfig: router,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Quicksand',
        //primary
        primaryColor: AppColor.primary,
        scaffoldBackgroundColor: AppColor.surface,
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            color: AppColor.onPrimary,
            fontWeight: FontWeight.w700,
          ),
          headlineSmall: TextStyle(
            color: AppColor.onPrimary,
            fontWeight: FontWeight.w700,
          ),
          headlineLarge: TextStyle(
            color: AppColor.onPrimary,
            fontWeight: FontWeight.w700,
          ),
          titleLarge: TextStyle(fontWeight: FontWeight.w500),
          titleMedium: TextStyle(fontWeight: FontWeight.w500),
          labelMedium: TextStyle(fontWeight: FontWeight.w500),
          labelSmall: TextStyle(fontWeight: FontWeight.w500),
          labelLarge: TextStyle(fontWeight: FontWeight.w500),
          bodyLarge: TextStyle(fontWeight: FontWeight.w500),
          bodyMedium: TextStyle(fontWeight: FontWeight.w500),
          bodySmall: TextStyle(fontWeight: FontWeight.w500),
          displayLarge: TextStyle(
            fontWeight: FontWeight.w600,
            color: AppColor.onPrimary,
          ),
          displayMedium: TextStyle(
            fontWeight: FontWeight.w600,
            color: AppColor.onPrimary,
          ),
          displaySmall: TextStyle(
            fontWeight: FontWeight.w600,
            color: AppColor.onPrimary,
          ),
        ),

        //text
        colorScheme: const ColorScheme.light(
          primary: AppColor.primary,
          onPrimary: AppColor.onPrimary,
          primaryContainer: AppColor.primaryContainer,
          onPrimaryContainer: AppColor.onPrimaryContainer,
          secondary: AppColor.secondary,
          onSecondary: AppColor.onSecondary,
          secondaryContainer: AppColor.secondaryContainer,
          onSecondaryContainer: AppColor.onSecondaryContainer,
          tertiary: AppColor.tertiary,
          onTertiary: AppColor.onTertiary,
          tertiaryContainer: AppColor.tertiaryContainer,
          onTertiaryContainer: AppColor.onTertiaryContainer,
          surface: AppColor.surface,
          surfaceDim: AppColor.surfaceDim,
          surfaceContainer: AppColor.surfaceContainer,
          surfaceContainerHighest: AppColor.surfaceContainerHighest,
          surfaceContainerHigh: AppColor.surfaceContainerHigh,
          surfaceContainerLow: AppColor.surfaceContainerLow,
          surfaceContainerLowest: AppColor.surfaceContainerLowest,
          onSurface: AppColor.primaryText,
          onSurfaceVariant: AppColor.secondaryText,
          outline: AppColor.outline,
          outlineVariant: AppColor.outlineVariant,
          error: AppColor.error,
          onError: AppColor.onError,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColor.primary,
          foregroundColor: AppColor.onPrimary,
        ),
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: AppColor.surfaceContainerLow,
          elevation: 10,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          indicatorColor: AppColor.primaryContainer,
          indicatorShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColor.surfaceContainer,
          selectedItemColor: AppColor.primaryContainer,
          unselectedItemColor: AppColor.surfaceContainer,
          selectedIconTheme: IconThemeData(color: AppColor.onPrimaryContainer),
          unselectedIconTheme: IconThemeData(color: AppColor.onSurfaceVariant),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppColor.primary,
          foregroundColor: AppColor.onPrimary,
        ),
      ),
    );
  }
}
