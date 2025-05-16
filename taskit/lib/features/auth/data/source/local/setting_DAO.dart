import 'package:floor/floor.dart';

import '../../model/setting.dart';

@dao
abstract class SettingDAO {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insert(SettingModel setting);
  @Query('SELECT * FROM settings')
  Future<List<SettingModel>> getAllSettings();
}
