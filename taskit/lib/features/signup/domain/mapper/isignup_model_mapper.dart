import 'package:taskit/features/signup/data/dto/response/signup_res/signup_data.dart';
import 'package:taskit/shared/dto/base_response.dart';

import '../model/signup_model.dart';

abstract interface class ISignUpModelMapper {
  SignupModel mapToSignUpModel(BaseResponse<SignupData> data);
}