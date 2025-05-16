import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entites/signup/signup.dart';

part 'signup_state.freezed.dart';

//trang thai dang ky
@freezed
abstract class SignupState with _$SignupState {
  factory SignupState({
    SignupModel? signUpModel,
    bool? isSignUpSuccess,
    bool? isVerifySuccess,
    @Default(false) bool isLoading,
    String? error,
    @Default({}) Map<String, dynamic> signupForm,
    @Default({}) Map<String, dynamic> verifyForm,
    @Default(false) bool isPasswordVisibility,
    @Default(false) bool isConfirmPasswordVisibility,
  }) = _SignupState;
}
