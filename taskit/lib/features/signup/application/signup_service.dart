

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../shared/exception/failure.dart';
import '../data/dto/request/signup_request.dart';
import '../data/dto/response/signup_response.dart';
import '../data/repository/signup_repository.dart';
import '../domain/mapper/isignup_model_mapper.dart';
import '../domain/model/signup_model.dart';
import '../domain/repository/isignup_repository.dart';
import 'isignup_service.dart';
import 'package:multiple_result/multiple_result.dart';

final signUpServiceProvider = Provider.autoDispose<ISignUpService>((ref) {
  final signUpRepository = ref.watch(signUpRepositoryProvider);

  return SignUpService(signUpRepository);
});

final class SignUpService implements ISignUpService, ISignUpModelMapper {
  final ISignupRepository _signUpRepository;

  SignUpService(this._signUpRepository);

  @override
  Future<Result<SignupModel, Failure>> signUp(SignupRequest data) async {
    try {
      final response = await _signUpRepository.signup(data);

      final model = mapToSignUpModel(response);
      return Success(model);
    } on Failure catch (e) {
      return Error(e);
    } catch (e, s) {
      if (e is Exception) {
        return Error(Failure(
          message: e.toString(),
          exception: e,
          stackTrace: s,
        ));
      } else {
        return Error(Failure(
          message: e.toString(),
          exception: Exception("Unknown error"),
          stackTrace: s,
        ));
      }
    }
  }

  @override
  SignupModel mapToSignUpModel(SignupResponse response) {
    final email = response.data.email;

    return SignupModel(
      email: email,
    );
  }
}