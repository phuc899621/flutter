import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:taskit/shared/extension/date_time.dart';

import '../../../../../../shared/log/logger_provider.dart';
import '../../controller/view_task_controller.dart';

class EditDueDateBottomSheet extends ConsumerStatefulWidget {
  final DateTime? dueDate;

  const EditDueDateBottomSheet({super.key, this.dueDate});

  @override
  ConsumerState<EditDueDateBottomSheet> createState() =>
      _EditDueDateBottomSheetState();
}

class _EditDueDateBottomSheetState
    extends ConsumerState<EditDueDateBottomSheet> {
  late DateTime? _selectedDate;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedDate = widget.dueDate ?? DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    final state = ref.watch(viewTaskControllerProvider);
    final controller = ref.read(viewTaskControllerProvider.notifier);

    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Column(
          spacing: 15,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: context.pop,
                  icon: Icon(Icons.arrow_back_rounded),
                ),
                Text(
                  'Select due date',
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
                        .updateDueDate(_selectedDate);
                    context.pop();
                  },
                  child: Text('Save', style: TextStyle(color: color.onPrimary)),
                ),
              ],
            ),
            CalendarDatePicker(
              initialDate: _selectedDate ?? DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(Duration(days: 365)),
              onDateChanged: (date) {
                _selectedDate = date;
                logger.i(_selectedDate?.formatToDateString);
              },
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
