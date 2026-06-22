import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:taskit/features/user/domain/usecase/get_current_user_usecase.dart';
import 'package:taskit/shared/extension/result_return.dart';

import '../../../../shared/domain/usecase/future_usecase.dart';
import '../../../../shared/exception/failure.dart';
import '../../data/repo/category_repo.dart';
import '../entities/category_entity.dart';

final createCategoryUseCaseProvider = Provider((ref) {
  final categoryRepo = ref.watch(categoryRepoProvider);
  final getCurrentUser = ref.watch(getCurrentUserUseCaseProvider);
  return CreateCategoryUseCase(categoryRepo, getCurrentUser);
});

class CreateCategoryUseCase extends FutureUseCase<void, CategoryEntity> {
  final CategoryRepo _categoryRepo;
  final GetCurrentUserUseCase _getCurrent;

  CreateCategoryUseCase(this._categoryRepo, this._getCurrent);

  @override
  Future<Result<void, Failure>> call(CategoryEntity params) =>
      runSafe(() async {
        final getCurrent = await _getCurrent.call(NoParam());
        final currentUser = getCurrent.dataOrNull();
        if (currentUser == null) return;
        await _categoryRepo.insertCategory(
          params.copyWith(userLocalId: currentUser.localId),
        );
      });
}
