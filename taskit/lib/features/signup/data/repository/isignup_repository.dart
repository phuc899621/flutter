
import 'package:taskit/shared/dto/base_response.dart';

import '../../data/dto/request/signup_req/signup_request.dart';
import '../../data/dto/response/signup_res/signup_data.dart';

abstract interface class ISignupRepository {
  Future<BaseResponse<SignupData>>  signup(SignupRequest data);
}