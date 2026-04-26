import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/auth/domain/usecases/forgot_password/forgot_password_resend_usecase.dart';
import 'package:taskit/features/auth/domain/usecases/forgot_password/forgot_password_reset_usecase.dart';
import 'package:taskit/features/auth/domain/usecases/forgot_password/forgot_password_verify_usecase.dart';
import 'package:taskit/features/auth/domain/usecases/params/forgot_password_params.dart';
import 'package:taskit/features/auth/presentation/forgot_password/state/forgot_pass_state.dart';
import 'package:taskit/shared/constants/forgot_pass_status.dart';

import '../../../domain/usecases/forgot_password/forgot_password_usecase.dart';

final forgotPassControllerProvider =
    NotifierProvider.autoDispose<ForgotPassController, ForgotPassState>(
      ForgotPassController.new,
    );

class ForgotPassController extends Notifier<ForgotPassState> {
  @override
  ForgotPassState build() {
    return ForgotPassState();
  }

  Future<void> forgotPass(String email) async {
    try {
      //trang thai loading
      state = state.copyWith(
        status: ForgotPassStatus.loading,
        apiError: null,
        email: email,
      );
      final form = ForgotPasswordParams(email: email);
      (await ref.read(forgotPasswordUseCaseProvider).call(form)).when(
        (success) {
          state = state.copyWith(status: ForgotPassStatus.forgotSuccess);
        },
        (failure) {
          state = state.copyWith(
            status: ForgotPassStatus.initial,
            apiError: failure.message,
          );
        },
      );
    } catch (e) {
      state = state.copyWith(
        status: ForgotPassStatus.initial,
        apiError: e.toString(),
      );
    }
  }

  Future<void> verify(String otp) async {
    try {
      state = state.copyWith(
        status: ForgotPassStatus.loading,
        apiError: null,
        otp: otp,
      );
      final form = ForgotPasswordVerifyParams(
        email: state.email,
        otp: state.otp,
      );
      (await ref.read(forgotPasswordVerifyUseCaseProvider).call(form)).when(
        (success) {
          state = state.copyWith(
            status: ForgotPassStatus.verifySuccess,
            resetToken: success.resetToken,
          );
        },
        (failure) {
          state = state.copyWith(
            status: ForgotPassStatus.initial,
            apiError: failure.message,
          );
        },
      );
    } catch (e) {
      state = state.copyWith(
        status: ForgotPassStatus.initial,
        apiError: e.toString(),
      );
    }
  }

  Future<void> resend() async {
    try {
      state = state.copyWith(status: ForgotPassStatus.loading, apiError: null);
      final form = ForgotPasswordResendParams(email: state.email);
      (await ref.read(forgotPasswordResendUseCaseProvider).call(form)).when(
        (success) {
          state = state.copyWith(status: ForgotPassStatus.resendSuccess);
        },
        (failure) {
          state = state.copyWith(
            status: ForgotPassStatus.initial,
            apiError: failure.message,
          );
        },
      );
    } catch (e) {
      state = state.copyWith(
        status: ForgotPassStatus.initial,
        apiError: e.toString(),
      );
    }
  }

  Future<void> reset(String password) async {
    try {
      state = state.copyWith(
        status: ForgotPassStatus.loading,
        password: password,
      );
      final form = ForgotPasswordResetParams(
        resetToken: state.resetToken!,
        password: state.password,
      );
      (await ref.read(forgotPasswordResetUseCaseProvider).call(form)).when(
        (success) {
          state = state.copyWith(status: ForgotPassStatus.resetSuccess);
        },
        (failure) {
          state = state.copyWith(
            status: ForgotPassStatus.initial,
            apiError: failure.message,
          );
        },
      );
    } catch (e) {
      state = state.copyWith(
        status: ForgotPassStatus.initial,
        apiError: e.toString(),
      );
    }
  }
}
