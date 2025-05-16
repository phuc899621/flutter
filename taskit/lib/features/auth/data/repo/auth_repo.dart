import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/auth/data/dto/req/login/login_request.dart';
import 'package:taskit/features/auth/data/dto/res/login/login_data.dart';
import 'package:taskit/features/auth/data/dto/res/setting/setting_data.dart';
import 'package:taskit/features/auth/data/dto/res/user/user_data.dart';
import 'package:taskit/features/auth/data/model/setting.dart';
import 'package:taskit/features/auth/data/model/user.dart';
import 'package:taskit/features/auth/data/repo/iauth_repo.dart';
import 'package:taskit/features/auth/data/source/local/user_DAO.dart';
import 'package:taskit/features/auth/domain/mapper/iauth_mapper.dart';
import 'package:taskit/features/task/data/model/category.dart';
import 'package:taskit/features/task/data/source/local/DAO/category_DAO.dart';
import 'package:taskit/features/task/data/source/local/task_database.dart';
import 'package:taskit/shared/data/dto/response/base_response.dart';
import 'package:taskit/shared/mixin/dio_exception_mapper.dart';

import '../../../../shared/data/dto/response/base_response_data.dart';
import '../../../../shared/exception/failure.dart';
import '../dto/req/forgot_pass/forgot_pass.dart';
import '../dto/req/forgot_pass/forgot_pass_verify.dart';
import '../dto/req/forgot_pass/reset_pass.dart';
import '../dto/req/signup/signup_request.dart';
import '../dto/req/signup/signup_verify_request.dart';
import '../dto/res/forgot_pass/verify.dart';
import '../dto/res/login/login_verify_data.dart';
import '../dto/res/signup/signup_data.dart';
import '../source/local/setting_DAO.dart';
import '../source/remote/auth_api.dart';

final authRepoProvider = Provider<IAuthRepo>((ref) {
  final authApi = ref.watch(authApiProvider);
  final db = ref.watch(taskDatabaseProvider);
  final userDao = db.userDAO;
  final settingDao = db.settingDAO;
  final categoryDao = db.categoryDAO;
  return AuthRepo(authApi, userDao, settingDao, categoryDao);
});

class AuthRepo with DioExceptionMapper implements IAuthRepo, IAuthModelMapper {
  final AuthApi _authApi;
  final UserDAO userDAO;
  final SettingDAO settingDAO;
  final CategoryDAO categoryDAO;
  AuthRepo(this._authApi, this.userDAO, this.settingDAO, this.categoryDAO);

  /*
  *
  * Login
  * */
  @override
  Future<BaseResponse<LoginData>> login(LoginRequest data) async {
    try {
      final response = await _authApi.login(data);
      final userModel = mapToUserModel(response.data.user);
      final settingModels = mapToSettingModel(response.data.settings);
      final categoryModels =
          mapToCategoryModels(response.data.settings.categories);
      await userDAO.insert(userModel);
      await settingDAO.insert(settingModels);
      await categoryDAO.insertAll(categoryModels);
      debugPrint(userDAO.getUser().toString());
      debugPrint(settingDAO.getAllSettings().toString());
      debugPrint(categoryDAO.getAllCategories().toString());
      return response;
    } on DioException catch (e, s) {
      throw mapDioExceptionToFailure(e, s);
    } catch (e, s) {
      if (e is Exception) {
        throw Failure(
          message: "An unexpected error occurred when login: ${e.toString()}",
          exception: e,
          stackTrace: s,
        );
      } else {
        throw Failure(
          message: "An unexpected error occurred when login. ${e.toString()}",
          exception: Exception(e.toString()), // Tạo một Exception mới
          stackTrace: s,
        );
      }
    }
  }

  @override
  Future<BaseResponse<LoginVerifyData>> checkLogin(String token) async {
    try {
      final response = await _authApi.checkLogin('Bearer $token');
      return response;
    } on DioException catch (e, s) {
      throw mapDioExceptionToFailure(e, s);
    } catch (e, s) {
      if (e is Exception) {
        throw Failure(
          message:
              "An unexpected error occurred when verify login. ${e.toString()}",
          exception: e,
          stackTrace: s,
        );
      } else {
        throw Failure(
          message:
              "An unexpected error occurred when verify login. ${e.toString()}",
          exception: Exception(e.toString()),
          stackTrace: s,
        );
      }
    }
  }

  /*
  * Sign Up
  * */
  @override
  Future<BaseResponse<SignupData>> signup(SignupRequest data) async {
    try {
      final response = await _authApi.signup(data);

      return response;
    } on DioException catch (e, s) {
      throw mapDioExceptionToFailure(e, s);
    } catch (e, s) {
      throw Failure(
        message: "An unexpected error occurred when sign up. ${e.toString()}",
        exception: e as Exception,
        stackTrace: s,
      );
    }
  }

  @override
  Future<BaseResponse<SignupData>> signupVerify(
      SignupVerifyRequest data) async {
    try {
      final response = await _authApi.signupVerify(data);
      return response;
    } on DioException catch (e, s) {
      throw mapDioExceptionToFailure(e, s);
    } catch (e, s) {
      throw Failure(
        message:
            "An unexpected error occurred when verify signup email. ${e.toString()}",
        exception: e as Exception,
        stackTrace: s,
      );
    }
  }

  /*
  * Forgot Password
  * */
  @override
  Future<BaseResponse<BaseData>> forgotPass(ForgotPassRequest data) async {
    try {
      final response = await _authApi.forgotPass(data);
      return response;
    } on DioException catch (e, s) {
      throw mapDioExceptionToFailure(e, s);
    } catch (e, s) {
      throw Failure(
        message:
            "An unexpected error occurred when sending forgot password. Please try again later.",
        exception: e as Exception,
        stackTrace: s,
      );
    }
  }

  @override
  Future<BaseResponse<BaseData>> resetPass(
      ResetPassRequest data, String token) async {
    try {
      final response = await _authApi.resetPass(data, token);
      return response;
    } on DioException catch (e, s) {
      throw mapDioExceptionToFailure(e, s);
    } catch (e, s) {
      throw Failure(
        message:
            "An unexpected error occurred when reset password. Please try again later.",
        exception: e as Exception,
        stackTrace: s,
      );
    }
  }

  @override
  Future<BaseResponse<ForgotPassData>> forgotPassVerify(
      ForgotPassVerifyRequest data) async {
    try {
      final response = await _authApi.forgotPassVerify(data);
      return response;
    } on DioException catch (e, s) {
      throw mapDioExceptionToFailure(e, s);
    } catch (e, s) {
      throw Failure(
        message:
            "An unexpected error occurred when verify for forgot password. Please try again later.",
        exception: e as Exception,
        stackTrace: s,
      );
    }
  }

  /*
  * Mapper
  * */
  @override
  UserModel mapToUserModel(UserData data) {
    return UserModel(
        id: data.id, name: data.name, email: data.email, avatar: data.avatar);
  }

  @override
  List<CategoryModel> mapToCategoryModels(List<String> data) {
    return data.map((e) => CategoryModel(name: e)).toList();
  }

  @override
  SettingModel mapToSettingModel(SettingData data) {
    return SettingModel(
      userId: data.userId,
      id: data.id,
      isNotificationEnable: data.isNotificationEnabled,
      language: data.language,
      theme: data.theme,
      remindBefore: data.remindBefore,
    );
  }
}
