// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:multiple_result/src/result.dart';
// import 'package:taskit/features/task/domain/entites/category.dart';
// import 'package:taskit/features/task/domain/entites/task_model.dart';
// import 'package:taskit/features/task/domain/mapper/itask_mapper.dart';
// import 'package:taskit/shared/exception/failure.dart';
//
// import '../../../shared/data/dto/response/base_response.dart';
// import '../data/dto/req/create_task/create_task.dart';
// import '../data/dto/req/suggest_category/suggest_category.dart';
// import '../data/dto/res/category/category_data.dart';
// import '../data/dto/res/task/task_data.dart';
// import '../data/repo/itask_repo.dart';
// import '../data/repo/task_repo.dart';
// import 'itask_service.dart';
//
// final taskServiceProvider = Provider<ITaskService>((ref) {
//   return TaskService(ref.read(taskRepoProvider));
// });
//
// class TaskService implements ITaskMapper, ITaskService {
//   final ITaskRepo _iTaskRepository;
//   TaskService(this._iTaskRepository);
//   @override
//   List<TaskModel> mapToTaskModel(BaseResponse<TaskDataLst> response) {
//     final result = TaskModelLst(
//         tasks: response.data.tasks
//             .map((e) => TaskModel(
//                   title: e.title,
//                   id: e.id,
//                   description: e.description,
//                   category: e.category,
//                   priority: e.priority,
//                   userId: e.userId,
//                   status: e.status,
//                   dueDate: e.dueDate,
//                   subtasks: e.subtasks,
//                   createdAt: e.createdAt,
//                   updatedAt: e.updatedAt,
//                 ))
//             .toList());
//     return result.tasks;
//   }
//
//   @override
//   Future<Result<List<TaskModel>, Failure>> getListTask(
//       String token, String status, String dueDate) async {
//     try {
//       final response =
//           await _iTaskRepository.getListTask(token, status, dueDate);
//       final model = mapToTaskModel(response);
//       return Success(model);
//     } on Failure catch (e) {
//       return Error(e);
//     } catch (e, s) {
//       if (e is Exception) {
//         return Error(Failure(
//           message: e.toString(),
//           exception: e,
//           stackTrace: s,
//         ));
//       } else {
//         return Error(Failure(
//           message: e.toString(),
//           exception: Exception("Unknown error at get list of task"),
//           stackTrace: s,
//         ));
//       }
//     }
//   }
//
//   @override
//   Future<Result<void, Failure>> updateTaskStatus(
//       String token, String taskId, String status) async {
//     try {
//       await _iTaskRepository.updateTaskStatus(token, taskId, status);
//       return const Success(null);
//     } on Failure catch (e) {
//       return Error(e);
//     } catch (e, s) {
//       if (e is Exception) {
//         return Error(Failure(
//           message: e.toString(),
//           exception: e,
//           stackTrace: s,
//         ));
//       } else {
//         return Error(Failure(
//           message: e.toString(),
//           exception: Exception("Unknown error at update task status"),
//           stackTrace: s,
//         ));
//       }
//     }
//   }
//
//   @override
//   Future<Result<void, Failure>> createTask(
//       String token, CreateTaskReq createTaskReq) async {
//     try {
//       await _iTaskRepository.createTask(token, createTaskReq);
//       return const Success(null);
//     } on Failure catch (e) {
//       return Error(e);
//     } catch (e, s) {
//       if (e is Exception) {
//         return Error(Failure(
//           message: e.toString(),
//           exception: e,
//           stackTrace: s,
//         ));
//       } else {
//         return Error(Failure(
//           message: e.toString(),
//           exception: Exception("Unknown error at create task"),
//           stackTrace: s,
//         ));
//       }
//     }
//   }
//
//   @override
//   CategoryModel mapToCategoryModel(BaseResponse<CategoryData> response) {
//     return CategoryModel(categories: response.data.categories);
//   }
//
//   @override
//   Future<Result<CategoryModel, Failure>> suggestCategory(
//       String token, SuggestCategoryReq suggestCategoryReq) async {
//     try {
//       final response =
//           await _iTaskRepository.suggestCategory(token, suggestCategoryReq);
//       final model = mapToCategoryModel(response);
//       return Success(model);
//     } on Failure catch (e) {
//       return Error(e);
//     } catch (e, s) {
//       if (e is Exception) {
//         return Error(Failure(
//           message: e.toString(),
//           exception: e,
//           stackTrace: s,
//         ));
//       } else {
//         return Error(Failure(
//           message: e.toString(),
//           exception: Exception("Unknown error at suggest category"),
//           stackTrace: s,
//         ));
//       }
//     }
//   }
// }
