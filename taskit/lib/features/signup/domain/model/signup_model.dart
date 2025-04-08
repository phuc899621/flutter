import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_model.freezed.dart';

@freezed
abstract class SignupModel with _$SignupModel {
  factory SignupModel({
    required String email
  }) = _SignupModel;
}