import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../shared/domain/usecase/usecase.dart';

final validateTaskTitleInputUseCaseProvider =
    Provider<ValidateTaskTitleInputUseCase>(
      (ref) => ValidateTaskTitleInputUseCase(),
    );

class ValidateTaskTitleInputUseCase extends UseCase<String?, String> {
  @override
  String? call(String title) {
    if (title.isEmpty) {
      return 'Please enter a TaskTitle name';
    }
    if (title.length < 3) {
      return 'Task`s title name must be at least 3 characters long';
    }
    if (!RegExp(r'^[a-zA-Z0-9À-ỹ\s]+$').hasMatch(title)) {
      return 'Task`s title must not contain special characters';
    }
    return null;
  }
}
