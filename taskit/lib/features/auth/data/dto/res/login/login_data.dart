import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taskit/features/auth/data/dto/res/setting/setting_data.dart';

import '../../../../../task/data/dto/res/category/category_data.dart';
import '../../../../../task/data/dto/res/task/task_data.dart';
import '../user/user_data.dart';

part 'login_data.freezed.dart';
part 'login_data.g.dart';

@freezed
abstract class LoginData with _$LoginData {
  const factory LoginData(
      {required String token,
      required SettingData settings,
      required UserData user,
      required List<TaskData> tasks,
      required List<CategoryData> categories}) = _LoginData;
  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);
}
