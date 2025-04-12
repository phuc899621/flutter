
import 'package:taskit/features/login/domain/model/login_model.dart';

import '../../../../shared/dto/base_response.dart';
import '../../data/dto/response/login_data.dart';

abstract interface class ILoginModelMapper{
  LoginModel mapToLoginModel(BaseResponse<LoginData> data);
}