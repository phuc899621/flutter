import 'package:taskit/features/auth/domain/entities/signup/signup_entity.dart';
import 'package:taskit/shared/domain/entities/message_result.dart';

abstract class SignupRepo {
  Future<MessageResult> signup(SignupRegisterEntity entity);

  Future<MessageResult> signupVerify(SignupVerifyEntity entity);

  Future<MessageResult> signupResend(SignupResendEntity entity);
}
