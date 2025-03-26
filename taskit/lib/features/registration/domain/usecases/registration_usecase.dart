import 'package:taskit/core/resources/data_state.dart';
import 'package:taskit/core/usecases/usecase.dart';
import 'package:taskit/features/registration/domain/entities/registration_param.dart';
import 'package:taskit/features/registration/domain/entities/user_entity.dart';
import 'package:taskit/features/registration/domain/entities/registration_param.dart';

import '../repository/registration_repository.dart';

class RegistrationUseCase implements UseCase<DataState<UserEntity>,RegistrationParam>{
  final RegistrationRepository _regRepository;

  RegistrationUseCase(this._regRepository);


  @override
  Future<DataState<UserEntity>> call({RegistrationParam? p}) {
    return _regRepository.registerUser(
        email: p!.email,
        name: p.name,
        password: p.password
    );
  }
}