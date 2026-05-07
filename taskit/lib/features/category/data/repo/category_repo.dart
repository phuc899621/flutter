import '../../domain/entities/category_entity.dart';

abstract class CategoryRepo {
  Stream<List<CategoryEntity>> watchAllCategories(int userLocalId);

  Future<CategoryEntity?> getCategoryByName(String name, int userLocalId);

  Future<List<CategoryEntity>> getUnsyncedCategories(int userLocalId);

  Future<List<CategoryEntity>> getUnsyncedDeletedCategories(int userLocalId);

  Future<int> insertCategory(CategoryEntity category);

  Future<void> insertRemoteCategory(int categoryLocalId, int userLocalId);

  Future<void> deleteCategory(int localId, int userLocalId);

  Future<void> deleteRemoteCategory(
    int localId,
    String categoryRemoteId,
    int userLocalId,
  );

  Future<void> pullCategories(int userLocalId);

  Future<void> pushAllUnsynced(int userLocalId);

  //remote
  Future<void> handleRemoteInsert(Map<String, dynamic> data, int userLocalId);

  Future<void> handleRemoteUpdate(Map<String, dynamic> data, int userLocalId);

  Future<void> handleRemoteDelete(String? remoteId, int userLocalId);

  Future<void> handleRemoteBulkSync(Map<String, dynamic> data, int userLocalId);

  Future<void> handleRemoteBulkDelete(List<dynamic> data, int userLocalId);
}
