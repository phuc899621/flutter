import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting_model.freezed.dart';

@freezed
abstract class SettingModel with _$SettingModel {
  const factory SettingModel({
    required bool isNotificationEnabled,
    required int remindBefore,
    required List<String> categories,
    required String language,
    required String theme,
  }) = _SettingModel;
}
