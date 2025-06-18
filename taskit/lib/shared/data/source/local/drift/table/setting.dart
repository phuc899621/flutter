import 'package:drift/drift.dart';
import 'package:taskit/shared/data/source/local/drift/table/user.dart';

class SettingTable extends Table {
  @override
  String get tableName => 'setting';

  IntColumn get localId => integer().autoIncrement()();

  TextColumn get remoteId => text().withDefault(const Constant(''))();

  IntColumn get userLocalId =>
      integer().references(UserTable, #localId, onDelete: KeyAction.cascade)();

  BoolColumn get isNotificationEnabled => boolean()();

  TextColumn get language => text()();

  TextColumn get theme => text()();

  IntColumn get remindBefore => integer()();

  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();
}
