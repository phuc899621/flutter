import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/task/presentation/add_task/controller/add_task_controller.dart';
import 'package:taskit/shared/extension/date_time.dart';
import 'package:taskit/shared/log/logger_provider.dart';

class TaskDueDateTimePicker extends ConsumerWidget {
  const TaskDueDateTimePicker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(addTaskControllerProvider);
    final controller = ref.read(addTaskControllerProvider.notifier);

    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return Row(
      children: [
        Expanded(
          child: _PickerBox(
            title: 'Due date',
            value:
                state.selectedDate?.formatToRelativeDateString() ?? 'Not set',
            backgroundColor: color.secondaryContainer,
            onColor: color.onSecondaryContainer,
            borderColor: color.secondary,
            onTap: () => _pickDate(context, ref),
            onClear: state.selectedDate != null
                ? controller.removeSelectedDate
                : null,
          ),
        ),
        const SizedBox(width: 12),

        Expanded(
          child: Opacity(
            opacity: state.selectedDate == null ? 0.5 : 1.0,
            child: AbsorbPointer(
              absorbing: state.selectedDate == null,
              child: _PickerBox(
                title: 'Due time',
                value: state.isTimeSelected
                    ? TimeOfDay.fromDateTime(state.selectedDate!).toTimeFormat()
                    : 'Not set',
                backgroundColor: color.tertiaryContainer,
                onColor: color.onTertiaryContainer,
                borderColor: color.tertiary,
                onTap: () => _pickTime(context, ref),
                onClear: state.isTimeSelected
                    ? controller.removeSelectedTime
                    : null,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _pickDate(BuildContext context, WidgetRef ref) async {
    final state = ref.read(addTaskControllerProvider);
    final picked = await showDatePicker(
      context: context,
      initialDate: state.selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    logger.t('date pick $picked');
    if (picked != null) {
      ref.read(addTaskControllerProvider.notifier).setSelectedDate(picked);
    }
  }

  Future<void> _pickTime(BuildContext context, WidgetRef ref) async {
    final state = ref.read(addTaskControllerProvider);
    final picked = await showTimePicker(
      context: context,
      initialTime: state.selectedDate?.toTimeOfDay() ?? TimeOfDay.now(),
    );
    if (picked != null) {
      ref.read(addTaskControllerProvider.notifier).setSelectedTime(picked);
    }
  }
}

class _PickerBox extends StatelessWidget {
  final String title;
  final String value;
  final Color backgroundColor;
  final Color onColor;
  final Color borderColor;
  final VoidCallback onTap;
  final VoidCallback? onClear;

  const _PickerBox({
    required this.title,
    required this.value,
    required this.backgroundColor,
    required this.onColor,
    required this.borderColor,
    required this.onTap,
    this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(15),
      color: backgroundColor,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: textTheme.labelSmall?.copyWith(
                        color: onColor,
                        fontSize: 10,
                      ),
                    ),
                    Text(
                      value,
                      style: textTheme.bodyMedium?.copyWith(
                        color: onColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              if (onClear != null)
                GestureDetector(
                  onTap: onClear,
                  child: Icon(Icons.clear_rounded, color: onColor, size: 18),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
