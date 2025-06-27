import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:taskit/features/task/presentation/filter_task/controller/filter_controller.dart';
import 'package:taskit/shared/extension/date_time.dart';

class StartDateFilterBottomSheet extends ConsumerStatefulWidget {
  const StartDateFilterBottomSheet({super.key});

  @override
  ConsumerState<StartDateFilterBottomSheet> createState() =>
      _StartDateFilterBottomSheetState();
}

class _StartDateFilterBottomSheetState
    extends ConsumerState<StartDateFilterBottomSheet> {
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    final state = ref.watch(filterControllerProvider);
    final controller = ref.read(filterControllerProvider.notifier);
    final selectedEndDate = state.selectedEndDate;
    final selectedStartDate = state.selectedStartDate;

    final initDate = selectedEndDate != null
        ? (DateTime.now().isSameDayOrAfter(selectedEndDate)
            ? selectedEndDate.toStartOfYesterday()
            : DateTime.now())
        : (selectedStartDate ?? DateTime.now());
    final firstDate = DateTime.now().toStartOfYear();
    final lastDate = selectedEndDate == null
        ? DateTime.now().toEndOfYear()
        : selectedEndDate.toStartOfYesterday();

    _selectedDate ??= initDate;
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 15,
        children: [
          SizedBox(
            width: double.infinity,
            child: Stack(alignment: Alignment.centerLeft, children: [
              SizedBox(
                width: double.infinity,
                child: Text(
                  textAlign: TextAlign.center,
                  'Start date',
                  style: text.titleLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: color.onSurface,
                  ),
                ),
              ),
              IconButton(
                  onPressed: context.pop, icon: Icon(Icons.arrow_back_rounded)),
            ]),
          ),
          CalendarDatePicker(
            initialDate: initDate,
            firstDate: firstDate,
            lastDate: lastDate,
            onDateChanged: (DateTime value) {
              _selectedDate = value;
            },
          ),
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
                          controller.setSelectedStartDate(_selectedDate);
                          context.pop();
                        },
                        child: Text('Select',
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
