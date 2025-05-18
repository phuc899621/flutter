import 'package:drift/drift.dart';

class UserTable extends Table {
  @override
  String get tableName => 'user';
  IntColumn get localId => integer().autoIncrement()();
  TextColumn get remoteId => text().withDefault(const Constant(''))();
  TextColumn get email => text()();
  TextColumn get name => text()();
  TextColumn get avatar => text()();
}
