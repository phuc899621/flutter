import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/task/data/source/local/task_database.dart';
import 'package:taskit/main_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database =
      await $FloorTaskDatabase.databaseBuilder('taskit.db').build();
  runApp(ProviderScope(overrides: [
    taskDatabaseProvider.overrideWithValue(database),
  ], child: const MainWidget()));
}
