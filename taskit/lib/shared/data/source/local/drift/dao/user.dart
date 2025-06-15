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
  /*
  * Read
  * */
  Future<UserTableData?> getUser() => select(userTable).getSingleOrNull();
  Future<int> getUserLocalId() =>
      select(userTable).getSingle().then((value) => value.localId);
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
  Future<int> deleteUser() => delete(userTable).go();
  //delete user if exist
  Future<void> deleteIfExist() async {
    final user = await getUser();
    if (user != null) {
      await deleteUser();
    }
  }
}
