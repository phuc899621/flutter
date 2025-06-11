import 'package:freezed_annotation/freezed_annotation.dart';

part 'subtask_entity.freezed.dart';

@freezed
sealed class SubtaskEntity with _$SubtaskEntity {
  factory SubtaskEntity(
      {required int localId,
      required String title,
      required bool isCompleted,
      required int taskLocalId}) = _SubtaskEntity;
}
