import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

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
    return driftDatabase(
      name: 'db',
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }
}
