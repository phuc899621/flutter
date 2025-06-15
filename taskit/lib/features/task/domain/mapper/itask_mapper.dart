import 'package:taskit/features/task/data/dto/req/ai_category/ai_category.dart';
import 'package:taskit/features/task/domain/entities/task_entity.dart';
import 'package:taskit/shared/data/source/local/drift/database/database.dart';

import '../entities/category_entity.dart';
import '../entities/subtask_entity.dart';

abstract interface class ITaskMapper {
  /*
  * Task Mapper
  * */
  List<TaskEntity> mapToListTaskEntity(List<TaskTableData> data,
      List<SubtaskTableData> subtasks, List<CategoryTableData> categories);

  TaskEntity mapToTaskEntity(TaskTableData data,
      List<SubtaskTableData> subtasks, CategoryTableData category);

  /*
  * Subtask Mapper
  * */
  SubtaskEntity mapToSubtaskEntity(SubtaskTableData data);

  List<SubtaskEntity> mapToListSubtaskEntity(List<SubtaskTableData> data);

  /*
  * Category Mapper
  * */
  CategoryEntity mapToCategoryEntity(CategoryTableData data);

  List<CategoryEntity> mapToListCategoryEntityFromAi(List<String> data);

  List<CategoryEntity> mapToListCategoryEntity(List<CategoryTableData> data);

  Future<CategoryTableCompanion> mapToCategoryTableCompanion(
      CategoryEntity data);

  AiCategoryReq mapToAiCategoryReq(String title);
}
