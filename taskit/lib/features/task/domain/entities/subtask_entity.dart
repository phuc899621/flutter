import 'package:freezed_annotation/freezed_annotation.dart';

part 'subtask_entity.freezed.dart';

@freezed
sealed class SubtaskEntity with _$SubtaskEntity {
  const SubtaskEntity._();

  factory SubtaskEntity({
    required int localId,
    String? remoteId,
    required String title,
    @Default(false) bool completed,
    @Default(false) bool synced,
    @Default(false) bool deleted,
    DateTime? completedAt,
    required int taskLocalId,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _SubtaskEntity;

  factory SubtaskEntity.empty() => SubtaskEntity(
    localId: -1,
    title: '',
    taskLocalId: -1,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );

  factory SubtaskEntity.insert(String title, int taskLocalId) => SubtaskEntity(
    localId: -1,
    title: title,
    taskLocalId: taskLocalId,
    createdAt: DateTime.now().toUtc(),
    updatedAt: DateTime.now().toUtc(),
  );
}

enum SubtaskUpdateField { title, completed }
