import 'package:taskit/core/resources/data_state.dart';
import 'package:taskit/core/usecases/usecase.dart';
import 'package:taskit/features/auth/data/models/user.dart';
import 'package:taskit/features/auth/domain/entities/login_param.dart';
import 'package:taskit/features/auth/domain/entities/user.dart';

import '../repository/auth_repository.dart';

class LoginUseCase implements UseCase<DataState<UserEntity>,LoginParam>{
  final AuthRepository _authRepository;
  LoginUseCase(this._authRepository);
  @override
  Future<DataState<UserEntity>> call({LoginParam? p}) {
    // TODO: implement call
    return _authRepository.login(p!.email, p.password);}

}