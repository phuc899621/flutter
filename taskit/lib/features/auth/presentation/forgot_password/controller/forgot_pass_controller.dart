import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/auth/application/auth_service.dart';
import 'package:taskit/features/auth/presentation/forgot_password/state/forgot_pass_state.dart';
import 'package:taskit/shared/log/logger_provider.dart';

import '../../../data/dto/req/forgot_pass/forgot_pass.dart';
import '../../../data/dto/req/forgot_pass/forgot_pass_verify.dart';
import '../../../data/dto/req/forgot_pass/reset_pass.dart';

final forgotPassControllerProvider =
    AutoDisposeNotifierProvider<ForgotPassController, ForgotPassState>(
        ForgotPassController.new);

class ForgotPassController extends AutoDisposeNotifier<ForgotPassState> {
  @override
  ForgotPassState build() {
    return const ForgotPassState();
  }

  Future<void> forgotPass() async {
    try {
      //trang thai loading
      state = state.copyWith(
        isLoading: true,
        errorForgotPass: null,
        isForgotPassSuccess: null,
      );
      final formData = ForgotPassRequest(email: state.forgotPassForm['email']);
      final result = await ref.read(authServiceProvider).forgotPass(formData);
      result.when((success) {
        state = state.copyWith(
          isLoading: false,
          isForgotPassSuccess: true,
        );
      }, (failure) {
        state = state.copyWith(
          isLoading: false,
          isForgotPassSuccess: null,
          errorForgotPass: failure.message,
        );
      });
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        isForgotPassSuccess: null,
        errorForgotPass: e.toString(),
      );
    }
  }

  void setForgotPassForm(Map<String, dynamic> formData) {
    state = state.copyWith(
      forgotPassForm: formData,
    );
  }

  void setVerifyForm(Map<String, dynamic> formData) {
    state = state.copyWith(
      verifyForm: formData,
    );
  }

  void setResetForm(Map<String, dynamic> formData) {
    state = state.copyWith(
      resetForm: formData,
    );
  }

  Future<void> verify() async {
    try {
      state = state.copyWith(
        isLoading: true,
        errorVerify: null,
        isVerifySuccess: null,
      );
      final formData = ForgotPassVerifyRequest(
        email: state.forgotPassForm['email'],
        otp: state.verifyForm['otp'],
      );
      final result =
          await ref.read(authServiceProvider).forgotPassVerify(formData);
      result.when((success) {
        state = state.copyWith(
            isLoading: false,
            isVerifySuccess: true,
            resetToken: success.resetToken);
      }, (failure) {
        state = state.copyWith(
          isLoading: false,
          isVerifySuccess: null,
          errorVerify: failure.message,
        );
      });
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        isVerifySuccess: null,
        errorVerify: e.toString(),
      );
    }
  }

  Future<void> reset() async {
    try {
      state = state.copyWith(
        isLoading: true,
        errorReset: null,
        isResetSuccess: null,
      );
      final formData = ResetPassRequest(
        email: state.forgotPassForm['email'],
        password: state.resetForm['password'],
        passwordConfirm: state.resetForm['passwordConfirm'],
      );
      logger.i('$formData ${state.resetToken}');
      final result = await ref
          .read(authServiceProvider)
          .resetPass(formData, state.resetToken!);

      result.when((success) {
        state = state.copyWith(
          isLoading: false,
          isResetSuccess: true,
        );
      }, (failure) {
        logger.e(failure);
        state = state.copyWith(
          isLoading: false,
          isResetSuccess: null,
          errorReset: failure.message,
        );
      });
    } catch (e) {
      logger.e(e);
      state = state.copyWith(
        isLoading: false,
        isResetSuccess: null,
        errorReset: e.toString(),
      );
    }
  }
}
