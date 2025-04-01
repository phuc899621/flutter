
import '../../../../core/exception/failure.dart';
import '../../data/dto/request/signup_request.dart';
import '../model/signup_model.dart';
import 'package:multiple_result/multiple_result.dart';
abstract interface class ISignUpService {
  Future<Result<SignupModel, Failure>> signUp(SignupRequest data);
}
