import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgot_pass_verify_model.freezed.dart';

@freezed
abstract class ForgotPassVerifyModel with _$ForgotPassVerifyModel{
  const factory ForgotPassVerifyModel({
    required String resetToken
  }) = _ForgotPassVerifyModel;
}