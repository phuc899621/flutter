import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/signup/data/dto/response/signup_response.dart';
import 'package:taskit/features/signup/domain/repository/isignup_repository.dart';

import '../../../../core/usecases/usecase.dart';
import '../../data/dto/request/signup_request.dart';
import '../../data/repository/signup_repository.dart';
final signupUseCaseProvider = Provider.autoDispose<SignupUseCase>(
        (ref) {
  final repository = ref.watch(signUpRepositoryProvider);
  return SignupUseCase(repository);
});


class SignupUseCase implements UseCase<SignupResponse, SignupRequest> {
  final ISignupRepository _repository;
  SignupUseCase(this._repository);

  @override
  Future<SignupResponse> call({SignupRequest? p}) async{
    if (p == null) {
      throw Exception("Request cannot be null");
    }
    return await _repository.signup(p);
  }

}