import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/data/source/local/drift/database/database.dart';
import '../../../../shared/utils/task_entity_mapper.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/entities/subtask_entity.dart';
import '../../domain/entities/task_entity.dart';
import '../dto/req/add_task/add_task.dart';
import '../dto/req/ai_category/ai_category.dart';
import '../dto/req/subtask/add_subtask.dart';
import '../dto/res/subtask/add_subtask_data.dart';
import '../dto/res/task/add_task_data.dart';
import 'itask_mapper.dart';

final taskMapperProvider = Provider<ITaskMapper>((ref) {
  return TaskMapper();
});

class TaskMapper implements ITaskMapper {
  //================================
  //========== TASK ==================
  //================================
  //region TASK
  @override
  List<TaskEntity> toTaskEntityList(
          List<TaskTableData> tasks,
          List<SubtaskTableData> subtasks,
          List<CategoryTableData> categories) =>
      tasks.map((task) {
        final joinSubtask = subtasks
            .where((subtask) => subtask.taskLocalId == task.localId)
            .toList();
        final category = categories.firstWhere(
            (category) => category.localId == task.categoryLocalId,
            orElse: () => CategoryTableData(
                localId: -1,
                remoteId: '',
                name: "Any",
                isSynced: true,
                userLocalId: task.userLocalId,
                createdAt: DateTime.now(),
                updatedAt: DateTime.now()));
        return toTaskEntity(task, joinSubtask, category);
      }).toList();

  @override
  TaskEntity toTaskEntity(TaskTableData task, List<SubtaskTableData> subtasks,
          CategoryTableData category) =>
      TaskEntity(
          completedAt: task.completedAt,
          localId: task.localId,
          title: task.title,
          description: task.description,
          category: CategoryEntity(
              name: category.name,
              localId: category.localId,
              userLocalId: category.userLocalId),
          priority: TaskPriorityUtils.toEnum(task.priority),
          userLocalId: task.userLocalId,
          status: TaskStatusUtils.toEnum(task.status),
          hasTime: task.hasTime,
          dueDate: task.dueDate,
          subtasks: subtasks.map(toSubtaskEntity).toList(),
          createdAt: task.createdAt,
          updatedAt: task.updatedAt);

  @override
  TaskTableCompanion fromTaskEntity(TaskEntity data) => TaskTableCompanion(
        title: Value(data.title),
        description: Value(data.description),
        categoryLocalId: Value(data.category.localId),
        priority: Value(data.priority.name),
        userLocalId: Value(data.userLocalId),
        status: Value(data.status.name),
        dueDate: Value(data.dueDate),
        hasTime: Value(data.hasTime),
        isSynced: Value(false),
      );

  //endregion

  //================================
  //========== SUBTASKS ==================
  //================================
  //region SUBTASKS
  @override
  List<SubtaskEntity> toSubtaskEntityList(List<SubtaskTableData> data) =>
      data.map(toSubtaskEntity).toList();

  @override
  SubtaskEntity toSubtaskEntity(SubtaskTableData data) => SubtaskEntity(
      localId: data.localId,
      title: data.title,
      isCompleted: data.isCompleted,
      taskLocalId: data.taskLocalId);

  @override
  List<SubtaskTableCompanion> fromSubtaskEntityList(List<SubtaskEntity> data) =>
      data
          .map((e) => SubtaskTableCompanion(
                title: Value(e.title),
                isCompleted: Value(e.isCompleted),
                taskLocalId: Value(e.taskLocalId),
                isSynced: Value(false),
              ))
          .toList();

  @override
  SubtaskTableCompanion fromSubtaskEntity(SubtaskEntity data) =>
      SubtaskTableCompanion(
        title: Value(data.title),
        isCompleted: Value(data.isCompleted),
        taskLocalId: Value(data.taskLocalId),
        isSynced: Value(false),
      );

  //endregion

  //================================
  //========== CATEGORY ============
  //================================
  //region CATEGORY
  @override
  List<CategoryEntity> toCategoryEntityList(List<CategoryTableData> data) =>
      data.map(toCategoryEntity).toList();

  @override
  CategoryEntity toCategoryEntity(CategoryTableData data) => CategoryEntity(
      localId: data.localId, name: data.name, userLocalId: data.userLocalId);

  @override
  List<CategoryEntity> stringListToCategoryEntity(List<String> data) => data
      .map((e) => CategoryEntity(name: e, localId: -1, userLocalId: -1))
      .toList();

  @override
  CategoryTableCompanion fromCategoryEntity(CategoryEntity data) =>
      CategoryTableCompanion(
        userLocalId: Value(data.userLocalId),
        name: Value(data.name),
        updatedAt: Value(DateTime.now()),
        isSynced: Value(false),
      );

  @override
  AiCategoryReq toAiCategoryReq(
          String title, List<String> excludedCategories) =>
      AiCategoryReq(title: title, excludedCategories: excludedCategories);

  @override
  List<String> categoryTableDataToStringList(List<CategoryTableData> data) =>
      data.map((e) => e.name).toList();

//endregion
//================================
//========== TASK REMOTE ========
//================================
  //region TaskRemote
  @override
  AddTaskReq toAddTaskReq(TaskTableData task, CategoryTableData category,
      List<SubtaskTableData> subtasks) {
    return AddTaskReq(
      title: task.title,
      description: task.description,
      categoryId: category.remoteId,
      priority: task.priority,
      dueDate: task.dueDate?.toUtc(),
      hasTime: task.hasTime,
      subtasks: subtasks
          .map((subtask) =>
              AddSubtaskReq(title: subtask.title, localId: subtask.localId))
          .toList(),
      status: task.status,
      localId: task.localId,
    );
  }

  @override
  List<SubtaskTableCompanion> toSyncListSubtaskTblCompanion(
          List<AddSubtaskData> data) =>
      data
          .map((e) => SubtaskTableCompanion(
                localId: Value(e.localId),
                remoteId: Value(e.id),
                isSynced: Value(true),
              ))
          .toList();

  @override
  TaskTableCompanion toSyncTaskTableCompanion(AddTaskData data) =>
      TaskTableCompanion(
        localId: Value(data.localId),
        remoteId: Value(data.id),
        isSynced: Value(true),
      );
//endregion
}
