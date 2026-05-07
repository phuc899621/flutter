import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/auth/domain/usecases/params/signup_params.dart';
import 'package:taskit/features/auth/domain/usecases/signup/signup_resend_usecase.dart';
import 'package:taskit/features/auth/domain/usecases/signup/signup_usecase.dart';
import 'package:taskit/features/auth/domain/usecases/signup/signup_verify_usecase.dart';
import 'package:taskit/shared/constants/signup_status.dart';

import '../../../../../shared/application/network_status_provider.dart';
import '../../../../../shared/constants/network_status.dart';
import '../../../../../shared/log/logger_provider.dart';
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

  bool checkConnection() {
    final networkStatus = ref.read(networkStatusProvider).value;
    if (networkStatus == NetworkStatus.offline) {
      state = state.copyWith(
        status: SignupStatus.initial,
        apiError: 'Please check your internet connection',
      );
      return false;
    }
    return true;
  }

  Future<void> signup(String email, String password) async {
    logger.i("[SignupController] Starting signup flow for $email");
    try {
      if (!checkConnection()) {
        logger.w("[SignupController] No internet connection, signup aborted");
        return;
      }
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
          logger.d("[SignupController] Signup success");
          state = state.copyWith(status: SignupStatus.signupSuccess);
        },
        (failure) {
          logger.e("[SignupController] Signup failed: ${failure.message}");
          state = state.copyWith(
            status: SignupStatus.initial,
            apiError: failure.message,
          );
        },
      );
    } catch (e) {
      logger.e("[SignupController] Signup failed: ${e.toString()}");
      state = state.copyWith(
        status: SignupStatus.initial,
        apiError: e.toString(),
      );
    }
  }

  Future<void> resend() async {
    logger.i("[SignupController] Starting resend flow for ${state.email}");
    try {
      if (!checkConnection()) {
        logger.w("[SignupController] No internet connection, resend aborted");
        return;
      }
      state = state.copyWith(apiError: null, status: SignupStatus.loading);
      final form = SignupResendParams(email: state.email);
      final result = await ref.read(signupResendUseCaseProvider).call(form);
      result.when(
        (success) {
          logger.d('[SignupController] Resend successful');
          state = state.copyWith(status: SignupStatus.resendSuccess);
        },
        (failure) {
          logger.e('[SignupController] Resend failed: ${failure.message}');
          state = state.copyWith(
            status: SignupStatus.initial,
            apiError: failure.message,
          );
        },
      );
    } catch (e) {
      logger.e('[SignupController] Resend failed: ${e.toString()}');
      state = state.copyWith(
        status: SignupStatus.initial,
        apiError: e.toString(),
      );
    }
  }

  Future<void> verify(String otp) async {
    try {
      if (!checkConnection()) {
        logger.w('[SignupController] No internet connection, verify aborted');
        return;
      }
      state = state.copyWith(
        apiError: null,
        status: SignupStatus.loading,
        otp: otp,
      );
      final form = SignupVerifyParams(email: state.email, otp: state.otp);
      final result = await ref.read(signupVerifyUseCaseProvider).call(form);
      result.when(
        (success) {
          logger.d('[SignupController] Verify successful');
          state = state.copyWith(status: SignupStatus.verifySuccess);
        },
        (failure) {
          logger.e('[SignupController] Verify failed: ${failure.message}');
          state = state.copyWith(
            status: SignupStatus.initial,
            apiError: failure.message,
          );
        },
      );
    } catch (e) {
      logger.e('[SignupController] Verify failed: ${e.toString()}');
      state = state.copyWith(
        status: SignupStatus.initial,
        apiError: e.toString(),
      );
    }
  }
}
