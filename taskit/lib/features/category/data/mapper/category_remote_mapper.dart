import 'package:taskit/features/category/domain/entities/category_entity.dart';

import '../dto/fetch/category_res.dart';
import '../dto/sync/delete/deleted_categories_sync_req.dart';
import '../dto/sync/delete/deleted_categories_sync_res.dart';
import '../dto/sync/insert_update/categories_sync_req.dart';
import '../dto/sync/insert_update/categories_sync_res.dart';
import '../dto/update/update_category_req.dart';

extension CategoryEntityRemoteMapper on CategoryEntity {
  CategorySyncReqEntry toSyncReqEntry() => CategorySyncReqEntry(
    id: remoteId,
    localId: localId,
    name: name,
    updatedAt: updatedAt.toUtc(),
  );

  UpdateCategoryReq toUpdateReq() => UpdateCategoryReq(name: name);

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
  CategoryEntity toEntity(int userLocalId) => CategoryEntity.insert(
    name: name,
    userLocalId: userLocalId,
  ).copyWith(remoteId: id, localId: localId);
}

extension RejectCategorySyncDataMapper on RejectCategorySyncRes {
  CategoryEntity? toEntity() {
    if (serverData == null) return null;
    return CategoryEntity(
      name: serverData!.name,
      localId: localId,
      remoteId: id,
      synced: true,
      userLocalId: -1,
      isDefault: false,
      deleted: false,
      createdAt: serverData!.updatedAt,
      updatedAt: serverData!.updatedAt,
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
