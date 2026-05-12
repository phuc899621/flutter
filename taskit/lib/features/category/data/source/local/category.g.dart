// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// ignore_for_file: type=lint
mixin _$CategoryDaoMixin on DatabaseAccessor<AppDatabase> {
  $UserTableTable get userTable => attachedDatabase.userTable;

  $CategoryTableTable get categoryTable => attachedDatabase.categoryTable;

  $TaskTableTable get taskTable => attachedDatabase.taskTable;

  CategoryDaoManager get managers => CategoryDaoManager(this);
}

class CategoryDaoManager {
  final _$CategoryDaoMixin _db;

  CategoryDaoManager(this._db);

  $$UserTableTableTableManager get userTable =>
      $$UserTableTableTableManager(_db.attachedDatabase, _db.userTable);

  $$CategoryTableTableTableManager get categoryTable =>
      $$CategoryTableTableTableManager(_db.attachedDatabase, _db.categoryTable);

  $$TaskTableTableTableManager get taskTable =>
      $$TaskTableTableTableManager(_db.attachedDatabase, _db.taskTable);
}
