



import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/src/result.dart';
import 'package:taskit/features/login/application/ilogin_service.dart';
import 'package:taskit/features/login/data/dto/request/login_request.dart';
import 'package:taskit/features/login/data/dto/response/login_data.dart';
import 'package:taskit/features/login/data/dto/response/login_verify_data.dart';
import 'package:taskit/features/login/data/repository/ilogin_repository.dart';
import 'package:taskit/features/login/domain/mapper/ilogin_model_mapper.dart';
import 'package:taskit/features/login/domain/model/login_model.dart';
import 'package:taskit/features/login/domain/model/login_verify_model.dart';
import 'package:taskit/shared/application/token_service.dart';
import 'package:taskit/shared/dto/base_response.dart';
import 'package:taskit/shared/exception/failure.dart';

import '../data/repository/login_repository.dart';

final loginServiceProvider = Provider.autoDispose<ILoginService>((ref) {
  final loginRepository = ref.watch(loginRepositoryProvider);
  return LoginService(loginRepository);
});


class LoginService implements ILoginService,ILoginModelMapper{
  final ILoginRepository _iLoginRepository;
  LoginService(this._iLoginRepository);
  @override
  Future<Result<LoginModel, Failure>> login(LoginRequest data) async {
    try {
      final response = await _iLoginRepository.login(data);
      final model = mapToLoginModel(response);
      return Success(model);
    } on Failure catch (e) {
      return Error(e);
    } catch (e, s) {
      if (e is Exception) {
        return Error(Failure(
          message:e.toString(),
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
  LoginModel mapToLoginModel(BaseResponse<LoginData> data) {
    final token = data.data.token;
    return LoginModel(
      token: token,
    );
  }

  @override
  LoginVerifyModel mapToLoginVerifyModel(BaseResponse<LoginVerifyData> data) {
    final name = data.data.name;
    final gmail = data.data.gmail;
    return LoginVerifyModel(
      name: name,
      gmail: gmail,
    );
  }

  @override
  Future<Result<LoginVerifyModel, Failure>> verify(String token) async {
    try {
      final response = await _iLoginRepository.verify(token);
      final model = mapToLoginVerifyModel(response);
      return Success(model);
    } on Failure catch (e) {
      return Error(e);
    } catch (e, s) {
      if (e is Exception) {
        return Error(Failure(
          message:e.toString(),
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


}