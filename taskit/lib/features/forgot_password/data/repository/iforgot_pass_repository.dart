

import 'package:taskit/features/forgot_password/data/dtos/response/forgot_pass_verify_res.dart';

import '../../../../shared/dto/base_response.dart';
import '../../../../shared/dto/base_response_data.dart';
import '../dtos/request/forgot_pass/forgot_pass_req.dart';
import '../dtos/request/forgot_pass_verify/forgot_pass_verify_req.dart';
import '../dtos/request/reset_pass/reset_pass_req.dart';

abstract interface class IForgotPassRepository{
  Future<BaseResponse<BaseData>> forgotPass(ForgotPassRequest data);
  Future<BaseResponse<ForgotPassVerifyData>> verify(ForgotPassVerifyRequest data);
  Future<BaseResponse<BaseData>> reset(ResetPassRequest data, String token);


}