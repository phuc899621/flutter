import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taskit/features/auth/data/dto/res/setting_data.dart';

part 'login_data.freezed.dart';
part 'login_data.g.dart';

@freezed
abstract class LoginData with _$LoginData {
  const factory LoginData({
    required String token,
    required SettingData settings,
  }) = _LoginData;
  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);
}
