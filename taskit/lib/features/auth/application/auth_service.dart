import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/src/result.dart';
import 'package:taskit/features/auth/data/dto/req/login/login_request.dart';
import 'package:taskit/features/auth/data/dto/res/forgot_pass/verify.dart';
import 'package:taskit/features/auth/data/dto/res/login/login_data.dart';
import 'package:taskit/features/auth/data/repo/iauth_repo.dart';
import 'package:taskit/features/auth/domain/mapper/iauth_mapper.dart';
import 'package:taskit/shared/data/dto/response/base_response.dart';
import 'package:taskit/shared/domain/mapper/ibase_model_mapper.dart';
import 'package:taskit/shared/exception/failure.dart';

import '../../../shared/data/dto/response/base_response_data.dart';
import '../../../shared/domain/model/base_model.dart';
import '../data/dto/req/forgot_pass/forgot_pass.dart';
import '../data/dto/req/forgot_pass/forgot_pass_verify.dart';
import '../data/dto/req/forgot_pass/reset_pass.dart';
import '../data/dto/req/signup/signup_request.dart';
import '../data/dto/req/signup/signup_verify_request.dart';
import '../data/dto/res/login/login_verify_data.dart';
import '../data/dto/res/signup/signup_data.dart';
import '../data/repo/auth_repo.dart';
import '../domain/entites/forgot_pass/forgot_pass_verify.dart';
import '../domain/entites/login/login.dart';
import '../domain/entites/login/login_verify.dart';
import '../domain/entites/setting/setting.dart';
import '../domain/entites/signup/signup.dart';
import 'iauth_service.dart';

final authServiceProvider = Provider<IAuthService>((ref) {
  final authRepo = ref.watch(authRepoProvider);
  return AuthService(authRepo);
});

class AuthService implements IAuthMapper, IAuthService, IBaseModelMapper {
  final IAuthRepo _iAuthRepo;
  AuthService(this._iAuthRepo);

  /*
  * Login
  * */
  @override
  Future<Result<LoginModel, Failure>> login(LoginRequest data) async {
    try {
      final response = await _iAuthRepo.login(data);
      final model = mapToLoginModel(response);
      return Success(model);
    } on Failure catch (e) {
      return Error(e);
    } catch (e, s) {
      if (e is Exception) {
        return Error(Failure(
          message: e.toString(),
          exception: e,
          stackTrace: s,
        ));
      } else {
        return Error(Failure(
          message: e.toString(),
          exception: Exception("Unknown error at login"),
          stackTrace: s,
        ));
      }
    }
  }

  @override
  LoginVerifyModel mapToLoginVerifyModel(BaseResponse<LoginVerifyData> data) {
    return LoginVerifyModel(
      name: data.data.name,
      gmail: data.data.email,
    );
  }

  @override
  LoginModel mapToLoginModel(BaseResponse<LoginData> data) {
    final token = data.data.token;
    final settings = SettingModel(
      isNotificationEnabled: data.data.settings.isNotificationEnabled,
      remindBefore: data.data.settings.remindBefore,
      categories: data.data.settings.category,
      language: data.data.settings.language,
      theme: data.data.settings.theme,
    );
    return LoginModel(
      token: token,
      setting: settings,
    );
  }

  @override
  Future<Result<LoginVerifyModel, Failure>> checkLogin(String token) async {
    try {
      final response = await _iAuthRepo.checkLogin(token);
      final model = mapToLoginVerifyModel(response);
      return Success(model);
    } on Failure catch (e) {
      return Error(e);
    } catch (e, s) {
      if (e is Exception) {
        return Error(Failure(
          message: e.toString(),
          exception: e,
          stackTrace: s,
        ));
      } else {
        return Error(Failure(
          message: e.toString(),
          exception: Exception("Unknown error at verify login"),
          stackTrace: s,
        ));
      }
    }
  }

  /*
  * Sign Up
  * */
  @override
  Future<Result<SignupModel, Failure>> signup(SignupRequest data) async {
    try {
      final response = await _iAuthRepo.signup(data);

      final model = mapToSignUpModel(response);
      return Success(model);
    } on Failure catch (e) {
      return Error(e);
    } catch (e, s) {
      if (e is Exception) {
        return Error(Failure(
          message: e.toString(),
          exception: e,
          stackTrace: s,
        ));
      } else {
        return Error(Failure(
          message: e.toString(),
          exception: Exception("Unknown error"),
          stackTrace: s,
        ));
      }
    }
  }

  @override
  SignupModel mapToSignUpModel(BaseResponse<SignupData> data) {
    final email = data.data.email;
    return SignupModel(
      email: email,
    );
  }

  @override
  Future<Result<void, Failure>> signupVerify(SignupVerifyRequest data) async {
    try {
      await _iAuthRepo.signupVerify(data);
      return const Success(null);
    } on Failure catch (e) {
      return Error(e);
    } catch (e, s) {
      if (e is Exception) {
        return Error(Failure(
          message: e.toString(),
          exception: e,
          stackTrace: s,
        ));
      } else {
        return Error(Failure(
          message: e.toString(),
          exception: Exception("Unknown error"),
          stackTrace: s,
        ));
      }
    }
  }

  @override
  ForgotPassVerifyModel mapToForgotPassVerifyModel(
      BaseResponse<ForgotPassData> data) {
    return ForgotPassVerifyModel(
      resetToken: data.data.resetToken,
    );
  }

  /*
  * Forgot Password
  * */
  @override
  Future<Result<BaseModel, Failure>> forgotPass(ForgotPassRequest data) async {
    try {
      final response = await _iAuthRepo.forgotPass(data);
      final model = mapToBaseModel(response);
      return Success(model);
    } on Failure catch (e) {
      return Error(e);
    } catch (e, s) {
      if (e is Exception) {
        return Error(Failure(
          message: e.toString(),
          exception: e,
          stackTrace: s,
        ));
      } else {
        return Error(Failure(
          message: e.toString(),
          exception: Exception("Unknown error at forgot password"),
          stackTrace: s,
        ));
      }
    }
  }

  @override
  Future<Result<BaseModel, Failure>> resetPass(
      ResetPassRequest data, String resetToken) async {
    try {
      final response = await _iAuthRepo.resetPass(data, resetToken);
      final model = mapToBaseModel(response);
      return Success(model);
    } on Failure catch (e) {
      return Error(e);
    } catch (e, s) {
      if (e is Exception) {
        return Error(Failure(
          message: e.toString(),
          exception: e,
          stackTrace: s,
        ));
      } else {
        return Error(Failure(
          message: e.toString(),
          exception: Exception("Unknown error at reset password"),
          stackTrace: s,
        ));
      }
    }
  }

  @override
  Future<Result<ForgotPassVerifyModel, Failure>> forgotPassVerify(
      ForgotPassVerifyRequest data) async {
    try {
      final response = await _iAuthRepo.forgotPassVerify(data);
      final model = mapToForgotPassVerifyModel(response);
      return Success(model);
    } on Failure catch (e) {
      return Error(e);
    } catch (e, s) {
      if (e is Exception) {
        return Error(Failure(
          message: e.toString(),
          exception: e,
          stackTrace: s,
        ));
      } else {
        return Error(Failure(
          message: e.toString(),
          exception: Exception("Unknown error at verify for forgot password"),
          stackTrace: s,
        ));
      }
    }
  }

  @override
  BaseModel mapToBaseModel(BaseResponse<BaseData> data) {
    return const BaseModel();
  }
}
