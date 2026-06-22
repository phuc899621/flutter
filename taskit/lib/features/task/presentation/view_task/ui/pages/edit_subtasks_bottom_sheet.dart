import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../controller/view_task_controller.dart';

class EditSubtasksBottomSheet extends ConsumerStatefulWidget {
  const EditSubtasksBottomSheet({super.key});

  @override
  ConsumerState<EditSubtasksBottomSheet> createState() =>
      _EditSubtasksBottomSheetState();
}

class _EditSubtasksBottomSheetState
    extends ConsumerState<EditSubtasksBottomSheet> {
  bool isInit = false;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(viewTaskControllerProvider);
    final controller = ref.read(viewTaskControllerProvider.notifier);
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    final task = state.task;

    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
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
                    'Subtasks',
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
                  onPressed: () => context.push(
                    '/view_task/subtasks/add',
                    extra: {
                      'title': 'Add subtask',
                      'validator': controller.validateSubtaskInput,
                      'onConfirm': controller.insertSubtask,
                    },
                  ),
                  child: Text('Add', style: TextStyle(color: color.onPrimary)),
                ),
              ],
            ),
            if (task != null)
              Flexible(
                fit: FlexFit.loose,
                child: ListView.separated(
                  padding: EdgeInsets.all(12),
                  shrinkWrap: true,
                  separatorBuilder: (_, _) => SizedBox(height: 8),
                  itemCount: task.subtasks.length,
                  itemBuilder: (context, index) {
                    final subtask = task.subtasks[index];
                    return Card(
                      elevation: 2,
                      child: ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.only(right: 0, left: 0),
                        title: Text(
                          subtask.title,
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        leading: Checkbox(
                          value: subtask.completed,
                          onChanged: (_) {
                            controller.updateSubtaskStatus(subtask);
                          },
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                          side: BorderSide(
                            color: color.onSurfaceVariant,
                            width: 2,
                          ),
                        ),
                        trailing: PopupMenuButton<String>(
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),
                          onSelected: (value) {
                            switch (value) {
                              case 'edit':
                                //edit
                                break;
                              case 'delete':
                                controller.deleteSubtask(subtask);
                                break;
                            }
                          },
                          itemBuilder: (context) => const [
                            PopupMenuItem(value: 'edit', child: Text('Edit')),
                            PopupMenuItem(
                              value: 'delete',
                              child: Text('Delete'),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
