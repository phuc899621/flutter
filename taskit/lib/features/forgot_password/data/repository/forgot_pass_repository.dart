






import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/forgot_password/data/dtos/request/forgot_pass_verify/forgot_pass_verify_req.dart';
import 'package:taskit/features/forgot_password/data/dtos/request/reset_pass/reset_pass_req.dart';
import 'package:taskit/features/forgot_password/data/dtos/response/forgot_pass_verify_res.dart';

import 'package:taskit/shared/mixin/dio_exception_mapper.dart';

import '../../../../shared/data/dto/base_response.dart';
import '../../../../shared/data/dto/base_response_data.dart';
import '../../../../shared/exception/failure.dart';
import '../dtos/request/forgot_pass/forgot_pass_req.dart';
import '../source/remote/forgot_pass_api.dart';
import 'iforgot_pass_repository.dart';

final forgotPassRepositoryProvider = Provider<IForgotPassRepository>((ref) {
  final forgotPassApi = ref.watch(forgotPassApiProvider);
  return ForgotPassRepository(forgotPassApi);
});

class ForgotPassRepository with DioExceptionMapper implements IForgotPassRepository{

  final ForgotPassApi _forgotPassApi;
  ForgotPassRepository(this._forgotPassApi);

  @override
  Future<BaseResponse<BaseData>> forgotPass(ForgotPassRequest data) async {
    try{
      final response = await _forgotPassApi.forgotPass(data);
      return response;
    }on DioException catch(e,s){
      throw mapDioExceptionToFailure(e,s);
    }catch (e,s){
      throw Failure(
        message: "An unexpected error occurred when sending forgot password. Please try again later.",
        exception: e as Exception,
        stackTrace: s,
      );
    }
  }

  @override
  Future<BaseResponse<BaseData>> reset(ResetPassRequest data, String token) async {
    try{
      final response = await _forgotPassApi.reset(data,token);
      return response;
    }on DioException catch(e,s){
      throw mapDioExceptionToFailure(e,s);
    }catch (e,s){
      throw Failure(
        message: "An unexpected error occurred when reset password. Please try again later.",
        exception: e as Exception,
        stackTrace: s,
      );
    }
  }

  @override
  Future<BaseResponse<ForgotPassVerifyData>> verify(ForgotPassVerifyRequest data) async {
    try{
      final response = await _forgotPassApi.verify(data);
      return response;
    }on DioException catch(e,s){
      throw mapDioExceptionToFailure(e,s);
    }catch (e,s){
      throw Failure(
        message: "An unexpected error occurred when verify for forgot password. Please try again later.",
        exception: e as Exception,
        stackTrace: s,
      );
    }
  }

}