import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_entity.freezed.dart';

@freezed
abstract class CategoryEntity with _$CategoryEntity {
  const CategoryEntity._();

  const factory CategoryEntity({
    required String name,
    required int localId,
    String? remoteId,
    required int userLocalId,
    required bool isDefault,
    required bool synced,
    required bool deleted,
    @Default(0) int taskCount,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _CategoryEntity;

  factory CategoryEntity.empty() => CategoryEntity(
    localId: -1,
    name: '',
    userLocalId: -1,
    remoteId: null,
    isDefault: false,
    synced: false,
    deleted: false,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );

  factory CategoryEntity.insert({
    required String name,
    required int userLocalId,
  }) {
    final now = DateTime.now();

    return CategoryEntity(
      localId: -1,
      name: name,
      userLocalId: userLocalId,
      remoteId: null,
      isDefault: false,
      synced: false,
      deleted: false,
      createdAt: now,
      updatedAt: now,
    );
  }

  factory CategoryEntity.fromRemote({required String id}) {
    final now = DateTime.now().toUtc();
    return CategoryEntity(
      localId: -1,
      name: "",
      userLocalId: -1,
      remoteId: id,
      isDefault: false,
      synced: false,
      deleted: false,
      createdAt: now,
      updatedAt: now,
    );
  }

  factory CategoryEntity.fromMap(Map<String, dynamic> data, int userLocalId) =>
      CategoryEntity(
        name: data['name'],
        localId: data['localId'] ?? -1,
        userLocalId: userLocalId,
        isDefault: data['default'],
        synced: true,
        deleted: data['deleted'],
        createdAt: data['createdAt'],
        updatedAt: data['updatedAt'],
      );
}
