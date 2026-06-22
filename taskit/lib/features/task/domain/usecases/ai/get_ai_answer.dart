import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:taskit/main_widget.dart';

import '../../../../../shared/domain/usecase/future_usecase.dart';
import '../../../../../shared/exception/failure.dart';
import '../../../data/repo/task_repo.dart';

final getAiAnswerUseCaseProvider = Provider<GetAiAnswerUseCase>((ref) {
  final taskRepo = ref.watch(taskRepoProvider);
  final languageCode = ref.watch(languageCodeProvider);
  return GetAiAnswerUseCase(taskRepo, languageCode);
});

class GetAiAnswerUseCase extends FutureUseCase<String, String> {
  final TaskRepo _repo;
  final String languageCode;

  GetAiAnswerUseCase(this._repo, this.languageCode);

  @override
  Future<Result<String, Failure>> call(String question) => runSafe(() async {
    final offset = DateTime.now().timeZoneOffset;
    final sign = offset.isNegative ? '-' : '+';
    final utcOffset = '$sign$offset';
    return await _repo.getAiAnswer(question, utcOffset, languageCode);
  });
}
