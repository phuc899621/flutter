import 'package:multiple_result/multiple_result.dart';

import '../exception/failure.dart';
import '../log/logger_provider.dart';

mixin ResultHandler {
  Future<Result<T, Failure>> runSafe<T>(Future<T> Function() call) async {
    try {
      return Success(await call());
    } on Failure catch (e) {
      logger.e('[RunSafeFailure] error', error: e);
      return Error(e);
    } catch (e, s) {
      logger.e('[RunSafeNotFailure] error', error: e, stackTrace: s);
      return Error(
        Failure(
          message: e.toString(),
          exception: e is Exception ? e : Exception(e.toString()),
          stackTrace: s,
        ),
      );
    }
  }
}
