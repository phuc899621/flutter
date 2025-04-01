import 'package:taskit/features/signup/data/dto/response/signup_response.dart';

import '../../data/dto/request/signup_request.dart';

abstract interface class ISignupRepository {
  Future<SignupResponse>  signup(SignupRequest data);
}