import 'package:multiple_result/multiple_result.dart';

import '../exception/failure.dart';

mixin ResultHandler {
  Future<Result<T, Failure>> runSafe<T>(Future<T> Function() call) async {
    try {
      return Success(await call());
    } on Failure catch (e) {
      return Error(e);
    } catch (e, s) {
      return Error(Failure(
        message: e.toString(),
        exception: e is Exception ? e : Exception(e.toString()),
        stackTrace: s,
      ));
    }
  }
}