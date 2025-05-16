import 'package:floor/floor.dart';

@Entity(tableName: 'settings', primaryKeys: ['id', 'userId'])
class SettingModel {
  final String id;
  final String userId;
  final bool isNotificationEnable;
  final String language;
  final String theme;
  final int remindBefore;
  SettingModel({
    required this.id,
    required this.userId,
    required this.isNotificationEnable,
    required this.language,
    required this.theme,
    required this.remindBefore,
  });
}
