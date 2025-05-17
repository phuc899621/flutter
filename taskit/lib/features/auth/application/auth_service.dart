import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/src/result.dart';
import 'package:taskit/features/auth/data/dto/req/login/login_request.dart';
import 'package:taskit/features/auth/data/dto/res/forgot_pass/verify.dart';
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
import '../data/repo/auth_repo.dart';
import '../domain/entites/forgot_pass/forgot_pass_verify.dart';
import 'iauth_service.dart';

final authServiceProvider = Provider<IAuthService>((ref) {
  final authRepo = ref.watch(authRepoProvider);
  return AuthService(authRepo);
});

class AuthService implements IAuthEntityMapper, IAuthService, IBaseModelMapper {
  final IAuthRepo _iAuthRepo;
  AuthService(this._iAuthRepo);

  /*
  * Login
  * */
  @override
  Future<Result<void, Failure>> login(LoginRequest data) async {
    try {
      await _iAuthRepo.login(data);
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
          exception: Exception("Unknown error at login"),
          stackTrace: s,
        ));
      }
    }
  }

  @override
  Future<Result<void, Failure>> checkLogin() async {
    try {
      await _iAuthRepo.checkLogin();
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
  Future<Result<void, Failure>> signup(SignupRequest data) async {
    try {
      await _iAuthRepo.signup(data);
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

  /*
  * Forgot Password
  * */
  @override
  Future<Result<void, Failure>> forgotPass(ForgotPassRequest data) async {
    try {
      await _iAuthRepo.forgotPass(data);
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
  Future<Result<ForgotPassVerifyEntity, Failure>> forgotPassVerify(
      ForgotPassVerifyRequest data) async {
    try {
      final response = await _iAuthRepo.forgotPassVerify(data);
      final entity = mapToForgotPassVerifyEntity(response);
      return Success(entity);
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

  @override
  ForgotPassVerifyEntity mapToForgotPassVerifyEntity(
      BaseResponse<ForgotPassData> data) {
    return ForgotPassVerifyEntity(
      resetToken: data.data.resetToken,
    );
  }
}
