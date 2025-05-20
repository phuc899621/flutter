import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../database/database.dart';
import '../table/setting.dart';

part 'setting.g.dart';

final settingDaoProvider = Provider<SettingDao>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return SettingDao(db);
});

@DriftAccessor(tables: [SettingTable])
class SettingDao extends DatabaseAccessor<AppDatabase> with _$SettingDaoMixin {
  SettingDao(super.db);
  Future<SettingTableData?> getSetting() =>
      select(settingTable).getSingleOrNull();
  Future<int> insertSetting(SettingTableCompanion setting) =>
      into(settingTable).insert(setting);
  Future<bool> updateSetting(SettingTableCompanion setting) =>
      update(settingTable).replace(setting);
  Future<int> deleteSetting() => delete(settingTable).go();
}
