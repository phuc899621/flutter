import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/src/result.dart';
import 'package:taskit/features/category/data/repo/category_repo.dart';
import 'package:taskit/features/category/domain/entities/category_entity.dart';
import 'package:taskit/shared/domain/usecase/future_usecase.dart';
import 'package:taskit/shared/exception/failure.dart';

import '../../data/repo/category_repo_impl.dart';

final editCategoryUseCaseProvider = Provider(
  (ref) => EditCategoryUseCase(ref.watch(categoryRepoProvider)),
);

class EditCategoryUseCase extends FutureUseCase<void, CategoryEntity> {
  final CategoryRepo _repo;

  EditCategoryUseCase(this._repo);

  @override
  Future<Result<void, Failure>> call(CategoryEntity params) =>
      runSafe(() => _repo.updateCategoryName(params));
}
