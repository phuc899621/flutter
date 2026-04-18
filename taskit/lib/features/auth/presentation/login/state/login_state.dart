import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taskit/shared/constants/login_status.dart';

part 'login_state.freezed.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({
    @Default(LoginStatus.initial) LoginStatus status,
    String? apiError,
    @Default('') String email,
    @Default('') String password,
  }) = _LoginState;
}
