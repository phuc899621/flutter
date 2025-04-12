
import 'package:taskit/features/signup/data/dto/request/signup_verify_req/signup_verify_request.dart';

import '../../../shared/exception/failure.dart';
import '../data/dto/request/signup_req/signup_request.dart';
import '../domain/model/signup_model.dart';
import 'package:multiple_result/multiple_result.dart';
abstract interface class ISignUpService {
  Future<Result<SignupModel, Failure>> signUp(SignupRequest data);
  Future<Result<void, Failure>> verify(SignupVerifyRequest data);
}
