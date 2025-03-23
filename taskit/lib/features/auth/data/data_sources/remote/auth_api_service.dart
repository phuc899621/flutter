
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:taskit/core/constants/constants.dart';
import 'package:taskit/features/auth/data/models/user.dart';
part 'auth_api_service.g.dart';
@RestApi(baseUrl: apiBaseUrl)
abstract class AuthApiService{
  factory AuthApiService(Dio dio) = _AuthApiService;
  @GET('/login')
  Future<HttpResponse<UserModel>> getLoginAuth({
    @Query('email') required String email,
    @Query('password') required String password,
});
}