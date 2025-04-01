import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/constants/http_status.dart';



import 'package:taskit/shared/data/token/itoken_service.dart';
import 'package:taskit/shared/data/token/token_service.dart';

import '../dtos/refresh_token_response.dart';
import '../security/secure_storage_const.dart';




/*
* Them token vao response khi call api
* */
final networkServiceInterceptorProvider = Provider.family<NetworkServiceInterceptor, Dio>(
    (ref,dio){

      final tokenService=ref.watch(tokenServiceProvider(dio));
      return NetworkServiceInterceptor(tokenService,dio);
    }
);

final class NetworkServiceInterceptor extends Interceptor{
  final Dio _dio;
  final ITokenService _iTokenService;
  NetworkServiceInterceptor(this._iTokenService,this._dio);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final accessToken= await _iTokenService.getAccessToken();

    options.headers['Content-Type']='application/json';
    /*options.headers['Authorization']='Bearer $accessToken';
    options.headers['Accept']='application/json';*/
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if(err.response?.statusCode==unauthorized){

      final token=await _iTokenService.getRefreshToken();
      try{
        final result = await _iTokenService.refreshToken(token);

        final accessToken = result.data.accessToken;
        final refreshToken = result.data.refreshToken;

        await _iTokenService.saveToken(accessToken, refreshToken);
        final options = err.requestOptions;
        options.headers['Authorization'] = 'Bearer $accessToken';
        return handler.resolve(await _dio.fetch(options));

      } on DioException catch (e) {
        if(e.response?.statusCode==refreshTokenExpired){
          await _iTokenService.clearToken();
          return handler.next(e);
        }
        return handler.next(e);
      }

    }
    super.onError(err, handler);
  }

  Future<Response<Map<String,dynamic>>> _refreshToken(Dio dio, String? refreshToken) async{
    return await dio.post<Map<String, dynamic>>(
      '$apiAuthUrl/auth/refresh-token',
      data: {
        'refreshToken': refreshToken
      }
    );
  }
}