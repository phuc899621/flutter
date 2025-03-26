import 'dart:io';

import 'package:dio/dio.dart';
import 'package:taskit/core/resources/data_state.dart';
import 'package:taskit/features/auth/domain/entities/user_entity.dart';
import 'package:taskit/features/auth/domain/repository/auth_repository.dart';

import '../data_sources/remote/auth_api_service.dart';
import '../models/register.dart';

class AuthRepositoryImpl implements AuthRepository{
  final AuthApiService _authApiService;
  AuthRepositoryImpl(this._authApiService);
  @override


  @override
  Future<DataState<UserEntity>> registerUser({
    required String email,
    required String name,
    required String password
  }) async {
    try{
      final httpReponse=await _authApiService.registerUser(
        registerRequest: RegisterRequest(
          email: email,
          name: name,
          password: password
        )
      );
      //kiem tra ket qua
      if(httpReponse.response.statusCode==HttpStatus.ok){
        return DataSuccess(data: httpReponse.data);
      }else{
        return DataError(
            DioException(
              requestOptions: httpReponse.response.requestOptions,
              response: httpReponse.response,
              type: DioExceptionType.badResponse,
            )
        );
      }
    } on DioException catch(e){
      return DataError(e);
    }
  }

}