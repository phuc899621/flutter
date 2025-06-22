import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:drift_local_storage_inspector/drift_local_storage_inspector.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:storage_inspector/storage_inspector.dart';
import 'package:taskit/shared/log/logger_provider.dart';

import '../dao/category.dart';
import '../dao/setting.dart';
import '../dao/subtask.dart';
import '../dao/task.dart';
import '../dao/user.dart';
import '../table/category.dart';
import '../table/setting.dart';
import '../table/subtask.dart';
import '../table/task.dart';
import '../table/user.dart';

part 'database.g.dart';

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});

@DriftDatabase(
    tables: [TaskTable, SubtaskTable, UserTable, SettingTable, CategoryTable],
    daos: [TaskDao, UserDao, SubtaskDao, SettingDao, CategoryDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        beforeOpen: (details) async {
          await customStatement('PRAGMA foreign_keys = ON;');
        },
      );

  static QueryExecutor _openConnection() {
    return LazyDatabase(() async {
      final dir = await getApplicationSupportDirectory();
      final path = p.join(dir.path, 'taskit_db.sqlite');
      final file = File(path);
      final executor = NativeDatabase(file, logStatements: true);

      if (kDebugMode) {
        _startInspector(executor);
      }

      return executor;
    });
  }

  static void _startInspector(QueryExecutor realDb) async {
    final driver =
        StorageServerDriver(bundleId: 'com.example.taskit_local', icon: '...');
    final driftDb = AppDatabase.forInspector(realDb);

    final sqlServer = DriftSQLDatabaseServer(
      id: "1",
      name: "Drift SQL Server",
      database: driftDb, // Your drift database
    );

    driver.addSQLServer(sqlServer);

    await driver.start();
    logger.i("Inspector started");
  }

  AppDatabase.forInspector(super.executor);

/*static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'db',
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }*/
}
