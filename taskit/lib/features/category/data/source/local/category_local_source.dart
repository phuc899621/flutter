import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/category/domain/entities/category_entity.dart';

import 'category.dart';
import 'category_local_source_impl.dart';

final categoryLocalSourceProvider = Provider<CategoryLocalSource>((ref) {
  final categoryDao = ref.watch(categoryDaoProvider);
  return CategoryLocalSourceImpl(categoryDao);
});

abstract class CategoryLocalSource {
  //WATCH
  Stream<List<CategoryEntity>> watchAllCategories(int userLocalId);

  Stream<List<CategoryEntity>> watchWithTaskCount(int userLocalId);

  //INSERT
  Future<int> insertCategory(CategoryEntity category);

  //GET
  Future<List<CategoryEntity>> getCategories(int userLocalId);

  Future<CategoryEntity?> getCategoryByLocalId(int localId, int userLocalId);

  Future<CategoryEntity?> getCategoryByName(String name, int userLocalId);

  Future<List<CategoryEntity>> getUnsyncedCategories(int userLocalId);

  Future<List<CategoryEntity>> getUnsyncedDeletedCategories(int userLocalId);

  Future<CategoryEntity?> getCategoryByRemoteId(
    String remoteId,
    int userLocalId,
  );

  //UPDATE
  Future<void> reconcileCategories(
    int userLocalId,
    List<CategoryEntity> categories,
  );

  Future<void> updateCategoryName(String name, int localId, int userLocalId);

  Future<void> upsertCategory(CategoryEntity category);

  Future<void> updateCategoryDelete(int localId, int userLocalId);

  Future<void> updateSyncCategories(
    List<CategoryEntity> category,
    int userLocalId,
  );

  Future<void> upsertCategories(List<CategoryEntity> companions);

  Future<void> markUpdateSynced(
    int userLocalId,
    String remoteId,
    DateTime updatedAt,
  );

  Future<void> markInsertSynced(
    int localId,
    int userLocalId,
    String remoteId,
    DateTime updatedAt,
  );

  //DELETE
  Future<void> deleteCategoryByLocalId(int localId, int userLocalId);

  Future<void> deleteCategoryByRemoteId(String remoteId, int userLocalId);

  Future<void> deleteCategoriesByLocalIds(int userLocalId, List<int> localIds);

  Future<void> deleteCategoriesByRemoteIds(
    int userLocalId,
    List<String> remoteIds,
  );
}
