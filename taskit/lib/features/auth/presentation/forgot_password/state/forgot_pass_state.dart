import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entites/forgot_pass/forgot_pass_verify.dart';

part 'forgot_pass_state.freezed.dart';

@freezed
abstract class ForgotPassState with _$ForgotPassState {
  const factory ForgotPassState({
    @Default(false) bool isLoading,
    bool? isForgotPassSuccess,
    bool? isVerifySuccess,
    bool? isResetSuccess,
    String? errorForgotPass,
    String? errorVerify,
    String? errorReset,
    @Default({}) Map<String, dynamic> forgotPassForm,
    @Default({}) Map<String, dynamic> verifyForm,
    @Default({}) Map<String, dynamic> resetForm,
    ForgotPassVerifyModel? forgotPassVerifyModel,
  }) = _ForgotPassState;
}
