

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taskit/features/login/domain/model/login_verify_model.dart';

import '../../domain/model/login_model.dart';

part 'login_state.freezed.dart';
@freezed
abstract class LoginState with _$LoginState{
  const factory LoginState({
    @Default(false) bool isLoading,
    bool? isLoginSuccess,
    LoginModel? loginModel,
    String? token,
    String? error,
    LoginVerifyModel? loginVerifyModel,
    @Default({}) Map<String, dynamic> loginForm,
    @Default(false) bool isPasswordVisibility,
  }) = _LoginState;

}