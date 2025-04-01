

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/exception/failure.dart';
import '../../dto/request/signup_request.dart';
import '../../dto/response/signup_response.dart';
import '../../repository/signup_repository.dart';
import '../../../domain/mapper/isignup_model_mapper.dart';
import '../../../domain/model/signup_model.dart';
import '../../../domain/repository/isignup_repository.dart';
import '../../../domain/services/isignup_service.dart';
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
      return Error(Failure(
        message: e.toString(),
        exception: e as Exception,
        stackTrace: s,
      ));
    }
  }

  @override
  SignupModel mapToSignUpModel(SignupResponse response) {
    final user = response.data.user;

    return SignupModel(
      name: user.name,
      email: user.email,
      isSignUpSuccess: true,
    );
  }
}