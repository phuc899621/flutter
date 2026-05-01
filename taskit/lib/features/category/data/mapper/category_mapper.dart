import 'package:drift/drift.dart';
import 'package:taskit/features/category/data/dto/req/categories_sync_req.dart';
import 'package:taskit/features/category/data/dto/res/categories_sync_data.dart';
import 'package:taskit/features/category/data/dto/res/category_data.dart';
import 'package:taskit/features/category/domain/entities/category_entity.dart';
import 'package:taskit/shared/data/source/local/drift/database/database.dart';

import '../dto/req/deleted_categories_sync_req.dart';
import '../dto/res/deleted_categories_sync_data.dart';

extension CategoryEntityMapper on CategoryEntity {
  CategoryTableCompanion toCompanion() => CategoryTableCompanion(
    localId: Value(localId),
    userLocalId: Value(userLocalId),
    name: Value(name),
  );

  CategoryTableData toData() => CategoryTableData(
    localId: localId,
    remoteId: remoteId,
    name: name,
    synced: synced,
    deleted: deleted,
    isDefault: isDefault,
    userLocalId: userLocalId,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );

  CategoriesSyncReqData toSyncReqData() =>
      CategoriesSyncReqData(id: remoteId, localId: localId, name: name);

  DeletedCategoriesSyncReqData toDeletedSyncReqData() =>
      DeletedCategoriesSyncReqData(id: remoteId, localId: localId);
}

extension CategoryTableDataMapper on CategoryTableData {
  CategoryEntity toEntity() => CategoryEntity(
    localId: localId,
    userLocalId: userLocalId,
    name: name,
    isDefault: isDefault,
    remoteId: remoteId,
    synced: synced,
    deleted: deleted,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
}

extension CategorySyncDataMapper on CategoriesSyncData {
  CategoryEntity toEntity() => CategoryEntity(
    name: name,
    localId: localId,
    remoteId: id,
    userLocalId: -1,
    isDefault: false,
    synced: true,
    deleted: false,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );
}

extension CategoryDeletedSyncDataMapper on DeletedCategoriesSyncData {
  CategoryEntity toEntity() => CategoryEntity(
    name: '',
    localId: localId,
    remoteId: id,
    userLocalId: -1,
    isDefault: false,
    synced: true,
    deleted: true,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );
}

extension CategoryDataMapper on CategoryData {
  CategoryEntity toEntity() => CategoryEntity(
    name: name,
    localId: -1,
    remoteId: id,
    userLocalId: -1,
    isDefault: isDefault,
    synced: true,
    deleted: deleted,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
}
