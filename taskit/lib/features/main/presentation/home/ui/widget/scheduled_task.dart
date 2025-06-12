import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
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
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
      child: Material(
        clipBehavior: Clip.hardEdge,
        color: AppColor(context).secondaryBackground,
        elevation: 2,
        borderRadius: BorderRadius.circular(10),
        child: ListTile(
          leading: MSHCheckbox(
            value: false,
            onChanged: (value) => debugPrint('check'),
            size: 25,
            colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
              checkedColor: AppColor(context).primary,
              uncheckedColor: AppColor(context).secondaryText,
            ),
            style: MSHCheckboxStyle.fillScaleColor,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onTap: () => debugPrint('click'),
          title:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              task.title,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: AppColor(context).primaryText),
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
                      color: ConstColor.secondaryText,
                    ),
                    Text(
                      task.hasScheduledTime
                          ? DateFormatUtils.formatTime(task.scheduledDate)
                          : 'Today, 3:20',
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: AppColor(context).secondaryText,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: task.priority == HIGH_PRIORITY
                          ? AppColor(context).high.withAlpha(10)
                          : task.priority == MEDIUM_PRIORITY
                              ? AppColor(context).medium.withAlpha(10)
                              : task.priority == LOW_PRIORITY
                                  ? AppColor(context).low.withAlpha(10)
                                  : AppColor(context).none.withAlpha(10),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(
                      task.priority,
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: task.priority == HIGH_PRIORITY
                              ? AppColor(context).high
                              : task.priority == MEDIUM_PRIORITY
                                  ? AppColor(context).medium
                                  : task.priority == LOW_PRIORITY
                                      ? AppColor(context).low
                                      : AppColor(context).none,
                          fontWeight: FontWeight.normal),
                    )),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor(context).secondaryLight.withAlpha(20),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(
                      task.category,
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: AppColor(context).secondary,
                          fontWeight: FontWeight.normal),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
