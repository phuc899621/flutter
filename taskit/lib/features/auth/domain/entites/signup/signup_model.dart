import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_model.freezed.dart';

@freezed
abstract class SignupModel with _$SignupModel {
  const factory SignupModel({required String email, required String password}) = _SignupModel;
}
