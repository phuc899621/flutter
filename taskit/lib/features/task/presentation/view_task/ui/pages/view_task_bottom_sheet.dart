import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:taskit/shared/extension/date_time.dart';
import 'package:taskit/shared/extension/string.dart';

import '../../../../domain/entities/task_entity.dart';
import '../../controller/subtask_controller.dart';
import '../../controller/view_task_controller.dart';

class ViewTaskBottomSheet extends ConsumerStatefulWidget {
  final int localId;

  const ViewTaskBottomSheet({super.key, required this.localId});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ViewTaskBottomSheetState();
}

class _ViewTaskBottomSheetState extends ConsumerState<ViewTaskBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final _descriptionController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  bool isInit = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!isInit) {
      ref.read(viewTaskControllerProvider.notifier).fetchTask(widget.localId);
      isInit = true;
    }
    final state = ref.watch(viewTaskControllerProvider);
    final controller = ref.read(viewTaskControllerProvider.notifier);
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    final task = state.task;
    final titleController = ref.watch(titleControllerProvider);

    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 16,
          top: 16,
          right: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(10),
              splashColor: color.onSurface.withAlpha(20),
              highlightColor: color.onSurface.withAlpha(20),
              onTap: () =>
                  context.push('/edit_task_title', extra: task?.title ?? ''),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                constraints: const BoxConstraints(minHeight: 40),
                child: Text(
                  task?.title ?? '',
                  style: text.titleLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: color.onSurface,
                  ),
                ),
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(10),
              splashColor: color.onSurface.withAlpha(20),
              highlightColor: color.onSurface.withAlpha(20),
              onTap: () => context.push(
                '/edit_task_description',
                extra: task?.description ?? '',
              ),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                constraints: const BoxConstraints(minHeight: 40),
                child: Text(
                  task?.description ?? '',
                  style: text.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: color.onSurfaceVariant,
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Row(
                spacing: 10,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () => context.push(
                          '/edit_due_date',
                          extra: task?.dueDate,
                        ),
                        borderRadius: BorderRadius.circular(8),
                        splashColor: task?.dueDate == null
                            ? color.onSurface.withAlpha(20)
                            : color.primary,
                        highlightColor: task?.dueDate == null
                            ? color.onSurface.withAlpha(20)
                            : color.primary,
                        child: Container(
                          height: 36,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            border: Border.all(
                              color: task?.dueDate == null
                                  ? color.onSurfaceVariant
                                  : color.primary,
                            ),
                            //color: color.surface,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 7,
                            ),
                            child: Row(
                              spacing: 7,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.calendar_month,
                                  size: 18,
                                  color: task?.dueDate == null
                                      ? color.onSurfaceVariant
                                      : color.primary,
                                ),
                                Text(
                                  task?.dueDate?.formatToRelativeDateString() ??
                                      'No date',
                                  style: text.labelMedium,
                                ),
                                if (task?.dueDate != null)
                                  GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () => controller.updateDueDate(null),
                                    child: Center(
                                      child: Icon(
                                        Icons.close,
                                        size: 20,
                                        color: color.primary,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (task != null && task.dueDate != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () => context.push(
                            '/edit_due_time',
                            extra: task.dueDate,
                          ),
                          borderRadius: BorderRadius.circular(8),
                          splashColor: !task.hasTime
                              ? color.onSurface.withAlpha(20)
                              : color.primary,
                          highlightColor: !task.hasTime
                              ? color.onSurface.withAlpha(20)
                              : color.primary,
                          child: Container(
                            height: 36,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                color: !task.hasTime
                                    ? color.onSurfaceVariant
                                    : color.primary,
                              ),
                              //color: color.surface,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 7,
                              ),
                              child: Row(
                                spacing: 7,
                                children: [
                                  Icon(
                                    Icons.schedule_rounded,
                                    size: 18,
                                    color: !task.hasTime
                                        ? color.onSurfaceVariant
                                        : color.primary,
                                  ),
                                  Text(
                                    task.hasTime == true
                                        ? task.dueDate?.toFormatTime() ??
                                              'No time'
                                        : 'No time',
                                    style: text.labelMedium,
                                  ),
                                  if (task.hasTime)
                                    GestureDetector(
                                      behavior: HitTestBehavior.opaque,
                                      onTap: () =>
                                          controller.updateDueTime(null),
                                      child: Center(
                                        child: Icon(
                                          Icons.close,
                                          size: 20,
                                          color: color.primary,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Row(
                spacing: 10,
                children: [
                  ActionChip(
                    elevation: 5,
                    onPressed: () => context.push(
                      '/edit_task_priority',
                      extra: task?.priority,
                    ),
                    avatar: Icon(Icons.flag, color: task?.priority.color),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(
                        color: task?.priority.color ?? TaskPriority.none.color,
                      ),
                    ),
                    label: Text(
                      task?.priority.name.toUpperFirstLetter() ?? '',
                      style: text.labelMedium?.copyWith(
                        color: task?.priority.textColor,
                      ),
                    ),
                  ),
                  ActionChip(
                    elevation: 5,
                    onPressed: () => context.push(
                      '/edit_task_category',
                      extra: task?.category,
                    ),
                    avatar: Icon(
                      Icons.category_rounded,
                      color: color.secondary,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(color: color.secondary),
                    ),
                    label: Text(
                      task?.category.name ?? '',
                      style: text.labelMedium?.copyWith(color: color.secondary),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => context.push('/view_task/subtasks'),
                borderRadius: BorderRadius.circular(8),
                splashColor: (task?.subtasks.length ?? 0) == 0
                    ? color.onSurface.withAlpha(20)
                    : color.primary,
                highlightColor: (task?.subtasks.length ?? 0) == 0
                    ? color.onSurface.withAlpha(20)
                    : color.primary,
                child: Container(
                  height: 36,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(
                      color: (task?.subtasks.length ?? 0) == 0
                          ? color.onSurface
                          : color.primary,
                    ),
                    //color: color.surface,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 7,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      spacing: 7,
                      children: [
                        Icon(
                          Icons.list_alt,
                          size: 18,
                          color: (task?.subtasks.length ?? 0) == 0
                              ? color.onSurface
                              : color.primary,
                        ),
                        Text('Manage subtasks', style: text.labelMedium),
                        Spacer(),
                        Text(
                          task?.subtasks.length.toString() ?? 0.toString(),
                          style: text.labelMedium?.copyWith(
                            color: (task?.subtasks.length ?? 0) == 0
                                ? color.onSurface
                                : color.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
