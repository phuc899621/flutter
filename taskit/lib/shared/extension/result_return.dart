import 'package:multiple_result/multiple_result.dart';

extension ResultX<S, E> on Result<S, E> {
  S? dataOrNull() {
    return when((success) => success, (_) => null);
  }
}
