

import '../../../../shared/data/dto/base_response.dart';
import '../../data/dtos/response/forgot_pass_verify_res.dart';
import '../model/forgot_pass_verify_model.dart';

abstract interface class IForgotPassVerifyModelMapper{
  ForgotPassVerifyModel mapToForgotPassVerifyModel(BaseResponse<ForgotPassVerifyData> data);
}