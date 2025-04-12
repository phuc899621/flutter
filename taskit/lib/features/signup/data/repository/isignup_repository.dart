
import 'package:taskit/features/signup/data/dto/request/signup_verify_req/signup_verify_request.dart';
import 'package:taskit/shared/dto/base_response.dart';

import '../dto/request/signup_req/signup_request.dart';
import '../dto/response/signup_res/signup_data.dart';

abstract interface class ISignupRepository {
  Future<BaseResponse<SignupData>> signup(SignupRequest data);
  Future<BaseResponse<SignupData>> verify(SignupVerifyRequest data);
}