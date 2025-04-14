

import '../../../../shared/dto/base_response.dart';
import '../../../../shared/dto/base_response_data.dart';
import '../dtos/request/forgot_pass_req.dart';

abstract interface class IForgotPassRepository{
  Future<BaseResponse<BaseData>> forgotPass(ForgotPassRequest data);

}