import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/task/domain/entities/task_entity.dart';
import 'package:taskit/features/task/presentation/add_task/controller/add_task_controller.dart';
import 'package:taskit/features/task/presentation/add_task/ui/widgets/task_reminder_picker.dart';
import 'package:taskit/shared/log/logger_provider.dart';

class TaskReminderSection extends ConsumerWidget {
  const TaskReminderSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(addTaskControllerProvider);
    final controller = ref.read(addTaskControllerProvider.notifier);
    logger.i(
      '[TaskReminderSection] ${state.reminderOffset} ${state.reminderAt}',
    );
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    return Row(
      children: [
        Expanded(
          child: _PickerBox(
            title: 'Reminder',
            firstValue: state.reminderType.display(
              reminderOffset: state.reminderOffset,
              customDate: state.reminderAt,
            ),
            secondValue: state.repeatType.display,
            backgroundColor: color.secondaryContainer,
            onColor: color.onSecondaryContainer,
            borderColor: color.secondary,
            onTap: () => _showSetReminder(context, ref),
            onClear: null,
          ),
        ),
      ],
    );
  }

  void _showSetReminder(BuildContext context, WidgetRef ref) {
    final controller = ref.read(addTaskControllerProvider.notifier);
    final state = ref.watch(addTaskControllerProvider);
    final color = Theme.of(context).colorScheme;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: color.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      builder: (context) => TaskReminderPicker(
        title: 'Reminder',
        dueDate: state.selectedDate,
        initialReminderAt: state.reminderAt,
        initialReminderOffset: state.reminderOffset,
        initialReminderType: state.reminderType,
        initialRepeatType: state.repeatType,
        onConfirm: controller.onSetReminder,
      ),
    );
  }
}

class _PickerBox extends StatelessWidget {
  final String title;
  final String firstValue;
  final String secondValue;
  final Color backgroundColor;
  final Color onColor;
  final Color borderColor;
  final VoidCallback onTap;
  final VoidCallback? onClear;

  const _PickerBox({
    required this.title,
    required this.firstValue,
    required this.secondValue,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          firstValue,
                          style: textTheme.bodyMedium?.copyWith(
                            color: onColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          secondValue,
                          style: textTheme.bodyMedium?.copyWith(
                            color: onColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
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
