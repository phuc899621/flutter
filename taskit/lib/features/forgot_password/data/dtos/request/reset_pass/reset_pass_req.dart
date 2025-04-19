import 'package:freezed_annotation/freezed_annotation.dart';
part 'reset_pass_req.g.dart';
part 'reset_pass_req.freezed.dart';

@freezed
abstract class ResetPassRequest with _$ResetPassRequest {
  const factory ResetPassRequest({
    required String email,
    required String password,
    required String confirmPassword,
  })=_ResetPassRequest;
  factory ResetPassRequest.fromJson(Map<String, dynamic> json) => _$ResetPassRequestFromJson(json);
}
