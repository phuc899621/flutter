import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:taskit/features/task/domain/entities/task_entity.dart';
import 'package:taskit/shared/extension/color.dart';
import 'package:taskit/shared/utils/date_format.dart';
import 'package:taskit/shared/utils/task_entity_mapper.dart';

import '../../../../../../config/app/app_color.dart';
import '../../../../../../config/app/text_theme.dart';
import '../../../../../task/domain/entities/task_status_enum.dart';

class TaskItem extends ConsumerWidget {
  final TaskEntity task;

  final VoidCallback? onDelete;
  final VoidCallback? onCheck;
  final void Function(int localId)? onEdit;
  final void Function(int subtaskLocalId)? onSubtaskCheck;

  const TaskItem(
      {super.key,
      required this.task,
      this.onDelete,
      this.onCheck,
      this.onSubtaskCheck,
      this.onEdit});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final text = ref.read(textStyleProvider(context));
    final color = ref.read(colorProvider(context));
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Material(
        clipBehavior: Clip.hardEdge,
        color: color.surface,
        elevation: 2,
        borderRadius: BorderRadius.circular(10),
        child: ExpansionTile(
          leading: MSHCheckbox(
            value: task.status == TaskStatus.completed,
            onChanged: (value) {
              debugPrint('check');
              onCheck?.call();
            },
            size: 25,
            colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
              checkedColor: color.primary,
              uncheckedColor: color.onSurfaceVariant,
            ),
            style: MSHCheckboxStyle.fillScaleColor,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              task.title,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: color.onSurface),
            ),
          ]),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 10,
              children: [
                Row(
                  spacing: 5,
                  children: [
                    const Icon(
                      Icons.schedule_outlined,
                      size: 16,
                      color: ConstColor.onSurfaceVariant,
                    ),
                    Text(
                      task.hasTime
                          ? DateFormatUtils.formatTime(task.dueDate)
                          : 'Today, 3:20',
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: color.onSurfaceVariant,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: task.priority.toColorContainer()),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(
                      TaskPriorityUtils.toPriority(task.priority),
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: task.priority.toColor(),
                          fontWeight: FontWeight.normal),
                    )),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: color.secondary.withAlpha(20),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(
                      task.category.name,
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: color.secondary,
                          fontWeight: FontWeight.normal),
                    )),
              ],
            ),
          ),
          children: [
            Row(children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: color.error,
                        borderRadius: BorderRadius.circular(10)),
                    child: IconButton(
                        onPressed: onDelete,
                        icon: Icon(
                          Icons.delete_outline,
                          color: color.onError,
                        )),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: color.secondaryContainer,
                        borderRadius: BorderRadius.circular(10)),
                    child: IconButton(
                        onPressed: () {
                          if (onEdit != null) onEdit!(task.localId);
                        },
                        icon: Icon(
                          Icons.edit_rounded,
                          color: color.onSecondaryContainer,
                        )),
                  ),
                ),
              ),
            ]),
            ...task.subtasks.map((e) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Container(
                    decoration: BoxDecoration(
                      color: color.surface,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Row(spacing: 20, children: [
                      MSHCheckbox(
                        value: e.isCompleted,
                        onChanged: (s) {
                          if (onSubtaskCheck != null) {
                            onSubtaskCheck!(e.localId);
                          }
                        },
                        size: 20,
                      ),
                      Text(
                        e.title,
                        style: text.titleSmall
                            ?.copyWith(color: color.onSurfaceVariant),
                      ),
                    ]),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
