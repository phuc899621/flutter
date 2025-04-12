
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/signup/data/dto/request/signup_verify_req/signup_verify_request.dart';
import 'package:taskit/shared/dto/base_response.dart';

import '../../../../shared/exception/failure.dart';
import '../../../../shared/mixin/dio_exception_mapper.dart';
import 'isignup_repository.dart';
import '../dto/request/signup_req/signup_request.dart';
import '../dto/response/signup_res/signup_data.dart';
import '../source/remote/signup_api.dart';

final signUpRepositoryProvider = Provider.autoDispose<ISignupRepository>((ref) {
  final signUpApi = ref.watch(signUpApiProvider);

  return SignUpRepository(signUpApi);
});

final class SignUpRepository
    with DioExceptionMapper
    implements ISignupRepository {
  final SignUpApi _signUpApi;

  SignUpRepository(this._signUpApi);

  @override
  Future<BaseResponse<SignupData>> signup(SignupRequest data) async {
    try {
      final response = await _signUpApi.signup(data);

      return response;
    } on DioException catch (e, s) {
      throw mapDioExceptionToFailure(e, s);
    } catch (e, s) {
      throw Failure(
        message: "An unexpected error occurred when sign up. Please try again later.",
        exception: e as Exception,
        stackTrace: s,
      );
    }
  }

  @override
  Future<BaseResponse<SignupData>> verify(SignupVerifyRequest data) async {
    try {
      final response = await _signUpApi.verify(data);
      return response;
    } on DioException catch (e, s) {
      throw mapDioExceptionToFailure(e, s);
    } catch (e, s) {
      throw Failure(
        message: "An unexpected error occurred when verify signup email. Please try again later.",
        exception: e as Exception,
        stackTrace: s,
      );
    }
  }
}

