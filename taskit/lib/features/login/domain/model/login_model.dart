

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taskit/features/login/domain/model/setting_model.dart';

part 'login_model.freezed.dart';
@freezed
abstract class LoginModel with _$LoginModel{
  const factory LoginModel({
    required String token,
    required SettingModel setting
  }) = _LoginModel;
}