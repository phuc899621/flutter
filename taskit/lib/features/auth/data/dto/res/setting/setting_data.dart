import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting_data.freezed.dart';
part 'setting_data.g.dart';

@freezed
abstract class SettingData with _$SettingData {
  const factory SettingData({
    @JsonKey(name: '_id') required String id,
    required String userId,
    required bool isNotificationEnabled,
    required String language,
    required String theme,
    required int remindBefore,
  }) = _SettingData;
  factory SettingData.fromJson(Map<String, dynamic> json) =>
      _$SettingDataFromJson(json);
}
