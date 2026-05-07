import 'package:taskit/features/category/domain/entities/category_entity.dart';
import 'package:taskit/shared/data/source/local/drift/database/database.dart';

abstract class CategoryLocalSource {
  Stream<List<CategoryEntity>> watchAllCategories(int userLocalId);

  Future<int> insertCategory(CategoryEntity category);

  Future<List<CategoryEntity>> getCategories(int userLocalId);

  Future<CategoryEntity?> getCategoryByLocalId(int localId, int userLocalId);

  Future<CategoryEntity?> getCategoryByName(String name, int userLocalId);

  Future<List<CategoryEntity>> getUnsyncedCategories(int userLocalId);

  Future<List<CategoryEntity>> getUnsyncedDeletedCategories(int userLocalId);

  Future<CategoryEntity?> getCategoryByRemoteId(
    String remoteId,
    int userLocalId,
  );

  Future<void> reconcileCategories(
    int userLocalId,
    List<CategoryEntity> categories,
  );

  Future<void> updateCategoryName(String name, int localId, int userLocalId);

  Future<void> updateDeleteCategory(int localId, int userLocalId);

  Future<void> updateCategoryById(
    int localId,
    int userLocalId,
    CategoryTableCompanion companion,
  );

  Future<void> updateSyncCategories(
    List<CategoryTableCompanion> category,
    int userLocalId,
  );

  Future<void> upsertCategories(List<CategoryTableCompanion> companions);

  Future<void> markAsSynced(int userLocalId, List<int> localIds);

  Future<void> deleteCategoryByLocalId(int localId, int userLocalId);

  Future<void> deleteCategoryByRemoteId(String remoteId, int userLocalId);

  Future<void> deleteCategoriesByLocalIds(int userLocalId, List<int> localIds);

  Future<void> deleteCategoriesByRemoteIds(
    int userLocalId,
    List<String> remoteIds,
  );

  Future<void> updateCategoryByRemoteId(
    String remoteId,
    int userLocalId,
    CategoryTableCompanion companion,
  );
}
