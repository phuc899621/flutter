import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/category/data/mapper/category_local_mapper.dart';
import 'package:taskit/shared/data/source/local/drift/dao/category.dart';
import 'package:taskit/shared/data/source/local/drift/database/database.dart';

import '../../../domain/entities/category_entity.dart';
import 'category_local_source.dart';

final categoryLocalSourceProvider = Provider<CategoryLocalSource>((ref) {
  final categoryDao = ref.watch(categoryDaoProvider);
  return CategoryLocalSourceImpl(categoryDao);
});

class CategoryLocalSourceImpl implements CategoryLocalSource {
  final CategoryDao _categoryDao;

  CategoryLocalSourceImpl(this._categoryDao);

  //region WATCH
  @override
  Stream<List<CategoryEntity>> watchAllCategories(int userLocalId) =>
      _categoryDao
          .watchAll(userLocalId)
          .map((data) => data.map((e) => e.toEntity()).toList());

  //endregion
  //region READ
  @override
  Future<List<CategoryEntity>> getCategories(int userLocalId) async =>
      (await _categoryDao.findAll(
        userLocalId,
      )).map((e) => e.toEntity()).toList();

  @override
  Future<CategoryEntity?> getCategoryByLocalId(
    int localId,
    int userLocalId,
  ) async => (await _categoryDao.findById(localId, userLocalId))?.toEntity();

  @override
  Future<CategoryEntity?> getCategoryByName(
    String name,
    int userLocalId,
  ) async => (await _categoryDao.findOneByName(name, userLocalId))?.toEntity();

  //remove
  @override
  Future<CategoryEntity?> getCategoryByRemoteId(
    String remoteId,
    int userLocalId,
  ) async =>
      (await _categoryDao.findByRemoteId(remoteId, userLocalId))?.toEntity();

  //remove
  @override
  Future<List<CategoryEntity>> getUnsyncedCategories(int userLocalId) async =>
      (await _categoryDao.findUnsynced(
        userLocalId,
      )).map((e) => e.toEntity()).toList();

  //remove
  @override
  Future<List<CategoryEntity>> getUnsyncedDeletedCategories(
    int userLocalId,
  ) async => (await _categoryDao.findUnsyncedDeleted(
    userLocalId,
  )).map((e) => e.toEntity()).toList();

  //endregion

  //region DELETE
  @override
  Future<void> deleteCategoryByLocalId(int localId, int userLocalId) =>
      _categoryDao.deleteById(localId, userLocalId);

  //endregion
  //region UPDATE
  @override
  Future<void> updateCategoryName(String name, int localId, int userLocalId) =>
      _categoryDao.updateById(
        localId,
        userLocalId,
        CategoryTableCompanion(
          name: Value(name),
          synced: Value(false),
          updatedAt: Value(DateTime.now()),
        ),
      );

  @override
  Future<void> updateDeleteCategory(int localId, int userLocalId) =>
      _categoryDao.updateById(
        localId,
        userLocalId,
        CategoryTableCompanion(
          deleted: Value(true),
          synced: Value(false),
          updatedAt: Value(DateTime.now()),
        ),
      );

  @override
  Future<void> updateCategoryById(
    int localId,
    int userLocalId,
    CategoryTableCompanion companion,
  ) => _categoryDao.updateById(localId, userLocalId, companion);

  @override
  Future<void> updateCategoryByRemoteId(
    String remoteId,
    int userLocalId,
    CategoryTableCompanion companion,
  ) => _categoryDao.updateByRemoteId(remoteId, userLocalId, companion);

  //endregion
  //region CREATE
  @override
  Future<int> insertCategory(CategoryEntity category) =>
      _categoryDao.insertOne(category.toInsertCompanion());

  //endregion
  //region BATCH

  @override
  Future<void> reconcileCategories(
    int userLocalId,
    List<CategoryEntity> categories,
  ) => _categoryDao.reconcile(
    userLocalId: userLocalId,
    categories: categories.map((e) => e.toReconcileCompanion(_now)).toList(),
  );

  @override
  Future<void> upsertCategories(List<CategoryTableCompanion> companions) =>
      _categoryDao.upsertAll(companions);

  @override
  Future<void> updateSyncCategories(
    List<CategoryTableCompanion> category,
    int userLocalId,
  ) {
    final categoryCompanions = category
        .map((e) => e.copyWith(synced: Value(true)))
        .toList();
    return _categoryDao.updateMultipleDifferent(
      userLocalId,
      categoryCompanions,
    );
  }

  @override
  Future<void> deleteCategoriesByLocalIds(
    int userLocalId,
    List<int> localIds,
  ) => _categoryDao.deleteMultipleByLocalIds(userLocalId, localIds);

  @override
  Future<void> deleteCategoryByRemoteId(String remoteId, int userLocalId) =>
      _categoryDao.deleteByRemoteId(remoteId, userLocalId);

  @override
  Future<void> deleteCategoriesByRemoteIds(
    int userLocalId,
    List<String> remoteIds,
  ) => _categoryDao.deleteMultipleByRemoteIds(userLocalId, remoteIds);

  @override
  Future<void> markAsSynced(int userLocalId, List<int> localIds) {
    final categoryCompanion = CategoryTableCompanion(
      synced: Value(true),
      updatedAt: Value(_now),
    );
    return _categoryDao.updateMultipleSame(
      userLocalId,
      localIds,
      categoryCompanion,
    );
  }

  DateTime get _now => DateTime.now();

  //endregion
}
