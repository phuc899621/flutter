import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../shared/extension/string.dart';
import '../../../../domain/entities/task_entity.dart';
import '../../controller/add_task_controller.dart';

class TaskPriorityPicker extends ConsumerWidget {
  const TaskPriorityPicker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPriority = ref.watch(
      addTaskControllerProvider.select((s) => s.selectedPriority),
    );
    final controller = ref.read(addTaskControllerProvider.notifier);

    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Priority', style: text.titleMedium),
        const SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: TaskPriority.values.map((priority) {
              final isSelected = selectedPriority == priority;

              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: ChoiceChip(
                  label: Text(priority.name.toUpperFirstLetter()),
                  selected: isSelected,
                  onSelected: (_) => controller.setSelectedPriority(priority),
                  elevation: 1,
                  showCheckmark: false,
                  selectedColor: priority.textColor,
                  backgroundColor: color.surfaceContainer,
                  side: BorderSide.none,
                  labelStyle: text.labelMedium?.copyWith(
                    color: isSelected ? priority.color : color.onSurfaceVariant,
                    fontWeight: isSelected
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
