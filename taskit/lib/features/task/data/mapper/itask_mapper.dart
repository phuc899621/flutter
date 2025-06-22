import 'package:taskit/features/task/data/dto/req/ai_category/ai_category.dart';
import 'package:taskit/features/task/domain/entities/task_entity.dart';
import 'package:taskit/shared/data/source/local/drift/database/database.dart';

import '../../domain/entities/category_entity.dart';
import '../../domain/entities/subtask_entity.dart';

abstract interface class ITaskMapper {
  //================================
  //========== TASK ==================
  //================================
  List<TaskEntity> toTaskEntityList(List<TaskTableData> data,
      List<SubtaskTableData> subtasks, List<CategoryTableData> categories);

  TaskEntity toTaskEntity(TaskTableData data, List<SubtaskTableData> subtasks,
      CategoryTableData category);

  TaskTableCompanion fromTaskEntity(TaskEntity data);

  //================================
  //========== SUBTASK ==============
  //================================
  SubtaskEntity toSubtaskEntity(SubtaskTableData data);

  List<SubtaskEntity> toSubtaskEntityList(List<SubtaskTableData> data);

  List<SubtaskTableCompanion> fromSubtaskEntityList(List<SubtaskEntity> data);

  //================================
  //========== CATEGORY ==============
  //================================
  CategoryEntity toCategoryEntity(CategoryTableData data);

  List<CategoryEntity> stringListToCategoryEntity(List<String> data);

  List<CategoryEntity> toCategoryEntityList(List<CategoryTableData> data);

  CategoryTableCompanion fromCategoryEntity(CategoryEntity data);

  AiCategoryReq toAiCategoryReq(String title, List<String> excludedCategories);

  List<String> categoryTableDataToStringList(List<CategoryTableData> data);
}
