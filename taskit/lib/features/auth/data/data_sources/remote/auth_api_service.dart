
import  'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:taskit/core/constants/constants.dart';
import 'package:taskit/features/auth/data/models/response.dart';

import '../../models/register.dart';
part 'auth_api_service.g.dart';
@RestApi(baseUrl: apiAuthUrl)
abstract class AuthApiService{
  factory AuthApiService(Dio dio) = _AuthApiService;

  @GET('/registration')
  Future<HttpResponse<ResponseModel>> registerUser({
    @Body() RegisterRequest registerRequest
  });
}