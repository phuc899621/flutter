import 'package:drift/drift.dart';

class CategoryTable extends Table {
  IntColumn get localId => integer().autoIncrement()();
  TextColumn get remoteId => text().withDefault(const Constant(''))();
  TextColumn get name => text()();
  BoolColumn get isSync => boolean()();
  IntColumn get settingLocalId => integer()
      .nullable()
      .customConstraint('REFERENCES setting(localId) ON DELETE CASCADE')();

  @override
  String get tableName => 'category';
}
