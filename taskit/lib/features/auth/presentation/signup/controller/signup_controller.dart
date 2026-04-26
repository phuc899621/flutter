import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/auth/domain/usecases/params/signup_params.dart';
import 'package:taskit/features/auth/domain/usecases/signup/signup_resend_usecase.dart';
import 'package:taskit/features/auth/domain/usecases/signup/signup_usecase.dart';
import 'package:taskit/features/auth/domain/usecases/signup/signup_verify_usecase.dart';
import 'package:taskit/shared/constants/signup_status.dart';

import '../state/signup_state.dart';

final signupControllerProvider =
    NotifierProvider.autoDispose<SignupController, SignupState>(
      SignupController.new,
    );

class SignupController extends Notifier<SignupState> {
  @override
  SignupState build() {
    return SignupState();
  }

  Future<void> signup(String email, String password) async {
    try {
      state = state.copyWith(
        apiError: null,
        status: SignupStatus.loading,
        email: email,
        password: password,
      );
      final form = SignupRegisterParams(
        email: state.email,
        password: state.password,
      );
      final result = await ref.read(signupUseCaseProvider).call(form);
      result.when(
        (success) {
          state = state.copyWith(status: SignupStatus.signupSuccess);
        },
        (failure) {
          state = state.copyWith(
            status: SignupStatus.initial,
            apiError: failure.message,
          );
        },
      );
    } catch (e) {
      state = state.copyWith(
        status: SignupStatus.initial,
        apiError: e.toString(),
      );
    }
  }

  Future<void> resend() async {
    try {
      state = state.copyWith(apiError: null, status: SignupStatus.loading);
      final form = SignupResendParams(email: state.email);
      final result = await ref.read(signupResendUseCaseProvider).call(form);
      result.when(
        (success) {
          state = state.copyWith(status: SignupStatus.resendSuccess);
        },
        (failure) {
          state = state.copyWith(
            status: SignupStatus.initial,
            apiError: failure.message,
          );
        },
      );
    } catch (e) {
      state = state.copyWith(
        status: SignupStatus.initial,
        apiError: e.toString(),
      );
    }
  }

  Future<void> verify(String otp) async {
    try {
      //trang thai loading
      state = state.copyWith(
        apiError: null,
        status: SignupStatus.loading,
        otp: otp,
      );
      final form = SignupVerifyParams(email: state.email, otp: state.otp);
      final result = await ref.read(signupVerifyUseCaseProvider).call(form);
      result.when(
        (success) {
          state = state.copyWith(status: SignupStatus.verifySuccess);
        },
        (failure) {
          state = state.copyWith(
            status: SignupStatus.initial,
            apiError: failure.message,
          );
        },
      );
    } catch (e) {
      state = state.copyWith(
        status: SignupStatus.initial,
        apiError: e.toString(),
      );
    }
  }
}
