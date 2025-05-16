import 'dart:async';

import 'package:floor/floor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:taskit/features/task/domain/entities/category.dart';

import '../../model/task.dart';
import 'DAO/task_DAO.dart';
import 'converter/type_converter.dart';

part 'task_database.g.dart';

final taskDatabaseProvider = Provider<TaskDatabase>((ref) {
  throw UnimplementedError();
});

@Database(version: 1, entities: [TaskModel, CategoryModel])
abstract class TaskDatabase extends FloorDatabase {
  TaskDAO get taskDAO;
}
