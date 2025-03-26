import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:taskit/features/auth/data/data_sources/remote/auth_api_service.dart';
import 'package:taskit/features/auth/data/repository/authe_repository_impl.dart';

import 'features/auth/domain/repository/registration_repository.dart';
import 'features/auth/domain/usecases/registration_usecase.dart';
import 'features/auth/presentation/bloc/login/remote/remote_login_bloc.dart';
final sl=GetIt.instance;
Future<void> initDependencies() async{
  sl.registerSingleton<Dio>(Dio());
  sl.registerSingleton<AuthApiService>(AuthApiService(sl()));
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl(sl()));
  sl.registerSingleton<LoginUseCase>(LoginUseCase(sl()));
  sl.registerSingleton<RemoteLoginBloc>(
          RemoteLoginBloc(sl())
  );
}