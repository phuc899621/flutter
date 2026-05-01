import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/shared/data/source/local/drift/dao/category.dart';
import 'package:taskit/shared/data/source/local/drift/database/database.dart';

import '../../../../../shared/log/logger_provider.dart';
import '../../../domain/entities/category_entity.dart';
import '../../mapper/category_mapper.dart';
import 'category_local_source.dart';

final categoryLocalSourceProvider = Provider<CategoryLocalSource>((ref) {
  final categoryDao = ref.watch(categoryDaoProvider);
  return CategoryLocalSourceImpl(categoryDao);
});

class CategoryLocalSourceImpl implements CategoryLocalSource {
  final CategoryDao _categoryDao;

  CategoryLocalSourceImpl(this._categoryDao);

  @override
  Stream<List<CategoryEntity>> watchAllCategories(int userLocalId) =>
      _categoryDao
          .watchAllCategories(userLocalId)
          .map((data) => data.map((e) => e.toEntity()).toList());

  @override
  Future<void> deleteCategoryByLocalId(int localId, int userLocalId) =>
      _categoryDao.deleteCategoryByLocalId(localId, userLocalId);

  @override
  Future<void> updateDeleteCategory(int localId, int userLocalId) =>
      _categoryDao.updateCategoryByLocalId(
        localId,
        userLocalId,
        CategoryTableCompanion(deleted: Value(true)),
      );

  @override
  Future<List<CategoryEntity>> getCategories(int userLocalId) async =>
      (await _categoryDao.getCategories(
        userLocalId,
      )).map((e) => e.toEntity()).toList();

  @override
  Future<CategoryEntity?> getCategoryByLocalId(
    int localId,
    int userLocalId,
  ) async => (await _categoryDao.getCategoryByLocalId(
    localId,
    userLocalId,
  ))?.toEntity();

  @override
  Future<CategoryEntity?> getCategoryByName(
    String name,
    int userLocalId,
  ) async =>
      (await _categoryDao.getCategoryByName(name, userLocalId))?.toEntity();

  @override
  Future<CategoryEntity?> getCategoryByRemoteId(
    String remoteId,
    int userLocalId,
  ) async => (await _categoryDao.getCategoryByRemoteId(
    remoteId,
    userLocalId,
  ))?.toEntity();

  @override
  Future<List<CategoryEntity>> getUnsyncedCategories(int userLocalId) async =>
      (await _categoryDao.getUnsyncedCategories(
        userLocalId,
      )).map((e) => e.toEntity()).toList();

  @override
  Future<List<CategoryEntity>> getUnsyncedDeletedCategories(
    int userLocalId,
  ) async => (await _categoryDao.getUnsyncedDeletedCategories(
    userLocalId,
  )).map((e) => e.toEntity()).toList();

  @override
  Future<int> insertCategory(CategoryEntity category) async {
    try {
      final categoryWithSameName = await _categoryDao.getCategoryByName(
        category.name,
        category.userLocalId,
      );
      if (categoryWithSameName != null) {
        throw Exception('Category with same name already exists');
      }

      return _categoryDao.insertCategory(category.toCompanion());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateCategoryName(String name, int localId, int userLocalId) =>
      _categoryDao.updateCategoryByLocalId(
        localId,
        userLocalId,
        CategoryTableCompanion(
          name: Value(name),
          synced: Value(false),
          updatedAt: Value(DateTime.now()),
        ),
      );

  @override
  Future<void> updateSyncCreateCategory(
    int localId,
    String remoteId,
    int userLocalId,
  ) {
    try {
      logger.i('updateSyncCategory $localId');
      return _categoryDao.updateCategoryByLocalId(
        localId,
        userLocalId,
        CategoryTableCompanion(
          synced: Value(true),
          remoteId: Value(remoteId),
          updatedAt: Value(DateTime.now()),
        ),
      );
    } catch (e) {
      logger.e('Sync task error: $e');
      return Future.value();
    }
  }

  @override
  Future<void> reconcileCategories(
    int userLocalId,
    List<CategoryEntity> categories,
  ) => _categoryDao.reconcileCategories(
    userLocalId: userLocalId,
    categories: categories
        .map(
          (e) => CategoryTableCompanion(
            remoteId: Value(e.remoteId),
            synced: Value(true),
            name: Value(e.name),
            userLocalId: Value(userLocalId),
            deleted: Value(e.deleted),
            isDefault: Value(e.isDefault),
            updatedAt: Value(DateTime.now()),
          ),
        )
        .toList(),
  );

  @override
  Future<void> markCategoriesAsSynced(int userLocalId, List<int> localIds) {
    final categoryCompanion = CategoryTableCompanion(
      synced: Value(true),
      updatedAt: Value(DateTime.now()),
    );
    return _categoryDao.updateCategories(
      localIds,
      categoryCompanion,
      userLocalId,
    );
  }

  @override
  Future<void> deleteCategoriesByLocalIds(
    int userLocalId,
    List<int> localIds,
  ) => _categoryDao.deleteCategoriesByLocalIds(userLocalId, localIds);
}
