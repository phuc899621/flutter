import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/auth/data/dto/req/signup/signup_verify_request.dart';

import '../../../application/auth_service.dart';
import '../../../data/dto/req/signup/signup_request.dart';
import '../state/signup_state.dart';

final signUpControllerProvider =
    AutoDisposeNotifierProvider<SignUpController, SignupState>(
        SignUpController.new);

class SignUpController extends AutoDisposeNotifier<SignupState> {
  @override
  SignupState build() {
    return SignupState();
  }

  void togglePasswordVisibility() {
    state = state.copyWith(
      isPasswordVisibility: !state.isPasswordVisibility,
    );
  }

  void toggleConfirmPasswordVisibility() {
    state = state.copyWith(
      isConfirmPasswordVisibility: !state.isConfirmPasswordVisibility,
    );
  }

  Future<void> signUp() async {
    try {
      //trang thai loading
      state = state.copyWith(
        isLoading: true,
        error: null,
        isSignUpSuccess: null,
      );

      final formData = SignupRequest(
        name: state.signupForm['name'],
        email: state.signupForm['email'],
        password: state.signupForm['password'],
        passwordConfirm: state.signupForm['confirmPassword'],
      );
      final result = await ref.read(authServiceProvider).signup(formData);
      result.when((success) {
        state = state.copyWith(
          isLoading: false,
          isSignUpSuccess: true,
        );
      }, (failure) {
        state = state.copyWith(
          isLoading: false,
          isSignUpSuccess: null,
          error: failure.message,
        );
      });
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        isSignUpSuccess: null,
        error: e.toString(),
      );
    }
  }

  void setFormData(Map<String, dynamic> formData) {
    state = state.copyWith(
      signupForm: formData,
    );
  }

  Future<void> verify() async {
    try {
      //trang thai loading
      state = state.copyWith(
        isLoading: true,
        error: null,
        isVerifySuccess: null,
      );
      final formData = SignupVerifyRequest(
          email: state.signupForm['email'], otp: state.verifyForm['otp']);
      final result = await ref.read(authServiceProvider).signupVerify(formData);
      result.when((success) {
        state = state.copyWith(
          isLoading: false,
          isVerifySuccess: true,
        );
      }, (failure) {
        state = state.copyWith(
          isLoading: false,
          isVerifySuccess: null,
          error: failure.message,
        );
      });
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        isVerifySuccess: null,
        error: e.toString(),
      );
    }
  }

  void setVerifyForm(Map<String, dynamic> data) {
    state = state.copyWith(
      verifyForm: data,
    );
  }
}
