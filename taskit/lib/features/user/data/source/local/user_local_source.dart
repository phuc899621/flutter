import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/shared/data/source/local/drift/database/database.dart';

import '../../../../../shared/data/source/local/drift/dao/user.dart';
import 'iuser_local_source.dart';

final userLocalSourceProvider = Provider<IUserLocalSource>((ref) {
  final userDao = ref.watch(userDaoProvider);
  return UserLocalSource(userDao);
});

class UserLocalSource implements IUserLocalSource {
  final UserDao userDao;

  UserLocalSource(this.userDao);

  //region WATCH
  @override
  Stream<UserTableData> watchUser() => userDao.watchUser();

  //endregion
  //region READ
  @override
  Future<int> getUserLocalId() => userDao.getUserLocalId();

  @override
  Future<UserTableData?> getUser() => userDao.getUser();
//endregion
}
