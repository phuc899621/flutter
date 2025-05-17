import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/task/data/source/local/task_database.dart';
import 'package:taskit/main_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = await $FloorTaskDatabase
      .databaseBuilder('taskit.db')
      .addMigrations([migration2]).build();
  final db = database.database;
  final tables =
      await db.rawQuery("SELECT name FROM sqlite_master WHERE type='table'");
  for (final table in tables) {
    debugPrint(table.toString() + "//++");
  }
  runApp(ProviderScope(overrides: [
    taskDatabaseProvider.overrideWithValue(database),
  ], child: const MainWidget()));
}

final migration2 = Migration(2, 3, (database) async {
  await database.execute('ALTER TABLE category RENAME TO categories');
});
