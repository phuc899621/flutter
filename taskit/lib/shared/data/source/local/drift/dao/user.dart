import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../database/database.dart';
import '../table/user.dart';

part 'user.g.dart';

final userDaoProvider = Provider<UserDao>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return UserDao(db);
});

@DriftAccessor(tables: [UserTable])
class UserDao extends DatabaseAccessor<AppDatabase> with _$UserDaoMixin {
  UserDao(super.db);

  Stream<UserTableData> watchById(int localId) => (select(
    userTable,
  )..where((tbl) => tbl.localId.equals(localId))).watchSingle();

  //region READ
  Future<UserTableData?> findById(int localId) => (select(
    userTable,
  )..where((tbl) => tbl.localId.equals(localId))).getSingleOrNull();

  Future<UserTableData?> findByRemoteId(String remoteId) => (select(
    userTable,
  )..where((tbl) => tbl.remoteId.equals(remoteId))).getSingleOrNull();

  Future<UserTableData?> findPrevious() =>
      (select(userTable)
            ..orderBy([
              (t) => OrderingTerm(
                expression: t.updatedAt,
                mode: OrderingMode.desc,
              ),
            ])
            ..limit(1))
          .getSingleOrNull();

  //endregion

  //region INSERT
  Future<int> insertOne(UserTableCompanion user) =>
      into(userTable).insert(user);

  //endregion

  //region UPDATE
  Future<bool> updateOne(UserTableCompanion user) =>
      update(userTable).replace(user);

  //endregion

  //region DELETE
  Future<int> deleteOne(int localId) =>
      (delete(userTable)..where((tbl) => tbl.localId.equals(localId))).go();
  //endregion
}
