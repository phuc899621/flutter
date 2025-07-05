import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_pass.freezed.dart';
part 'reset_pass.g.dart';

@freezed
abstract class ResetPassRequest with _$ResetPassRequest {
  const factory ResetPassRequest({
    required String email,
    required String password,
    required String passwordConfirm,
  }) = _ResetPassRequest;

  factory ResetPassRequest.fromJson(Map<String, dynamic> json) =>
      _$ResetPassRequestFromJson(json);
}
