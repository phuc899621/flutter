import 'package:taskit/features/auth/domain/entities/signup/signup_entity.dart';

import '../dto/req/signup/signup_request.dart';

extension SignupEntityMapper on SignupEntity {
  SignupRequest toDto() => map(
    register: (entity) =>
        SignupRegisterRequest(email: entity.email, password: entity.password),
    verify: (entity) =>
        SignupVerifyRequest(email: entity.email, otp: entity.otp),
    resend: (entity) => SignupResendRequest(email: entity.email),
  );
}
