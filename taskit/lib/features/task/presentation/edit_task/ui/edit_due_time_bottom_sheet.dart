import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:taskit/features/task/presentation/edit_task/ui/widget/time_picker_view.dart';
import 'package:taskit/shared/extension/date_time.dart';

import '../controller/edit_task_controller.dart';

class EditDueTimeBottomSheet extends ConsumerStatefulWidget {
  const EditDueTimeBottomSheet({super.key});

  @override
  ConsumerState<EditDueTimeBottomSheet> createState() =>
      _EditDueTimeBottomSheetState();
}

class _EditDueTimeBottomSheetState
    extends ConsumerState<EditDueTimeBottomSheet> {
  late final TimeOfDay initTime;
  late TimeOfDay selectedTime;
  bool isInit = false;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    final controller = ref.read(editTaskControllerProvider.notifier);
    final state = ref.watch(editTaskControllerProvider);
    final task = state.task;
    return SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 15,
            children: [
              SizedBox(
                width: double.infinity,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: context.pop,
                          icon: Icon(Icons.arrow_back_rounded)),
                      Text(
                        'Select due time',
                        textAlign: TextAlign.center,
                        style: text.titleMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: color.onSurface,
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                    ]),
              ),
              if (task != null)
                TimePickerView(
                  onChanged: (time) => selectedTime = time,
                  initTime: task.hasTime
                      ? task.dueDate?.toTimeOfDay() ?? TimeOfDay.now()
                      : TimeOfDay.now(),
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
                              shape:
                                  WidgetStatePropertyAll(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                            ),
                            onPressed: () {
                              controller.updateDueTime(selectedTime);
                              context.pop();
                            },
                            child: Text('Save',
                                style: TextStyle(
                                  color: color.onPrimary,
                                ))))
                  ],
                ),
              ),
            ]));
  }
}
