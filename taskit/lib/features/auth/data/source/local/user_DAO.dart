import 'package:floor/floor.dart';

import '../../model/user.dart';

@dao
abstract class UserDAO {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insert(UserModel user);
  @Query('SELECT * FROM user LIMIT 1')
  Future<UserModel?> getUser();
}
