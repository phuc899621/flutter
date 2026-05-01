import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/src/result.dart';
import 'package:taskit/features/category/data/repo/category_repo.dart';
import 'package:taskit/features/category/data/repo/category_repo_impl.dart';
import 'package:taskit/shared/exception/failure.dart';

import '../../../../shared/domain/usecase/usecase.dart';

final pullCategoriesUseCaseProvider = Provider(
  (ref) => PullCategoriesUseCase(ref.watch(categoryRepoProvider)),
);

class PullCategoriesUseCase extends UseCase<void, int> {
  final CategoryRepo _categoryRepo;

  PullCategoriesUseCase(this._categoryRepo);

  @override
  Future<Result<void, Failure>> call(int userLocalId) =>
      runSafe(() => _categoryRepo.pullCategories(userLocalId));
}
