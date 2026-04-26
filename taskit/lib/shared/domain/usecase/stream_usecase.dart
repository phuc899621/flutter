import 'dart:async';

abstract class StreamUseCase<T, Params> {
  Stream<T> call(Params params);
}
