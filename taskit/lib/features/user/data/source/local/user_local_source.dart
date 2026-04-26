import 'package:taskit/features/auth/data/dto/res/user/user_data.dart';

import '../../../../../shared/data/source/local/drift/database/database.dart';

abstract interface class UserLocalSource {
  Stream<UserTableData> watchUserByLocalId(int localId);

  Future<UserTableData?> getUserByLocalId(int localId);

  Future<int> cacheUser(UserData data);
}
