import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgot_pass_verify.freezed.dart';

@freezed
abstract class ForgotPassVerifyEntity with _$ForgotPassVerifyEntity {
  const factory ForgotPassVerifyEntity({required String resetToken}) =
      _ForgotPassVerifyEntity;
}
