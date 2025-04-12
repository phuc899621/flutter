

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/model/login_model.dart';

part 'login_state.freezed.dart';
@freezed
abstract class LoginState with _$LoginState{
  const factory LoginState({
    @Default(false) bool isLoading,
    bool? isLoginSuccess,
    LoginModel? loginModel,
    String? error,
    @Default({}) Map<String, dynamic> loginForm,
    @Default(false) bool isPasswordVisibility,
  }) = _LoginState;

}