
import 'package:taskit/features/login/domain/model/login_model.dart';
import 'package:taskit/features/login/domain/model/login_verify_model.dart';

import '../../../../shared/data/dto/base_response.dart';
import '../../data/dto/response/login_data.dart';
import '../../data/dto/response/login_verify_data.dart';

abstract interface class ILoginModelMapper{
  LoginModel mapToLoginModel(BaseResponse<LoginData> data);
  LoginVerifyModel mapToLoginVerifyModel(BaseResponse<LoginVerifyData> data);
}