import 'package:drift/drift.dart';

class SettingTable extends Table {
  @override
  String get tableName => 'setting';
  IntColumn get localId => integer().autoIncrement()();
  TextColumn get remoteId => text().withDefault(const Constant(''))();
  IntColumn get userLocalId => integer()
      .customConstraint('REFERENCES user(localId) ON DELETE CASCADE')();
  BoolColumn get isNotificationEnabled => boolean()();
  TextColumn get language => text()();
  TextColumn get theme => text()();
  IntColumn get remindBefore => integer()();
  BoolColumn get isSynced => boolean()();
}
