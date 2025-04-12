import 'package:taskit/features/login/data/dto/request/login_request.dart';

import '../../../shared/exception/failure.dart';
import '../../../shared/exception/failure.dart';
import '../domain/model/login_model.dart';
import 'package:multiple_result/multiple_result.dart';
abstract interface class ILoginService{
  Future<Result<LoginModel, Failure>> login(LoginRequest data);
}