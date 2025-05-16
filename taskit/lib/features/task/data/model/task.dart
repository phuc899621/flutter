import 'dart:core';

import 'package:floor/floor.dart';
import 'package:taskit/shared/data/source/local/type_converter.dart';

import '../dto/res/task/task_data.dart';

@TypeConverters(
    [DateTimeConverter, SubtaskListConverter, TaskUserDataConverter])
@Entity(tableName: 'tasks')
class TaskModel {
  @PrimaryKey(autoGenerate: true)
  final int? localId;
  final String remoteId;
  final String title;
  final String description;
  final TaskUserData userId;
  final String category;
  final String priority;
  final String status;
  final DateTime dueDate;
  final List<SubtaskData> subtasks;

  TaskModel(this.remoteId, this.title, this.description, this.category,
      this.priority, this.status, this.dueDate, this.subtasks, this.userId,
      {this.localId});
}
