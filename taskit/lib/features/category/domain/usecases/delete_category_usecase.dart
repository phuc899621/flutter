import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/src/result.dart';
import 'package:taskit/features/category/data/repo/category_repo.dart';
import 'package:taskit/features/category/domain/entities/category_entity.dart';
import 'package:taskit/shared/domain/usecase/future_usecase.dart';
import 'package:taskit/shared/exception/failure.dart';

import '../../data/repo/category_repo_impl.dart';

final deleteCategoryUseCaseProvider = Provider(
  (ref) => DeleteCategoryUseCase(ref.watch(categoryRepoProvider)),
);

class DeleteCategoryUseCase extends FutureUseCase<void, CategoryEntity> {
  final CategoryRepo _repo;

  DeleteCategoryUseCase(this._repo);

  @override
  Future<Result<void, Failure>> call(CategoryEntity params) =>
      runSafe(() => _repo.deleteCategory(params));
}
