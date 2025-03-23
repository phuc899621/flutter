import 'dart:io';

import 'package:dio/dio.dart';
import 'package:taskit/core/resources/data_state.dart';
import 'package:taskit/features/auth/domain/entities/user.dart';
import 'package:taskit/features/auth/domain/repository/auth_repository.dart';

import '../data_sources/remote/auth_api_service.dart';

class AuthRepositoryImpl implements AuthRepository{
  final AuthApiService _authApiService;
  AuthRepositoryImpl(this._authApiService);
  @override
  Future<DataState<UserEntity>> login(String email, String password) async {
    // TODO: implement login
    try{
    //cach goi api, truyen vao cac thuoc tinh
    final httpReponse=await _authApiService.getLoginAuth(
        email: email,
        password: password
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