import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/task/domain/entities/subtask_entity.dart';
import 'package:taskit/features/task/domain/entities/task_entity.dart';
import 'package:taskit/shared/extension/date_time.dart';
import 'package:taskit/shared/utils/task_entity_mapper.dart';

import '../../../../shared/config/app/theme/app_color.dart';

class TaskItem extends ConsumerWidget {
  final TaskEntity task;

  final void Function(TaskEntity)? onDelete;
  final void Function(TaskEntity)? onCheck;
  final void Function(int localId)? onEdit;
  final void Function(SubtaskEntity)? onSubtaskCheck;
  final void Function(SubtaskEntity)? onSubtaskDelete;

  const TaskItem({
    super.key,
    required this.task,
    this.onDelete,
    this.onCheck,
    this.onSubtaskCheck,
    this.onEdit,
    this.onSubtaskDelete,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final text = Theme.of(context).textTheme;
    final color = Theme.of(context).colorScheme;
    return Opacity(
      opacity: task.status == TaskStatus.completed ? 0.7 : 1,
      child: Material(
        clipBehavior: Clip.hardEdge,
        color: color.surface,
        elevation: 1,
        borderRadius: BorderRadius.circular(20),
        child: ExpansionTile(
          tilePadding: EdgeInsets.only(right: 10, left: 10),
          leading: Checkbox(
            value: task.status == TaskStatus.completed,
            onChanged: (_) {
              onCheck?.call(task);
            },
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            side: BorderSide(color: color.onSurfaceVariant, width: 2),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                task.title,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: task.status == TaskStatus.completed
                      ? color.onSurfaceVariant
                      : color.onSurface,
                  decoration: task.status == TaskStatus.completed
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ],
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Column(
              spacing: 8,
              children: [
                Row(
                  spacing: 8,
                  children: [
                    if (task.priority != TaskPriority.none)
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: task.priority.color,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 3,
                        ),
                        child: Text(
                          TaskPriorityUtils.toPriority(task.priority),
                          style: Theme.of(context).textTheme.labelMedium
                              ?.copyWith(
                                color: task.priority.textColor,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: color.secondaryContainer,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 3,
                      ),
                      child: Text(
                        task.category.name,
                        style: Theme.of(context).textTheme.labelMedium
                            ?.copyWith(
                              color: color.onSecondaryContainer,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                  ],
                ),
                if (task.dueDate != null)
                  Row(
                    spacing: 5,
                    children: [
                      const Icon(
                        Icons.schedule_outlined,
                        size: 16,
                        color: AppColor.onSurfaceVariant,
                      ),
                      Text(
                        task.hasTime
                            ? task.dueDate!.toFormatDateAndTime()
                            : task.dueDate!.formatToRelativeDateString(),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: color.onSurfaceVariant,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: color.error,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: IconButton(
                        onPressed: () => onDelete?.call(task),
                        icon: Icon(Icons.delete_outline, color: color.onError),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: color.secondaryContainer,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: IconButton(
                        onPressed: () => onEdit?.call(task.localId),
                        icon: Icon(
                          Icons.edit_rounded,
                          color: color.onSecondaryContainer,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ...task.subtasks.map(
              (e) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 5,
                  ),
                  child: Row(
                    spacing: 20,
                    children: [
                      Checkbox(
                        value: e.completed,
                        onChanged: (_) => onSubtaskCheck?.call(e),
                      ),
                      Expanded(
                        child: Text(
                          e.title,
                          style: text.titleSmall?.copyWith(
                            color: color.onSurfaceVariant,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () => onSubtaskDelete?.call(e),
                        icon: Icon(
                          Icons.delete_outline,
                          color: color.onError,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
