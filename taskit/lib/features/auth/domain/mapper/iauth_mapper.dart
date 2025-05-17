import 'package:taskit/features/auth/data/dto/res/forgot_pass/verify.dart';
import 'package:taskit/features/auth/data/model/user.dart';
import 'package:taskit/shared/data/dto/response/base_response.dart';

import '../../../task/data/model/category.dart';
import '../../data/dto/res/setting/setting_data.dart';
import '../../data/dto/res/user/user_data.dart';
import '../../data/model/setting.dart';
import '../entites/forgot_pass/forgot_pass_verify.dart';

abstract interface class IAuthEntityMapper {
  ForgotPassVerifyEntity mapToForgotPassVerifyEntity(
      BaseResponse<ForgotPassData> data);
}

abstract interface class IAuthModelMapper {
  UserModel mapToUserModel(UserData data);
  SettingModel mapToSettingModel(SettingData data);
  List<CategoryModel> mapToCategoryModels(List<String> data);
}
