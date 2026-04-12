import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taskit/features/auth/domain/entites/signup/signup_verify_model.dart';

import '../../../domain/entites/signup/signup_model.dart';

part 'signup_state.freezed.dart';

//trang thai dang ky
@freezed
abstract class SignupState with _$SignupState {
  factory SignupState({
    bool? isSignUpSuccess,
    bool? isVerifySuccess,
    @Default(false) bool isLoading,
    String? error,
    @Default(SignupModel(email: '', password: '')) SignupModel signupForm,
    @Default(SignupVerifyModel(email: '', otp: ''))
    SignupVerifyModel verifyForm,
    @Default(false) bool isPasswordVisibility,
    @Default(false) bool isConfirmPasswordVisibility,
  }) = _SignupState;
}
