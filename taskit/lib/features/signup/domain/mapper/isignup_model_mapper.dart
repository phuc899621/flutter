import '../../data/dto/response/signup_response.dart';
import '../model/signup_model.dart';

abstract interface class ISignUpModelMapper {
  SignupModel mapToSignUpModel(SignupResponse data);
}