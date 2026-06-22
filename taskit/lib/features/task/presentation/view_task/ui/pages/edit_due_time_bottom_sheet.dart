import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:taskit/features/task/presentation/view_task/ui/widget/time_picker_view.dart';
import 'package:taskit/shared/extension/date_time.dart';

import '../../controller/view_task_controller.dart';

class EditDueTimeBottomSheet extends ConsumerStatefulWidget {
  final DateTime? dueDate;

  const EditDueTimeBottomSheet({super.key, this.dueDate});

  @override
  ConsumerState<EditDueTimeBottomSheet> createState() =>
      _EditDueTimeBottomSheetState();
}

class _EditDueTimeBottomSheetState
    extends ConsumerState<EditDueTimeBottomSheet> {
  late TimeOfDay selectedTime;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedTime = widget.dueDate?.toTimeOfDay() ?? TimeOfDay.now();
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    final controller = ref.read(viewTaskControllerProvider.notifier);
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
                  icon: Icon(Icons.arrow_back_rounded),
                ),
                Text(
                  'Select due time',
                  textAlign: TextAlign.center,
                  style: text.titleMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: color.onSurface,
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(color.primary),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  onPressed: () {
                    ref
                        .read(viewTaskControllerProvider.notifier)
                        .updateDueTime(selectedTime);
                    context.pop();
                  },
                  child: Text('Save', style: TextStyle(color: color.onPrimary)),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          TimePickerView(
            onChanged: (time) => setState(() => selectedTime = time),
            initTime: selectedTime,
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
