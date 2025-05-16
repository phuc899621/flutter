import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({
    @Default(false) bool isLoading,
    bool? isLoginSuccess,
    String? token,
    String? error,
    @Default({}) Map<String, dynamic> loginForm,
    @Default(false) bool isPasswordVisibility,
  }) = _LoginState;
}
