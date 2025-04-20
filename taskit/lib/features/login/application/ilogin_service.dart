import 'package:taskit/features/login/data/dto/request/login_request.dart';
import 'package:taskit/features/login/data/dto/response/login_verify_data.dart';

import '../../../shared/exception/failure.dart';
import '../../../shared/exception/failure.dart';
import '../domain/model/login_model.dart';
import 'package:multiple_result/multiple_result.dart';

import '../domain/model/login_verify_model.dart';
abstract interface class ILoginService{
  Future<Result<LoginModel, Failure>> login(LoginRequest data);
  Future<Result<LoginVerifyModel,Failure>> verify(String token);
}