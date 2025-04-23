

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/signup/data/dto/request/signup_verify_req/signup_verify_request.dart';
import 'package:taskit/features/signup/data/dto/response/signup_res/signup_data.dart';
import '../../../shared/data/dto/base_response.dart';
import '../../../shared/exception/failure.dart';
import '../data/dto/request/signup_req/signup_request.dart';
import '../data/repository/signup_repository.dart';
import '../domain/mapper/isignup_model_mapper.dart';
import '../domain/model/signup_model.dart';
import '../data/repository/isignup_repository.dart';
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
  SignupModel mapToSignUpModel(BaseResponse<SignupData> data) {
    final email = data.data.email;

    return SignupModel(
      email: email,
    );
  }

  @override
  Future<Result<void, Failure>> verify(SignupVerifyRequest data) async {
    try {
      await _signUpRepository.verify(data);
      return Success(null);
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


}