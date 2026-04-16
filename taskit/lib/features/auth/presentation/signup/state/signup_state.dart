import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taskit/shared/constants/signup_status.dart';

import '../../../domain/entities/signup/signup_entity.dart';

part 'signup_state.freezed.dart';

//trang thai dang ky
@freezed
abstract class SignupState with _$SignupState {
  factory SignupState({
    @Default(false) bool isLoading,
    String? apiError,
    @Default(SignupStatus.initial) SignupStatus status,
    @Default(SignupEntity.initialRegister) SignupRegisterEntity registerForm,
    @Default(SignupEntity.initialVerify) SignupVerifyEntity verifyForm,
    @Default(SignupEntity.initialResend) SignupResendEntity resendForm,
  }) = _SignupState;
}
