import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:taskit/shared/log/logger_provider.dart';

import '../../../../shared/domain/usecase/usecase.dart';
import '../../../../shared/exception/failure.dart';
import '../../data/repo/category_repo.dart';
import '../../data/repo/category_repo_impl.dart';

final pushUnsyncedCategoriesUseCaseProvider = Provider((ref) {
  final repo = ref.watch(categoryRepoProvider);
  return PushUnsyncedCategoriesUseCase(repo);
});

class PushUnsyncedCategoriesUseCase extends UseCase<void, int> {
  final CategoryRepo _categoryRepo;

  PushUnsyncedCategoriesUseCase(this._categoryRepo);

  @override
  Future<Result<void, Failure>> call(int userLocalId) async => runSafe(
    () async {
      final unsyncedDeleted = await _categoryRepo.getUnsyncedDeletedCategories(
        userLocalId,
      );
      logger.i('unsyncedDeleted $unsyncedDeleted');
      if (unsyncedDeleted.isNotEmpty) {
        final syncDeletedCategories = await _categoryRepo.syncDeletedCategories(
          unsyncedDeleted,
        );
        logger.i('syncDeletedCategories $syncDeletedCategories');
        final localIds = syncDeletedCategories.map((e) => e.localId).toList();
        await _categoryRepo.deleteCategoriesByLocalIds(userLocalId, localIds);
      }
      final unsynced = await _categoryRepo.getUnsyncedCategories(userLocalId);
      logger.i('unsynced $unsynced');
      if (unsynced.isNotEmpty) {
        logger.i('unsynced $unsynced');
        final syncCategories = await _categoryRepo.syncCategories(unsynced);
        await _categoryRepo.markCategoriesAsSynced(userLocalId, syncCategories);
      }
    },
  );
}
