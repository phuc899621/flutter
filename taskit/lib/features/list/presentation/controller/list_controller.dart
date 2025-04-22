

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/list/application/itask_service.dart';
import 'package:taskit/features/list/application/task_service.dart';

import '../../../../shared/application/token_service.dart';
import '../../domain/model/task_model.dart';
import '../state/list_state.dart';
final listControllerProvider=NotifierProvider<ListController,ListState>(ListController.new);

class ListController extends Notifier<ListState>{

  @override
  ListState build() {
    return ListState();
  }
  void setSelectedDate(DateTime selectedDate) {
    state = state.copyWith(selectedDate: selectedDate);
  }
  void setSelectedStatus(String selectedStatus) {
    print(selectedStatus+"''''''''''''''");
    switch (selectedStatus) {
      case "Pending":
        state = state.copyWith(selectedStatus: "pending");
        break;
      case "In Progress":
        state = state.copyWith(selectedStatus: "in-progress");
        break;
      case "Completed":
        state = state.copyWith(selectedStatus: "completed");
        break;
      default:
        state = state.copyWith(selectedStatus: "pending");
        break;
    }
  }
  Future<void> updateTasks() async {
    try{
      state=state.copyWith(error: null);
      final token=await ref.read(tokenServiceProvider).getToken();
      final result=await ref.read(taskServiceProvider).getListTask(token!,state.selectedStatus!, state.selectedDate!.toIso8601String());
      result.when((success){
        state=state.copyWith(tasks: success);
      },(failure){
        state=state.copyWith(error: failure.message);
      });
    }
    catch(e){
      state=state.copyWith(error: e.toString());
    }

  }
  Future<void> onFirstUpdateTasks() async{
    try{
      state=state.copyWith(error: null);
      final token=await ref.read(tokenServiceProvider).getToken();
      final result=await ref.read(taskServiceProvider).getListTask(token!,'pending',DateTime.now().toIso8601String());
      result.when((success){
        state=state.copyWith(tasks: success);
      },(failure){
        state=state.copyWith(error: failure.message);
      });
    }catch(e){
      state=state.copyWith(error: e.toString());
    }

  }
  Future<void> updateTaskStatus(String taskId,String status) async {
    try{
      state=state.copyWith(error: null);
      final token=await ref.read(tokenServiceProvider).getToken();
      final result=await ref.read(taskServiceProvider).updateTaskStatus(token!,taskId,status);
      result.when((success){
        state=state.copyWith(
            tasks: state.tasks.map((e) => e.id==taskId?e.copyWith(status: status):e).toList());
        
        },(failure){
        state=state.copyWith(error: failure.message);
      });
    }catch(e) {
      state = state.copyWith(error: e.toString());
    }
  }
}