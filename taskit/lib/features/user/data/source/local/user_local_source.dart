import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../shared/data/source/local/drift/dao/user.dart';
import 'iuser_local_source.dart';

final userLocalSourceProvider = Provider<IUserLocalSource>((ref) {
  final userDao = ref.watch(userDaoProvider);
  return UserLocalSource(userDao);
});

class UserLocalSource implements IUserLocalSource {
  final UserDao userDao;
  UserLocalSource(this.userDao);

  @override
  Future<int> getUserLocalId() {
    return userDao.getUserLocalId();
  }
}
