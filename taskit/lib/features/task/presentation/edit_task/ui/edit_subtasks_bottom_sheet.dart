import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../controller/edit_task_controller.dart';
import '../controller/subtask_controller.dart';

class EditSubtasksBottomSheet extends ConsumerStatefulWidget {
  const EditSubtasksBottomSheet({super.key});

  @override
  ConsumerState<EditSubtasksBottomSheet> createState() =>
      _EditSubtasksBottomSheetState();
}

class _EditSubtasksBottomSheetState
    extends ConsumerState<EditSubtasksBottomSheet> {
  bool isInit = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final state = ref.watch(editTaskControllerProvider);
    final controller = ref.read(editTaskControllerProvider.notifier);
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    final task = state.task;
    final subtaskTextController = ref.watch(subtaskControllerProvider);

    return SizedBox(
      height: 350,
      width: double.infinity,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: context.pop,
                        icon: Icon(Icons.arrow_back_rounded)),
                    Text(
                      'Subtasks',
                      style: text.titleMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: color.onSurface,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    )
                  ]),
            ),
            if (task != null)
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  shrinkWrap: true,
                  itemCount: task.subtasks.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Material(
                        color: color.surface,
                        borderRadius: BorderRadius.circular(10),
                        elevation: 5,
                        child: Container(
                            height: 60,
                            width: double.infinity,
                            padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                            child:
                                Row(mainAxisSize: MainAxisSize.max, children: [
                              Container(
                                width: 10,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                    color: color.secondary,
                                    borderRadius: BorderRadius.horizontal(
                                        left: Radius.circular(10))),
                              ),
                              Expanded(
                                child: TextField(
                                  maxLines: 1,
                                  maxLength: 30,
                                  autofocus: true,
                                  onTapOutside: (event) {
                                    FocusScope.of(context).unfocus();
                                  },
                                  controller: subtaskTextController
                                      .getOrCreateController(
                                          task.subtasks[index].localId,
                                          task.subtasks[index].title),
                                  decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                          icon: Icon(
                                            Icons.delete_forever,
                                            size: 25,
                                            color: color.onError,
                                          ),
                                          onPressed: () {
                                            controller.deleteSubtask(
                                                task.subtasks[index].localId);
                                            subtaskTextController
                                                .removeController(task
                                                    .subtasks[index].localId);
                                          }),
                                      hint: Text(
                                        'Title',
                                        style: text.titleMedium?.copyWith(
                                            fontWeight: FontWeight.w400,
                                            color: color.onSurfaceVariant),
                                      ),
                                      counterText: '',
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      )),
                                  style: text.titleMedium?.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: color.onSurface),
                                  onChanged: (value) {
                                    if (value.isEmpty ||
                                        value.trim() !=
                                            task.subtasks[index].title.trim()) {
                                      controller.updateSubtaskTitle(
                                          task.subtasks[index].localId,
                                          value.trim());
                                    }
                                  },
                                ),
                              ),
                            ])),
                      ),
                    );
                  },
                ),
              ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 50,
              child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(color.primary),
                            shape:
                                WidgetStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                          ),
                          onPressed: () {
                            controller.insertSubtasks();
                          },
                          child: Text('Add Subtask',
                              style: TextStyle(
                                color: color.onPrimary,
                              ))),
                    ))
                  ]),
            )
          ]),
    );
  }
}
