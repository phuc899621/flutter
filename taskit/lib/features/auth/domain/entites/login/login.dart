import 'package:freezed_annotation/freezed_annotation.dart';

import '../setting/setting.dart';

part 'login.freezed.dart';

@freezed
abstract class LoginModel with _$LoginModel {
  const factory LoginModel(
      {required String token, required SettingModel setting}) = _LoginModel;
}
