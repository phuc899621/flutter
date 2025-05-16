import 'dart:async';

import 'package:floor/floor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../../../../../shared/data/source/local/type_converter.dart';
import '../../../../auth/data/model/setting.dart';
import '../../../../auth/data/model/user.dart';
import '../../../../auth/data/source/local/setting_DAO.dart';
import '../../../../auth/data/source/local/user_DAO.dart';
import '../../model/category.dart';
import '../../model/task.dart';
import 'DAO/category_DAO.dart';
import 'DAO/task_DAO.dart';

part 'task_database.g.dart';

final taskDatabaseProvider = Provider<TaskDatabase>((ref) {
  throw UnimplementedError();
});

@Database(
    version: 1, entities: [TaskModel, CategoryModel, UserModel, SettingModel])
abstract class TaskDatabase extends FloorDatabase {
  TaskDAO get taskDAO;
  UserDAO get userDAO;
  SettingDAO get settingDAO;
  CategoryDAO get categoryDAO;
}
