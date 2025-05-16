import 'package:taskit/features/auth/data/model/user.dart';

import '../../../task/data/model/category.dart';
import '../../data/dto/res/setting/setting_data.dart';
import '../../data/dto/res/user/user_data.dart';
import '../../data/model/setting.dart';

abstract interface class IAuthEntityMapper {}

abstract interface class IAuthModelMapper {
  UserModel mapToUserModel(UserData data);
  SettingModel mapToSettingModel(SettingData data);
  List<CategoryModel> mapToCategoryModels(List<String> data);
}
