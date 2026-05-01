import '../../domain/entities/category_entity.dart';

abstract class CategoryRepo {
  Stream<List<CategoryEntity>> watchAllCategories(int userLocalId);

  Future<CategoryEntity?> getCategoryByName(String name, int userLocalId);

  Future<List<CategoryEntity>> getUnsyncedCategories(int userLocalId);

  Future<List<CategoryEntity>> getUnsyncedDeletedCategories(int userLocalId);

  Future<int> insertCategory(CategoryEntity category);

  Future<void> insertRemoteCategory(int categoryLocalId, int userLocalId);

  Future<void> markCategoriesAsSynced(
    int userLocalId,
    List<CategoryEntity> categories,
  );

  Future<List<CategoryEntity>> syncCategories(List<CategoryEntity> categories);

  Future<List<CategoryEntity>> syncDeletedCategories(
    List<CategoryEntity> categories,
  );

  Future<void> deleteCategoriesByLocalIds(int userLocalId, List<int> localIds);

  Future<void> deleteCategory(int localId, int userLocalId);

  Future<void> deleteRemoteCategory(
    int localId,
    String categoryRemoteId,
    int userLocalId,
  );

  Future<void> pullCategories(int userLocalId);
}
