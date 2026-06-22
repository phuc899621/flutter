import 'package:taskit/features/task/data/dto/subtask/request/add_subtask_req.dart';
import 'package:taskit/features/task/domain/entities/subtask_entity.dart';

import '../dto/subtask/response/subtask_res.dart';

extension SubtaskEntityRemoteMapper on SubtaskEntity {
  AddSubtaskReq toInsertRequest() =>
      AddSubtaskReq(title: title, localId: localId);
}

extension SubtaskResMapper on SubtaskRes {
  SubtaskEntity toEntity() => SubtaskEntity(
    localId: -1,
    remoteId: id,
    title: title,
    completed: completed,
    completedAt: completedAt,
    createdAt: createdAt,
    updatedAt: updatedAt,
    taskLocalId: -1,
  );
}
