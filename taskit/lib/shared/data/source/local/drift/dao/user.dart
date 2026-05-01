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

  Stream<UserTableData> watchUserByLocalId(int localId) => (select(
    userTable,
  )..where((tbl) => tbl.localId.equals(localId))).watchSingle();

  /*
  * Read
  * */
  Future<UserTableData?> getUser() => select(userTable).getSingleOrNull();

  Future<int> getUserLocalId() =>
      select(userTable).getSingle().then((value) => value.localId);

  Future<UserTableData?> getUserByLocalId(int localId) => (select(
    userTable,
  )..where((tbl) => tbl.localId.equals(localId))).getSingleOrNull();

  Future<UserTableData?> getUserByRemoteId(String remoteId) => (select(
    userTable,
  )..where((tbl) => tbl.remoteId.equals(remoteId))).getSingleOrNull();

  Future<UserTableData?> getPreviousUser() =>
      (select(userTable)
            ..orderBy([
              (t) => OrderingTerm(
                expression: t.updatedAt,
                mode: OrderingMode.desc,
              ),
            ])
            ..limit(1))
          .getSingleOrNull();

  /*
  * Insert
  * */
  Future<int> insertUser(UserTableCompanion user) =>
      into(userTable).insert(user);

  /*
  * Update
  * */
  Future<bool> updateUser(UserTableCompanion user) =>
      update(userTable).replace(user);

  /*
  * Delete
  * */
  Future<int> deleteUser(int localId) =>
      (delete(userTable)..where((tbl) => tbl.localId.equals(localId))).go();
}
