
import 'package:taskit/features/login/data/dto/request/login_request.dart';
import 'package:taskit/features/login/data/dto/response/login_data.dart';
import 'package:taskit/features/login/data/dto/response/login_verify_data.dart';

import '../../../../shared/dto/base_response.dart';

abstract interface class ILoginRepository{
  Future<BaseResponse<LoginData>> login(LoginRequest data);
  Future<BaseResponse<LoginVerifyData>> verify(String token);

}