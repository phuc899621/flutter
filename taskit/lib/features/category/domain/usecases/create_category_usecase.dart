import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../shared/domain/usecase/future_usecase.dart';
import '../../../../shared/exception/failure.dart';
import '../../data/repo/category_repo.dart';
import '../../data/repo/category_repo_impl.dart';
import '../entities/category_entity.dart';

final createCategoryUseCaseProvider = Provider((ref) {
  final categoryRepo = ref.watch(categoryRepoProvider);
  return CreateCategoryUseCase(categoryRepo);
});

class CreateCategoryUseCase extends FutureUseCase<void, CategoryEntity> {
  final CategoryRepo _categoryRepo;

  CreateCategoryUseCase(this._categoryRepo);

  @override
  Future<Result<void, Failure>> call(CategoryEntity params) =>
      runSafe(() => _categoryRepo.insertCategory(params));
}
