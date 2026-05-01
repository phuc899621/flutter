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
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _CategoryEntity;

  factory CategoryEntity.create({
    required String name,
    required int userLocalId,
  }) {
    final now = DateTime.now();

    return CategoryEntity(
      localId: -1,
      name: name,
      userLocalId: userLocalId,
      remoteId: '',
      isDefault: false,
      synced: false,
      deleted: false,
      createdAt: now,
      updatedAt: now,
    );
  }
}
