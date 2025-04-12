import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_request.freezed.dart';
part 'signup_request.g.dart';

@freezed
abstract class SignupRequest with _$SignupRequest {
  const factory SignupRequest({
    required String name,
    required String email,
    required String password,
    required String passwordConfirm,
  }) = _SignupRequest;

  factory SignupRequest.fromJson(Map<String, dynamic> json) =>
      _$SignupRequestFromJson(json);
}