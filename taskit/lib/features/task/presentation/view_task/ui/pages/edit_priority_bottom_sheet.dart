import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:taskit/features/task/domain/entities/task_entity.dart';

import '../../../../../../shared/extension/string.dart';
import '../../controller/view_task_controller.dart';

class EditPriorityBottomSheet extends ConsumerStatefulWidget {
  final TaskPriority priority;

  const EditPriorityBottomSheet({super.key, required this.priority});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditPriorityBottomSheetState();
}

class _EditPriorityBottomSheetState
    extends ConsumerState<EditPriorityBottomSheet> {
  late TaskPriority selectedPriority;

  @override
  void initState() {
    super.initState();
    selectedPriority = widget.priority;
  }

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final color = Theme.of(context).colorScheme;
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: context.pop,
                  icon: Icon(Icons.arrow_back_rounded),
                ),
                Center(
                  child: Text(
                    'Edit Priority',
                    style: text.titleMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: color.onSurface,
                    ),
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
                        .updatePriority(selectedPriority);
                    context.pop();
                  },
                  child: Text('Save', style: TextStyle(color: color.onPrimary)),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Wrap(
              children: TaskPriority.values.map((priority) {
                final isSelected = selectedPriority == priority;

                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: ChoiceChip(
                    label: Text(priority.name.toUpperFirstLetter()),
                    selected: isSelected,
                    onSelected: (selected) {
                      if (selected) {
                        setState(() {
                          selectedPriority = priority;
                        });
                      }
                    },
                    elevation: 1,
                    showCheckmark: false,
                    selectedColor: priority.textColor,
                    backgroundColor: color.surfaceContainer,
                    side: BorderSide.none,
                    labelStyle: text.labelMedium?.copyWith(
                      color: isSelected
                          ? priority.color
                          : color.onSurfaceVariant,
                      fontWeight: isSelected
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
