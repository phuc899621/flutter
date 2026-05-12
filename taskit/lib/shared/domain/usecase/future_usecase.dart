import 'package:multiple_result/multiple_result.dart';
import 'package:taskit/shared/utils/result_handler.dart';

import '../../exception/failure.dart';

abstract class FutureUseCase<T, Params> with ResultHandler {
  Future<Result<T, Failure>> call(Params params);
}

class NoParam {}
