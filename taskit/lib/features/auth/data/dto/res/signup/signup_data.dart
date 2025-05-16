import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_data.freezed.dart';
part 'signup_data.g.dart';


@freezed
abstract class SignupData with _$SignupData {
  const factory SignupData({
    required String email,
  }) = _SignupData;

  factory SignupData.fromJson(Map<String, dynamic> json) => _$SignupDataFromJson(json);
}
