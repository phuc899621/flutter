import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taskit/features/auth/domain/entities/forgot_pass/forgot_pass_entity.dart';

import '../../../../../shared/constants/forgot_pass_status.dart';

part 'forgot_pass_state.freezed.dart';

@freezed
abstract class ForgotPassState with _$ForgotPassState {
  const factory ForgotPassState({
    String? apiError,
    @Default(ForgotPassStatus.initial) ForgotPassStatus status,
    @Default('') String email,
    @Default('') String otp,
    @Default('') String password,
    String? resetToken,
  }) = _ForgotPassState;
}
