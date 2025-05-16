import 'dart:convert';

import 'package:floor/floor.dart';
import 'package:taskit/features/task/data/dto/res/task/task_data.dart';

class DateTimeConverter extends TypeConverter<DateTime?, int?> {
  @override
  DateTime? decode(int? databaseValue) {
    return databaseValue == null
        ? null
        : DateTime.fromMillisecondsSinceEpoch(databaseValue);
  }

  @override
  int? encode(DateTime? value) {
    return value?.millisecondsSinceEpoch;
  }
}

class SubtaskListConverter extends TypeConverter<List<SubtaskData>?, String?> {
  @override
  List<SubtaskData>? decode(String? databaseValue) {
    if (databaseValue == null) {
      return null;
    }
    if (databaseValue.isEmpty) {
      return [];
    }
    List<SubtaskData> result = json.decode(databaseValue);
    return result.cast<SubtaskData>();
  }

  @override
  String? encode(List<SubtaskData>? value) {
    return json.encode(value);
  }
}
