// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// ignore_for_file: type=lint
mixin _$TaskDaoMixin on DatabaseAccessor<AppDatabase> {
  $UserTableTable get userTable => attachedDatabase.userTable;
  $CategoryTableTable get categoryTable => attachedDatabase.categoryTable;
  $TaskTableTable get taskTable => attachedDatabase.taskTable;
  $SubtaskTableTable get subtaskTable => attachedDatabase.subtaskTable;
  TaskDaoManager get managers => TaskDaoManager(this);
}

class TaskDaoManager {
  final _$TaskDaoMixin _db;
  TaskDaoManager(this._db);
  $$UserTableTableTableManager get userTable =>
      $$UserTableTableTableManager(_db.attachedDatabase, _db.userTable);
  $$CategoryTableTableTableManager get categoryTable =>
      $$CategoryTableTableTableManager(_db.attachedDatabase, _db.categoryTable);
  $$TaskTableTableTableManager get taskTable =>
      $$TaskTableTableTableManager(_db.attachedDatabase, _db.taskTable);
  $$SubtaskTableTableTableManager get subtaskTable =>
      $$SubtaskTableTableTableManager(_db.attachedDatabase, _db.subtaskTable);
}
