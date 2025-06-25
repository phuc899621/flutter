import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:taskit/shared/extension/color.dart';
import 'package:taskit/shared/extension/date_time.dart';
import 'package:taskit/shared/extension/string.dart';

import '../../../../../shared/log/logger_provider.dart';
import '../../../domain/entities/task_priority_enum.dart';
import '../controller/edit_task_controller.dart';
import '../controller/subtask_controller.dart';

class EditTaskBottomSheet extends ConsumerStatefulWidget {
  final int localId;

  const EditTaskBottomSheet({super.key, required this.localId});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditTaskBottomSheetState();
}

class _EditTaskBottomSheetState extends ConsumerState<EditTaskBottomSheet> {
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
      ref.read(editTaskControllerProvider.notifier).fetchTask(widget.localId);
    }
    final state = ref.watch(editTaskControllerProvider);
    final controller = ref.read(editTaskControllerProvider.notifier);
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    final task = state.task;
    final titleController = ref.watch(titleControllerProvider);

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 0,
          children: [
            TextFormField(
              maxLines: 1,
              maxLength: 35,
              autofocus: true,
              onTapOutside: (event) {
                FocusScope.of(context).unfocus();
              },
              controller: titleController.getOrCreateController(
                  initial: task?.title ?? ''),
              decoration: InputDecoration(
                  hint: Text(
                    'Title',
                    style: text.titleLarge?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: color.onSurfaceVariant),
                  ),
                  counterText: '',
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  )),
              style: text.titleLarge?.copyWith(
                  fontWeight: FontWeight.w500, color: color.onSurface),
              onChanged: (value) {
                logger.i('on title change: $value');
                ref
                    .read(editTaskControllerProvider.notifier)
                    .updateTitle(value);
              },
            ),
            TextFormField(
              maxLines: 2,
              maxLength: 50,
              autofocus: false,
              onTapOutside: (event) {
                FocusScope.of(context).unfocus();
              },
              controller: _descriptionController,
              decoration: InputDecoration(
                  hint: Text(
                    'Description',
                    style: text.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: color.onSurfaceVariant),
                  ),
                  counterText: '',
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  )),
              style: text.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w400, color: color.onSurface),
              onChanged: (value) {
                logger.i('on description change: $value');
                ref
                    .read(editTaskControllerProvider.notifier)
                    .updateDescription(value);
              },
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
                        onTap: () => context.push('/edit_task/due_date'),
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
                                vertical: 5, horizontal: 7),
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
                                Text(task?.dueDate?.toFormatDate() ?? 'No date',
                                    style: text.labelMedium),
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
                                  )
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
                          onTap: () => context.push('/edit_task/due_time'),
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
                                  vertical: 5, horizontal: 7),
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
                                      style: text.labelMedium),
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
                                    )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                ],
              ),
            ),
            SingleChildScrollView(
              child: Row(spacing: 10, children: [
                MenuAnchor(
                  alignmentOffset: Offset(0, -230),
                  menuChildren: [
                    ...TaskPriority.values.map((e) => MenuItemButton(
                        leadingIcon: Icon(
                          Icons.flag,
                          color: e.toColor(),
                        ),
                        onPressed: () => controller.updatePriority(e),
                        child: Text(
                          e.name.toUpperFirstLetter(),
                          style: text.labelMedium?.copyWith(
                            color: e.toColor(),
                          ),
                        )))
                  ],
                  builder: (context, controller, child) => ActionChip(
                    elevation: 5,
                    onPressed: () => controller.isOpen
                        ? controller.close()
                        : controller.open(),
                    avatar: Icon(Icons.flag, color: task?.priority.toColor()),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(
                            color: task?.priority.toColor() ??
                                TaskPriority.none.toColor())),
                    label: Text(
                      task?.priority.name.toUpperFirstLetter() ?? '',
                      style: text.labelMedium?.copyWith(
                        color: task?.priority.toColor(),
                      ),
                    ),
                  ),
                ),
                MenuAnchor(
                  alignmentOffset: Offset(0, -230),
                  menuChildren: [
                    Scrollbar(
                      controller: _scrollController,
                      thumbVisibility: true,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxHeight: 200),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ...state.categories.map((e) => MenuItemButton(
                                  onPressed: () => controller.updateCategory(e),
                                  child: Text(
                                    e.name.toUpperFirstLetter(),
                                    style: text.labelMedium?.copyWith(
                                      color: color.onSurface,
                                    ),
                                  ))),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                  builder: (context, controller, child) => ActionChip(
                    elevation: 5,
                    onPressed: () => controller.isOpen
                        ? controller.close()
                        : controller.open(),
                    avatar:
                        Icon(Icons.category_rounded, color: color.secondary),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(color: color.secondary)),
                    label: Text(
                      task?.category.name ?? '',
                      style: text.labelMedium?.copyWith(color: color.secondary),
                    ),
                  ),
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => context.push('/edit_task/subtasks'),
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
                          vertical: 5, horizontal: 7),
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
                          Text(
                            'Manage subtasks',
                            style: text.labelMedium,
                          ),
                          Spacer(),
                          Text(task?.subtasks.length.toString() ?? 0.toString(),
                              style: text.labelMedium?.copyWith(
                                color: (task?.subtasks.length ?? 0) == 0
                                    ? color.onSurface
                                    : color.primary,
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ]),
    );
  }
}
