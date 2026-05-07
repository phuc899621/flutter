import 'package:drift/drift.dart';
import 'package:taskit/features/category/data/dto/fetch/category_res.dart';
import 'package:taskit/features/category/domain/entities/category_entity.dart';

import '../../../../shared/data/source/local/drift/database/database.dart';

extension CategoryEntityLocalMapper on CategoryEntity {
  CategoryTableCompanion toInsertCompanion() => CategoryTableCompanion(
    userLocalId: Value(userLocalId),
    name: Value(name),
    remoteId: Value(remoteId),
    synced: Value(synced),
  );

  CategoryTableCompanion toRemoteCompanion() => CategoryTableCompanion(
    remoteId: Value(remoteId),
    name: Value(name),
    synced: Value(true),
    userLocalId: Value(userLocalId),
    updatedAt: Value(DateTime.now().toUtc()),
  );

  CategoryTableCompanion toCompanion() => CategoryTableCompanion(
    localId: Value(localId),
    remoteId: Value(remoteId),
    name: Value(name),
    synced: Value(synced),
    deleted: Value(deleted),
    isDefault: Value(isDefault),
    userLocalId: Value(userLocalId),
    createdAt: Value(createdAt),
    updatedAt: Value(updatedAt),
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

  CategoryTableCompanion toReconcileCompanion(DateTime updatedAt) =>
      CategoryTableCompanion(
        remoteId: Value(remoteId),
        synced: const Value(true),
        name: Value(name),
        userLocalId: Value(userLocalId),
        deleted: Value(deleted),
        isDefault: Value(isDefault),
        updatedAt: Value(updatedAt),
      );

  CategoryTableCompanion toSyncCompanion(String remoteId, DateTime updatedAt) =>
      CategoryTableCompanion(
        synced: Value(true),
        remoteId: Value(remoteId),
        updatedAt: Value(updatedAt),
      );
}

extension CategoryResMapper on CategoryRes {
  CategoryTableCompanion toRemoteCompanion(int userLocalId) =>
      CategoryTableCompanion(
        remoteId: Value(id),
        name: Value(name),
        synced: Value(true),
        userLocalId: Value(userLocalId),
        updatedAt: Value(DateTime.now().toUtc()),
      );
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
