import 'dart:core';

import 'package:floor/floor.dart';
import 'package:taskit/features/task/data/source/local/converter/type_converter.dart';

import '../dto/res/task/task_data.dart';

@TypeConverters([DateTimeConverter, SubtaskListConverter])
@Entity(tableName: 'tasks')
class TaskModel {
  @PrimaryKey(autoGenerate: true)
  final int? localId;
  final String? remoteId;
  final String? title;
  final String? description;
  final String? category;
  final String? priority;
  final String? status;
  final DateTime? dueDate;
  final List<SubtaskData>? subtasks;

  TaskModel(this.localId, this.remoteId, this.title, this.description,
      this.category, this.priority, this.status, this.dueDate, this.subtasks);
}
