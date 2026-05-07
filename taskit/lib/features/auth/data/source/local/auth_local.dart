import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/auth/data/dto/res/user/user_data.dart';
import 'package:taskit/shared/data/source/local/drift/dao/user.dart';
import 'package:taskit/shared/data/source/local/drift/database/database.dart';

final authLocalDataSourceProvider = Provider<AuthLocalDataSource>((ref) {
  final userDao = ref.watch(userDaoProvider);
  final db = ref.watch(appDatabaseProvider);
  return AuthLocalDataSource(db: db, userDao: userDao);
});

class AuthLocalDataSource {
  final UserDao userDao;
  final AppDatabase db;

  AuthLocalDataSource({required this.db, required this.userDao});

  Future<int> cacheUser(UserData data) async {
    try {
      return db.transaction(() async {
        final userTableData = await userDao.findByRemoteId(data.id);
        if (userTableData != null) {
          await userDao.updateOne(
            UserTableCompanion(
              localId: Value(userTableData.localId),
              remoteId: Value(data.id),
              name: Value(data.name),
              email: Value(data.email),
              avatar: Value(data.avatar),
              updatedAt: Value(DateTime.now().toUtc()),
            ),
          );
          return userTableData.localId;
        } else {
          return await userDao.insertOne(
            UserTableCompanion(
              remoteId: Value(data.id),
              name: Value(data.name),
              email: Value(data.email),
              avatar: Value(data.avatar),
            ),
          );
        }
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
