// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subtask.dart';

// ignore_for_file: type=lint
mixin _$SubtaskDaoMixin on DatabaseAccessor<AppDatabase> {
  $UserTableTable get userTable => attachedDatabase.userTable;
  $CategoryTableTable get categoryTable => attachedDatabase.categoryTable;
  $TaskTableTable get taskTable => attachedDatabase.taskTable;
  $SubtaskTableTable get subtaskTable => attachedDatabase.subtaskTable;
  SubtaskDaoManager get managers => SubtaskDaoManager(this);
}

class SubtaskDaoManager {
  final _$SubtaskDaoMixin _db;
  SubtaskDaoManager(this._db);
  $$UserTableTableTableManager get userTable =>
      $$UserTableTableTableManager(_db.attachedDatabase, _db.userTable);
  $$CategoryTableTableTableManager get categoryTable =>
      $$CategoryTableTableTableManager(_db.attachedDatabase, _db.categoryTable);
  $$TaskTableTableTableManager get taskTable =>
      $$TaskTableTableTableManager(_db.attachedDatabase, _db.taskTable);
  $$SubtaskTableTableTableManager get subtaskTable =>
      $$SubtaskTableTableTableManager(_db.attachedDatabase, _db.subtaskTable);
}
