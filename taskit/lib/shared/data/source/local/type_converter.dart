import 'dart:convert';

import 'package:floor/floor.dart';
import 'package:taskit/features/task/data/dto/res/task/task_data.dart';

class DateTimeConverter extends TypeConverter<DateTime, int> {
  @override
  DateTime decode(int databaseValue) {
    return DateTime.fromMillisecondsSinceEpoch(databaseValue);
  }

  @override
  int encode(DateTime value) {
    return value.millisecondsSinceEpoch;
  }
}

class SubtaskListConverter extends TypeConverter<List<SubtaskData>, String> {
  @override
  List<SubtaskData> decode(String databaseValue) {
    if (databaseValue.isEmpty) {
      return [];
    }
    List<SubtaskData> result = json.decode(databaseValue);
    return result.cast<SubtaskData>();
  }

  @override
  String encode(List<SubtaskData> value) {
    return json.encode(value);
  }
}

class StringListConverter extends TypeConverter<List<String>, String> {
  @override
  List<String> decode(String databaseValue) {
    if (databaseValue.isEmpty) {
      return [];
    }
    return json.decode(databaseValue).cast<String>();
  }

  @override
  String encode(List<String> value) {
    return json.encode(value);
  }
}

class TaskUserDataConverter extends TypeConverter<TaskUserData, String> {
  @override
  TaskUserData decode(String databaseValue) {
    return json.decode(databaseValue);
  }

  @override
  String encode(TaskUserData value) {
    return json.encode(value);
  }
}
