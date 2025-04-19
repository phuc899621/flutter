
import 'package:multiple_result/multiple_result.dart';
import 'package:taskit/features/forgot_password/data/dtos/request/forgot_pass/forgot_pass_req.dart';
import 'package:taskit/features/forgot_password/data/dtos/request/forgot_pass_verify/forgot_pass_verify_req.dart';
import 'package:taskit/features/forgot_password/data/dtos/request/reset_pass/reset_pass_req.dart';
import 'package:taskit/features/forgot_password/domain/model/forgot_pass_verify_model.dart';
import 'package:taskit/shared/domain/model/base_model.dart';
import 'package:taskit/shared/exception/failure.dart';

abstract interface class IForgotPassService{
  Future<Result<BaseModel,Failure>> forgotPass(ForgotPassRequest data);
  Future<Result<ForgotPassVerifyModel,Failure>> verify(ForgotPassVerifyRequest data);
  Future<Result<BaseModel,Failure>> reset(ResetPassRequest data,String resetToken);
}