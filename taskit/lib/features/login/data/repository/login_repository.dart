
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/login/data/dto/request/login_request.dart';
import 'package:taskit/features/login/data/dto/response/login_data.dart';
import 'package:taskit/features/login/data/dto/response/login_verify_data.dart';
import 'package:taskit/features/login/data/repository/ilogin_repository.dart';
import 'package:taskit/shared/dto/base_response.dart';

import '../../../../shared/exception/failure.dart';
import '../../../../shared/mixin/dio_exception_mapper.dart';
import '../source/remote/login_api.dart';

final loginRepositoryProvider = Provider.autoDispose<ILoginRepository>((ref) {
  final loginApi = ref.watch(loginApiProvider);
  return LoginRepository(loginApi);
});


class LoginRepository
    with DioExceptionMapper
    implements ILoginRepository{
  final LoginApi _loginApi;
  LoginRepository(this._loginApi);

  @override
  Future<BaseResponse<LoginData>> login(LoginRequest data) async {
    try{
      final response = await _loginApi.login(data);
      return response;
    }on DioException catch(e, s){
      throw mapDioExceptionToFailure(e, s);
    }catch(e,s){
      throw Failure(
        message: "An unexpected error occurred when login. Please try again later.",
        exception: e as Exception,
        stackTrace: s,
      );
    }
  }

  @override
  Future<BaseResponse<LoginVerifyData>> verify(String token) async {
    try{
      final response = await _loginApi.verify('Bearer $token');
      return response;
    }on DioException catch(e, s){
      throw mapDioExceptionToFailure(e, s);
    }catch(e,s){
      if (e is Exception) {
        throw Failure(
          message: "An unexpected error occurred when verify login. Please try again later.",
          exception: e,
          stackTrace: s,
        );
      } else {
        // Xử lý khi e không phải Exception
        throw Failure(
          message: "An unexpected error occurred when verify login. Please try again later.",
          exception: Exception(e.toString()), // Tạo một Exception mới
          stackTrace: s,
        );
      }
    }
  }



}