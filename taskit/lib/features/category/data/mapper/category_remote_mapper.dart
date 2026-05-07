import 'package:drift/drift.dart';
import 'package:taskit/features/category/domain/entities/category_entity.dart';

import '../../../../shared/data/source/local/drift/database/database.dart';
import '../dto/fetch/category_res.dart';
import '../dto/sync/delete/deleted_categories_sync_req.dart';
import '../dto/sync/delete/deleted_categories_sync_res.dart';
import '../dto/sync/insert_update/categories_sync_req.dart';
import '../dto/sync/insert_update/categories_sync_res.dart';

extension CategoryEntityRemoteMapper on CategoryEntity {
  CategorySyncReqEntry toSyncReqEntry() => CategorySyncReqEntry(
    id: remoteId,
    localId: localId,
    name: name,
    updatedAt: updatedAt.toUtc(),
  );

  DeletedCategoriesSyncReqData toDeletedSyncReqData() =>
      DeletedCategoriesSyncReqData(id: remoteId, localId: localId);
}

extension CategoryResMapper on CategoryRes {
  CategoryEntity toEntity(int userLocalId) => CategoryEntity(
    name: name,
    localId: -1,
    remoteId: id,
    userLocalId: userLocalId,
    isDefault: isDefault,
    synced: true,
    deleted: deleted,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
}

extension AcceptCategorySyncDataMapper on AcceptCategorySyncRes {
  CategoryTableCompanion toCompanion() => CategoryTableCompanion(
    name: Value(name),
    localId: Value(localId),
    remoteId: Value(id),
  );
}

extension RejectCategorySyncDataMapper on RejectCategorySyncRes {
  CategoryTableCompanion? toCompanion() {
    if (serverData == null) {
      return null;
    }
    return CategoryTableCompanion(
      name: Value(serverData!.name),
      localId: Value(localId),
      remoteId: Value(id),
      synced: Value(true),
      deleted: Value(false),
      createdAt: Value(serverData!.updatedAt.toLocal()),
      updatedAt: Value(serverData!.updatedAt.toLocal()),
    );
  }
}

extension CategoryDeletedSyncDataMapper on DeletedCategoriesSyncRes {
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
