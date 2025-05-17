import 'package:floor/floor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../task/data/source/local/task_database.dart';
import '../../model/user.dart';

final userDAOProvider = Provider<UserDAO>((ref) {
  final database = ref.watch(taskDatabaseProvider);
  return database.userDAO;
});

@dao
abstract class UserDAO {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insert(UserModel user);
  @Query('SELECT * FROM user LIMIT 1')
  Future<UserModel?> getUser();
}
