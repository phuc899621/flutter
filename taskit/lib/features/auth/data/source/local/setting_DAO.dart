import 'package:floor/floor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../task/data/source/local/task_database.dart';
import '../../model/setting.dart';

final settingDAOProvider = Provider<SettingDAO>((ref) {
  final database = ref.watch(taskDatabaseProvider);
  return database.settingDAO;
});

@dao
abstract class SettingDAO {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insert(SettingModel setting);
  @Query('SELECT * FROM settings')
  Future<List<SettingModel>> getAllSettings();
}
