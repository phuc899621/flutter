
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/src/result.dart';
import 'package:taskit/features/forgot_password/data/dtos/request/forgot_pass_verify/forgot_pass_verify_req.dart';
import 'package:taskit/features/forgot_password/data/dtos/request/reset_pass/reset_pass_req.dart';
import 'package:taskit/features/forgot_password/data/dtos/response/forgot_pass_verify_res.dart';
import 'package:taskit/features/forgot_password/data/repository/forgot_pass_repository.dart';

import 'package:taskit/features/forgot_password/domain/model/forgot_pass_verify_model.dart';
import 'package:taskit/shared/domain/mapper/ibase_model_mapper.dart';
import 'package:taskit/shared/domain/model/base_model.dart';
import 'package:taskit/shared/dto/base_response.dart';
import 'package:taskit/shared/dto/base_response_data.dart';

import 'package:taskit/shared/exception/failure.dart';

import '../data/dtos/request/forgot_pass/forgot_pass_req.dart';
import '../data/repository/iforgot_pass_repository.dart';
import '../domain/mapper/iforgot_pass_verify_model_mapper.dart';
import 'iforgot_pass_service.dart';

final forgotPassServiceProvider = Provider<IForgotPassService>((ref) {
  final iForgotPassRepository = ref.watch(forgotPassRepositoryProvider);
  return ForgotPassService(iForgotPassRepository);
});


class ForgotPassService
    implements IForgotPassService,
        IForgotPassVerifyModelMapper,
          IBaseModelMapper {
  final IForgotPassRepository _iForgotPassRepository;

  ForgotPassService(this._iForgotPassRepository);

  @override
  Future<Result<BaseModel, Failure>> forgotPass(ForgotPassRequest data) async {
    try {
      final response = await _iForgotPassRepository.forgotPass(data);
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
      }
      else {
        return Error(Failure(
          message: e.toString(),
          exception: Exception("Unknown error at forgot password"),
          stackTrace: s,
        ));
      }
    }
  }


  @override
  ForgotPassVerifyModel mapToForgotPassVerifyModel(
      BaseResponse<ForgotPassVerifyData> data) {
    return ForgotPassVerifyModel(resetToken: data.data.resetToken);
  }

  @override
  Future<Result<BaseModel, Failure>> reset(ResetPassRequest data,
      String resetToken) async {
    try {
      final response = await _iForgotPassRepository.reset(data, resetToken);
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
      }
      else {
        return Error(Failure(
          message: e.toString(),
          exception: Exception("Unknown error at reset password"),
          stackTrace: s,
        ));
      }
    }
  }

  @override
  Future<Result<ForgotPassVerifyModel, Failure>> verify(
      ForgotPassVerifyRequest data) async {
    try {
      final response = await _iForgotPassRepository.verify(data);
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
      }
      else {
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
    return BaseModel();
  }
}