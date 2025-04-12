

import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_model.freezed.dart';
@freezed
abstract class LoginModel with _$LoginModel{
  const factory LoginModel({
    required String token
  }) = _LoginModel;
}