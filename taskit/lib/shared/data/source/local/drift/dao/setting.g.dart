// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting.dart';

// ignore_for_file: type=lint
mixin _$SettingDaoMixin on DatabaseAccessor<AppDatabase> {
  $UserTableTable get userTable => attachedDatabase.userTable;
  $SettingTableTable get settingTable => attachedDatabase.settingTable;
  SettingDaoManager get managers => SettingDaoManager(this);
}

class SettingDaoManager {
  final _$SettingDaoMixin _db;
  SettingDaoManager(this._db);
  $$UserTableTableTableManager get userTable =>
      $$UserTableTableTableManager(_db.attachedDatabase, _db.userTable);
  $$SettingTableTableTableManager get settingTable =>
      $$SettingTableTableTableManager(_db.attachedDatabase, _db.settingTable);
}
