import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/application/session_service.dart';
import '../../domain/entities/category_entity.dart';
import '../source/local/category_local_source.dart';
import '../source/remote/category_api.dart';
import 'category_repo_impl.dart';

final categoryRepoProvider = Provider((ref) {
  final localSource = ref.watch(categoryLocalSourceProvider);
  final api = ref.watch(categoryApiProvider);
  final sessionService = ref.watch(sessionServiceProvider);
  return CategoryRepoImpl(localSource, api, sessionService);
});

abstract class CategoryRepo {
  //WATCH
  Stream<List<CategoryEntity>> watchAllCategories(int userLocalId);

  Stream<List<CategoryEntity>> watchWithTaskCount(int userLocalId);

  //READ
  Future<CategoryEntity?> getCategoryByName(String name, int userLocalId);

  Future<List<CategoryEntity>> getUnsyncedCategories(int userLocalId);

  Future<List<CategoryEntity>> getUnsyncedDeletedCategories(int userLocalId);

  //INSERT
  ///insert category to local database then sync to remote server
  Future<int> insertCategory(CategoryEntity category);

  ///insert category to remote server
  Future<void> insertRemoteCategory(int categoryLocalId, int userLocalId);

  //UPDATE
  ///update category name in local database then sync to remote server
  Future<void> updateCategoryName(CategoryEntity category);

  ///update category name in remote server
  Future<void> updateRemoteCategoryName(CategoryEntity category);

  ///get categories in server and sync to local database
  Future<void> pullCategories(int userLocalId);

  ///get categories from local database and sync to server
  Future<void> pushAllUnsynced(int userLocalId);

  //DELETE
  ///update isDelete field then call delete api
  Future<void> deleteCategory(CategoryEntity category);

  ///call delete api then delete category in local database
  Future<void> deleteRemoteCategory(CategoryEntity category);

  //remote
  ///handle insert from another device
  Future<void> handleRemoteInsert(Map<String, dynamic> data, int userLocalId);

  ///handle update from another device
  Future<void> handleRemoteUpdate(Map<String, dynamic> data, int userLocalId);

  ///handle delete from another device
  Future<void> handleRemoteDelete(String? remoteId, int userLocalId);

  ///handle insert or update many categories from another device
  Future<void> handleRemoteBulkSync(Map<String, dynamic> data, int userLocalId);

  ///handle delete many categories from another device
  Future<void> handleRemoteBulkDelete(List<dynamic> data, int userLocalId);
}
