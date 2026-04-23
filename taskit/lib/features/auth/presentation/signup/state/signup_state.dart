import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taskit/shared/constants/signup_status.dart';


part 'signup_state.freezed.dart';

//trang thai dang ky
@freezed
abstract class SignupState with _$SignupState {
  factory SignupState({
    String? apiError,
    @Default(SignupStatus.initial) SignupStatus status,
    @Default('') String email,
    @Default('') String otp,
    @Default('') String password,
  }) = _SignupState;
}
