
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/core/extension/string_hardcoded.dart';

import '../../../../core/exception/failure.dart';
import '../../../../core/mixin/dio_exception_mapper.dart';
import '../../domain/repository/isignup_repository.dart';
import '../dto/request/signup_request.dart';
import '../dto/response/signup_response.dart';
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
  Future<SignupResponse> signup(SignupRequest data) async {
    try {
      final response = await _signUpApi.signUp(data);

      return response;
    } on DioException catch (e, s) {
      throw mapDioExceptionToFailure(e, s);
    } catch (e, s) {
      throw Failure(
        message:
        "An unexpected error occurred. Please try again later".hardcoded,
        exception: e as Exception,
        stackTrace: s,
      );
    }
  }
}

