import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/task/presentation/view_task/ui/pages/add_subtask_bottom_sheet.dart';
import 'package:taskit/features/task/presentation/view_task/ui/pages/edit_subtask_title_bottom_sheet.dart';

import '../../../../../../shared/widget/custom_taskit_button.dart';
import '../../controller/add_task_controller.dart';

class TaskSubtasksSection extends ConsumerWidget {
  final ScrollController scrollController;

  const TaskSubtasksSection({super.key, required this.scrollController});

  void _showAddSubtask(BuildContext context, WidgetRef ref) {
    final controller = ref.read(addTaskControllerProvider.notifier);
    final color = Theme.of(context).colorScheme;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => AddSubtaskBottomSheet(
        title: 'Add Subtask',
        validator: (val) => controller.validateSubtaskInput(val ?? ''),
        onConfirm: controller.onAddSubtask,
      ),
    );
  }

  void _showEditSubtask(BuildContext context, WidgetRef ref, index) {
    final controller = ref.read(addTaskControllerProvider.notifier);
    final state = ref.watch(addTaskControllerProvider);
    final color = Theme.of(context).colorScheme;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => EditSubtaskTitleBottomSheet(
        entity: state.subtasks[index],
        onConfirm: (entity) {
          controller.onEditSubtask(entity, index);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(addTaskControllerProvider);
    final controller = ref.read(addTaskControllerProvider.notifier);
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtasks', style: text.titleMedium),
            TaskitButton(
              onPressed: () {
                _showAddSubtask(context, ref);
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (scrollController.hasClients) {
                    scrollController.animateTo(
                      scrollController.position.maxScrollExtent,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeOut,
                    );
                  }
                });
              },
              text: 'Add',
              backgroundColor: color.secondaryContainer,
              foregroundColor: color.onSecondaryContainer,
            ),
          ],
        ),
        const SizedBox(height: 10),
        Column(
          children: [
            ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (_, _) => SizedBox(height: 8),
              itemCount: state.subtasks.length,
              itemBuilder: (context, index) {
                final subtask = state.subtasks[index];
                return Card(
                  elevation: 2,
                  child: ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.only(right: 0, left: 12),
                    title: Text(
                      subtask.title,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    trailing: PopupMenuButton<String>(
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      onSelected: (value) {
                        switch (value) {
                          case 'edit':
                            _showEditSubtask(context, ref, index);
                            break;
                          case 'delete':
                            controller.onDeleteSubtask(index);
                            break;
                        }
                      },
                      itemBuilder: (context) => const [
                        PopupMenuItem(value: 'edit', child: Text('Edit')),
                        PopupMenuItem(value: 'delete', child: Text('Delete')),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
