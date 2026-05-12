import 'package:drift/drift.dart';
import 'package:taskit/features/category/data/mapper/category_local_mapper.dart';
import 'package:taskit/features/category/data/source/local/category.dart';
import 'package:taskit/shared/data/source/local/drift/database/database.dart';

import '../../../domain/entities/category_entity.dart';
import 'category_local_source.dart';

class CategoryLocalSourceImpl implements CategoryLocalSource {
  final CategoryDao _categoryDao;

  CategoryLocalSourceImpl(this._categoryDao);

  //region WATCH
  @override
  Stream<List<CategoryEntity>> watchAllCategories(int userLocalId) =>
      _categoryDao
          .watchAll(userLocalId)
          .map((data) => data.map((e) => e.toEntity()).toList());

  @override
  Stream<List<CategoryEntity>> watchWithTaskCount(int userLocalId) =>
      _categoryDao
          .watchWithTaskCount(userLocalId)
          .map((data) => data.map((e) => e.toEntity()).toList());

  //endregion

  //region INSERT
  @override
  Future<int> insertCategory(CategoryEntity category) =>
      _categoryDao.insertOne(category.toInsertCompanion());

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

  @override
  Future<List<CategoryEntity>> getUnsyncedCategories(int userLocalId) async =>
      (await _categoryDao.findUnsynced(
        userLocalId,
      )).map((e) => e.toEntity()).toList();

  @override
  Future<List<CategoryEntity>> getUnsyncedDeletedCategories(
    int userLocalId,
  ) async => (await _categoryDao.findUnsyncedDeleted(
    userLocalId,
  )).map((e) => e.toEntity()).toList();

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
          updatedAt: Value(_utcNow),
        ),
      );

  @override
  Future<void> updateCategoryDelete(int localId, int userLocalId) =>
      _categoryDao.updateById(
        localId,
        userLocalId,
        CategoryTableCompanion(
          deleted: Value(true),
          synced: Value(false),
          updatedAt: Value(_utcNow),
        ),
      );

  @override
  Future<void> reconcileCategories(
    int userLocalId,
    List<CategoryEntity> categories,
  ) => _categoryDao.reconcile(
    userLocalId: userLocalId,
    categories: categories.map((e) => e.toReconcileCompanion(_now)).toList(),
  );

  @override
  Future<void> upsertCategories(List<CategoryEntity> categories) =>
      _categoryDao.upsertAll(
        categories
            .map(
              (e) => CategoryTableCompanion(
                remoteId: Value(e.remoteId),
                name: Value(e.name),
                synced: Value(true),
                updatedAt: Value(_utcNow),
              ),
            )
            .toList(),
      );

  @override
  Future<void> upsertCategory(CategoryEntity category) =>
      _categoryDao.upsertOne(
        CategoryTableCompanion(
          remoteId: Value(category.remoteId),
          name: Value(category.name),
          synced: Value(category.synced),
          updatedAt: Value(category.updatedAt),
        ),
      );

  @override
  Future<void> markInsertSynced(
    int localId,
    int userLocalId,
    String remoteId,
    DateTime updatedAt,
  ) => _categoryDao.updateById(
    localId,
    userLocalId,
    CategoryTableCompanion(
      remoteId: Value(remoteId),
      synced: Value(true),
      updatedAt: Value(updatedAt),
    ),
  );

  @override
  Future<void> updateSyncCategories(
    List<CategoryEntity> category,
    int userLocalId,
  ) {
    final categoryCompanions = category
        .map(
          (e) => CategoryTableCompanion(
            localId: Value(e.localId),
            remoteId: Value(e.remoteId),
            name: Value(e.name),
            synced: Value(true),
            updatedAt: Value(_utcNow),
          ),
        )
        .toList();
    return _categoryDao.updateMultipleDifferent(
      userLocalId,
      categoryCompanions,
    );
  }

  @override
  Future<void> markUpdateSynced(
    int userLocalId,
    String remoteId,
    DateTime updatedAt,
  ) {
    final categoryCompanion = CategoryTableCompanion(
      synced: Value(true),
      updatedAt: Value(updatedAt),
    );
    return _categoryDao.updateByRemoteId(
      remoteId,
      userLocalId,
      categoryCompanion,
    );
  }

  //endregion

  //region DELETE
  @override
  Future<void> deleteCategoryByLocalId(int localId, int userLocalId) =>
      _categoryDao.deleteById(localId, userLocalId);

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

  //endregion

  DateTime get _now => DateTime.now();

  DateTime get _utcNow => DateTime.now().toUtc();
}
