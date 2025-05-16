import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/forgot_password/presentation/state/forgot_pass_state.dart';

import '../../../auth/data/dto/req/forgot_pass/forgot_pass.dart';
import '../../../auth/data/dto/req/forgot_pass/forgot_pass_verify.dart';
import '../../../auth/data/dto/req/forgot_pass/reset_pass.dart';
import '../../application/forgot_pass_service.dart';

final forgotPassControllerProvider =
    NotifierProvider<ForgotPassController, ForgotPassState>(
        ForgotPassController.new);

class ForgotPassController extends Notifier<ForgotPassState> {
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
      final result =
          await ref.read(forgotPassServiceProvider).forgotPass(formData);
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
      final result = await ref.read(forgotPassServiceProvider).verify(formData);
      result.when((success) {
        state = state.copyWith(
            isLoading: false,
            isVerifySuccess: true,
            forgotPassVerifyModel: success);
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
        confirmPassword: state.resetForm['confirmPassword'],
      );
      final result = await ref
          .read(forgotPassServiceProvider)
          .reset(formData, state.forgotPassVerifyModel!.resetToken);

      result.when((success) {
        state = state.copyWith(
          isLoading: false,
          isResetSuccess: true,
        );
      }, (failure) {
        state = state.copyWith(
          isLoading: false,
          isResetSuccess: null,
          errorReset: failure.message,
        );
      });
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        isResetSuccess: null,
        errorReset: e.toString(),
      );
    }
  }
}
