
import '../../../../../core/exception/failure.dart';
import '../../dto/request/signup_request.dart';
import '../../../domain/model/signup_model.dart';
import 'package:multiple_result/multiple_result.dart';
abstract interface class ISignUpService {
  Future<Result<SignupModel, Failure>> signUp(SignupRequest data);
}
