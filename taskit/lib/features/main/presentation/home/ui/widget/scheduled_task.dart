import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:taskit/features/task/domain/entities/task_entity.dart';
import 'package:taskit/shared/utils/date_format.dart';

import '../../../../../../config/app/app_color.dart';

class ScheduledTaskItem extends ConsumerWidget {
  final TaskEntity task;

  final HIGH_PRIORITY = 'high';
  final MEDIUM_PRIORITY = 'medium';
  final LOW_PRIORITY = 'low';
  final NONE_PRIORITY = 'none';
  final VoidCallback? onDelete;
  final VoidCallback? onCheck;
  final VoidCallback? onClick;

  const ScheduledTaskItem(
      {super.key,
      required this.task,
      this.onDelete,
      this.onCheck,
      this.onClick});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Card(
        clipBehavior: Clip.hardEdge,
        color: AppColor(context).secondaryBackground,
        child: Slidable(
          endActionPane: ActionPane(
              extentRatio: 0.3,
              motion: const StretchMotion(),
              children: [
                InkWell(
                  onTap: onDelete,
                  borderRadius:
                      const BorderRadius.horizontal(right: Radius.circular(10)),
                  child: Expanded(
                    child: Container(
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color:
                            AppColor(context).errorLight.withValues(alpha: 0.4),
                        borderRadius: const BorderRadius.horizontal(
                            right: Radius.circular(10)),
                      ),
                      child: Expanded(
                          child: Icon(
                              size: 30,
                              color: AppColor(context).onError,
                              Icons.delete_outline)),
                    ),
                  ),
                )
              ]),
          child: InkWell(
            onTap: onClick,
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      spacing: 10,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          task.title,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(color: AppColor(context).primaryText),
                        ),
                        Row(
                          spacing: 10,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.horizontal(
                                    right: Radius.circular(10)),
                                color: AppColor(context)
                                    .primary
                                    .withValues(alpha: 0.2),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 8),
                                child: Row(
                                  spacing: 5,
                                  children: [
                                    const Icon(
                                      Icons.category_outlined,
                                      size: 15,
                                      color: ConstColor.primary,
                                    ),
                                    Text(
                                      task.category,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium
                                          ?.copyWith(
                                              color: AppColor(context).primary,
                                              fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Icon(
                              size: 22,
                              Icons.flag_outlined,
                              color: task.priority == HIGH_PRIORITY
                                  ? AppColor(context).high
                                  : task.priority == MEDIUM_PRIORITY
                                      ? AppColor(context).medium
                                      : task.priority == LOW_PRIORITY
                                          ? AppColor(context).low
                                          : AppColor(context).none,
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.horizontal(
                                  right: Radius.circular(10)),
                              color: AppColor(context)
                                  .secondaryText
                                  .withValues(alpha: 0.2)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 8),
                            child: Row(
                              spacing: 5,
                              children: [
                                const Icon(
                                  Icons.schedule_outlined,
                                  size: 15,
                                  color: ConstColor.secondaryText,
                                ),
                                Text(
                                  task.hasScheduledTime
                                      ? DateFormatUtils.formatTime(
                                          task.scheduledDate!)
                                      : 'Any time',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.copyWith(
                                          color:
                                              AppColor(context).secondaryText,
                                          fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Checkbox(
                      value: task.status == 'completed',
                      onChanged: (b) => onCheck,
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
