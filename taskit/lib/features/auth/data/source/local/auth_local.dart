import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/auth/data/source/local/setting_DAO.dart';
import 'package:taskit/features/auth/data/source/local/user_DAO.dart';

import '../../../../task/data/model/category.dart';
import '../../../../task/data/source/local/DAO/category_DAO.dart';
import '../../model/setting.dart';
import '../../model/user.dart';

final authLocalDataSourceProvider = Provider<AuthLocalDataSource>((ref) {
  final userDAO = ref.watch(userDAOProvider);
  final settingDAO = ref.watch(settingDAOProvider);
  final categoryDAO = ref.watch(categoryDAOProvider);
  return AuthLocalDataSource(
      userDAO: userDAO, settingDAO: settingDAO, categoryDAO: categoryDAO);
});

class AuthLocalDataSource {
  final UserDAO userDAO;
  final SettingDAO settingDAO;
  final CategoryDAO categoryDAO;
  AuthLocalDataSource(
      {required this.userDAO,
      required this.settingDAO,
      required this.categoryDAO});
  Future<void> cacheLoginData(UserModel user, SettingModel setting,
      List<CategoryModel> categories) async {
    try {
      await userDAO.insert(user);
      await settingDAO.insert(setting);
      await categoryDAO.insertAll(categories);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
