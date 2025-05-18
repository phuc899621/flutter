import 'package:taskit/features/auth/data/dto/res/forgot_pass/verify.dart';

import '../../../../shared/data/dto/response/base_response.dart';
import '../entites/forgot_pass/forgot_pass_verify.dart';

abstract interface class IAuthEntityMapper {
  ForgotPassVerifyEntity mapToForgotPassVerifyEntity(
      BaseResponse<ForgotPassData> data);
}

abstract interface class IAuthModelMapper {
/*  UserModel mapToUserModel(UserData data);
  SettingModel mapToSettingModel(SettingData data);
  List<CategoryModel> mapToCategoryModels(List<String> data);
  List<TaskModel> mapToTaskModels(List<TaskData> data);*/
}
