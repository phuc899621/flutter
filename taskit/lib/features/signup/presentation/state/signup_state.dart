import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/model/signup_model.dart';

part 'signup_state.freezed.dart';
//trang thai dang ky
@freezed
abstract class SignupState with _$SignupState {
  factory SignupState({
    SignupModel? signUpModel,
    bool? isSignUpSuccess,
    @Default(false) bool isLoading,
    String? error,
    @Default({}) Map<String, dynamic> signUpform,
  }) = _SignupState;
}