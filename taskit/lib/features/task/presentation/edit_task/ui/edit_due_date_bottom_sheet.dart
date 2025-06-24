import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../controller/edit_task_controller.dart';

class EditDueDateBottomSheet extends ConsumerStatefulWidget {
  const EditDueDateBottomSheet({super.key});

  @override
  ConsumerState<EditDueDateBottomSheet> createState() =>
      _EditDueDateBottomSheetState();
}

class _EditDueDateBottomSheetState
    extends ConsumerState<EditDueDateBottomSheet> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    final state = ref.watch(editTaskControllerProvider);
    final controller = ref.read(editTaskControllerProvider.notifier);
    final task = state.task;

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 15,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: context.pop,
                      icon: Icon(Icons.arrow_back_rounded)),
                  Text(
                    'Select due date',
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
          task == null
              ? SizedBox(
                  width: double.infinity,
                  height: 100,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : CalendarDatePicker(
                  initialDate: task.dueDate ?? DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(Duration(days: 365)),
                  onDateChanged: (date) {
                    selectedDate = date;
                  }),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 60,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 20,
              children: [
                ElevatedButton(
                    style: ButtonStyle(
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                    ),
                    onPressed: context.pop,
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: color.onSurfaceVariant),
                    )),
                Expanded(
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(color.primary),
                          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                        ),
                        onPressed: () {
                          controller.updateDueDate(selectedDate);
                          context.pop();
                        },
                        child: Text('Save',
                            style: TextStyle(
                              color: color.onPrimary,
                            ))))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
