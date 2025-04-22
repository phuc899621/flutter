import 'package:multiple_result/multiple_result.dart';
import 'package:taskit/features/list/domain/model/task_model.dart';
import 'package:taskit/shared/exception/failure.dart';
abstract interface class ITaskService{
  Future<Result<List<TaskModel>,Failure>> getListTask(String token,String status,String dueDate);
}