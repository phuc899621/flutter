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

  Future<UserTableData> getUser() => select(userTable).getSingle();
  Future<int> insertUser(UserTableCompanion user) =>
      into(userTable).insert(user);
  Future<bool> updateUser(UserTableCompanion user) =>
      update(userTable).replace(user);
  Future<int> deleteUser() => delete(userTable).go();
}
