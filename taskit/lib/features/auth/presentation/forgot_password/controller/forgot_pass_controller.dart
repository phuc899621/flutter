import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/auth/application/auth_service_impl.dart';
import 'package:taskit/features/auth/presentation/forgot_password/state/forgot_pass_state.dart';
import 'package:taskit/shared/constants/forgot_pass_status.dart';

import '../../../domain/entities/forgot_pass/forgot_pass_entity.dart';

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
      final form = ForgotPasswordEntity(email: email);
      (await ref.read(authServiceProvider).forgotPass(form)).when(
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
      final form = ForgotPasswordVerifyEntity(
        email: state.email,
        otp: state.otp,
      );
      (await ref.read(authServiceProvider).forgotPassVerify(form)).when(
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
      final form = ForgotPasswordResendEntity(email: state.email);
      (await ref.read(authServiceProvider).forgotPassResend(form)).when(
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
      final form = ForgotPasswordResetEntity(
        resetToken: state.resetToken!,
        password: state.password,
      );
      (await ref.read(authServiceProvider).forgotPassReset(form)).when(
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
