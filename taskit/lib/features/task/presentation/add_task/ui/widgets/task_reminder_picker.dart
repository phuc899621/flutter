import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:taskit/features/task/domain/entities/task_entity.dart';
import 'package:taskit/features/task/presentation/add_task/controller/add_task_controller.dart';
import 'package:taskit/shared/extension/date_time.dart';
import 'package:taskit/shared/extension/string.dart';
import 'package:taskit/shared/log/logger_provider.dart';

import '../../../../../../shared/widget/custom_taskit_button.dart';

class TaskReminderPicker extends ConsumerStatefulWidget {
  final String title;
  final TaskReminderType? initialReminderType;
  final int? initialReminderOffset;
  final DateTime? initialReminderAt;
  final ReminderRepeatType? initialRepeatType;
  final DateTime? dueDate;
  final Function({
    TaskReminderType reminderType,
    int? reminderOffset,
    DateTime? reminderAt,
    ReminderRepeatType repeatType,
  })
  onConfirm;

  const TaskReminderPicker({
    super.key,
    required this.title,
    this.initialReminderOffset,
    this.initialReminderAt,
    this.initialReminderType = TaskReminderType.none,
    this.initialRepeatType = ReminderRepeatType.none,
    required this.onConfirm,
    this.dueDate,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TaskReminderPickerBottomSheetState();
}

enum ReminderBeforeDeadline {
  deadline,
  fifteenMinutes,
  thirtyMinutes,
  oneHour,
  oneDay,
  custom,
}

extension ReminderBeforeDeadlineX on ReminderBeforeDeadline {
  String get label {
    switch (this) {
      case ReminderBeforeDeadline.deadline:
        return 'At deadline';
      case ReminderBeforeDeadline.fifteenMinutes:
        return '15 minutes';
      case ReminderBeforeDeadline.thirtyMinutes:
        return '30 minutes';
      case ReminderBeforeDeadline.oneHour:
        return '1 hour';
      case ReminderBeforeDeadline.oneDay:
        return '1 day';
      case ReminderBeforeDeadline.custom:
        return name;
    }
  }
}

enum TimeUnit { minute, day, hour }

class _TaskReminderPickerBottomSheetState
    extends ConsumerState<TaskReminderPicker> {
  final _formKey = GlobalKey<FormState>();
  late TaskReminderType selectedReminderType;
  late ReminderRepeatType selectedRepeatType;
  late ReminderBeforeDeadline selectedBeforeDeadline;
  late DateTime? selectedReminderAt;
  late TimeUnit selectedTimeUnit;
  late final FocusNode _focusNode;

  late TextEditingController customBeforeDeadlineController;

  @override
  void initState() {
    super.initState();
    final initialReminderOffset = widget.initialReminderOffset;
    if (initialReminderOffset == null || initialReminderOffset < 60) {
      selectedTimeUnit = TimeUnit.minute;
      switch (initialReminderOffset) {
        case 0:
          selectedBeforeDeadline = ReminderBeforeDeadline.deadline;
          break;
        case 15:
          selectedBeforeDeadline = ReminderBeforeDeadline.fifteenMinutes;
          break;
        case 30:
          selectedBeforeDeadline = ReminderBeforeDeadline.thirtyMinutes;
          break;
        default:
          selectedBeforeDeadline = ReminderBeforeDeadline.custom;
      }
      customBeforeDeadlineController = TextEditingController(
        text: initialReminderOffset == null
            ? '0'
            : initialReminderOffset.toString(),
      );
    } else if (initialReminderOffset < 1440) {
      selectedTimeUnit = TimeUnit.hour;
      selectedBeforeDeadline = initialReminderOffset == 60
          ? ReminderBeforeDeadline.oneHour
          : ReminderBeforeDeadline.custom;
      customBeforeDeadlineController = TextEditingController(
        text: (initialReminderOffset / 60).toString(),
      );
    } else {
      selectedTimeUnit = TimeUnit.day;
      selectedBeforeDeadline = initialReminderOffset == 1440
          ? ReminderBeforeDeadline.oneDay
          : ReminderBeforeDeadline.custom;
      customBeforeDeadlineController = TextEditingController(
        text: (initialReminderOffset / 1440).toString(),
      );
    }
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        if (customBeforeDeadlineController.text == '0') {
          customBeforeDeadlineController.clear();
        }
      } else {
        if (customBeforeDeadlineController.text.trim().isEmpty) {
          customBeforeDeadlineController.text = '0';
        }
      }
    });
    selectedReminderAt = widget.initialReminderAt;
    selectedReminderType = widget.initialReminderType ?? TaskReminderType.none;
    selectedRepeatType = widget.initialRepeatType ?? ReminderRepeatType.none;
  }

  @override
  void dispose() {
    _focusNode.dispose();
    customBeforeDeadlineController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final color = Theme.of(context).colorScheme;
    final controller = ref.watch(addTaskControllerProvider.notifier);
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
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
                  Text(
                    widget.title,
                    style: text.titleMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: color.onSurface,
                    ),
                  ),
                  TaskitButton(
                    text: 'Confirm',
                    onPressed: () {
                      final reminderOffset = switch (selectedBeforeDeadline) {
                        ReminderBeforeDeadline.deadline => 0,
                        ReminderBeforeDeadline.fifteenMinutes => 15,
                        ReminderBeforeDeadline.thirtyMinutes => 30,
                        ReminderBeforeDeadline.oneHour => 60,
                        ReminderBeforeDeadline.oneDay => 1440,
                        ReminderBeforeDeadline.custom =>
                          switch (selectedTimeUnit) {
                            TimeUnit.minute => int.parse(
                              customBeforeDeadlineController.text,
                            ),
                            TimeUnit.hour =>
                              int.parse(customBeforeDeadlineController.text) *
                                  60,
                            TimeUnit.day =>
                              int.parse(customBeforeDeadlineController.text) *
                                  1440,
                          },
                      };
                      logger.i(
                        '[TaskReminderPicker] Element: $reminderOffset, $selectedReminderAt, $selectedBeforeDeadline, $selectedRepeatType $selectedTimeUnit, $selectedReminderType',
                      );
                      if (selectedReminderType == TaskReminderType.custom &&
                          selectedReminderAt == null) {
                        selectedReminderAt = DateTime.now();
                      }
                      widget.onConfirm(
                        reminderType: selectedReminderType,
                        reminderAt: selectedReminderAt,
                        reminderOffset: reminderOffset,
                        repeatType: selectedRepeatType,
                      );
                      //Save
                      context.pop();
                    },
                  ),
                ],
              ),

              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: TaskReminderType.values
                    .map(
                      (type) => ChoiceChip(
                        showCheckmark: false,
                        label: Text(type.label),
                        selected: selectedReminderType == type,
                        onSelected:
                            (widget.dueDate == null &&
                                type == TaskReminderType.beforeDeadline)
                            ? null
                            : (selected) {
                                if (selectedReminderType != type) {
                                  setState(() {
                                    selectedReminderType = type;
                                  });
                                }
                              },
                      ),
                    )
                    .toList(),
              ),

              SizedBox(height: 20),
              if (selectedReminderType == TaskReminderType.beforeDeadline)
                RadioGroup<ReminderBeforeDeadline>(
                  groupValue: selectedBeforeDeadline,
                  onChanged: (value) {
                    if (selectedBeforeDeadline != value) {
                      setState(() {
                        selectedBeforeDeadline =
                            value ?? ReminderBeforeDeadline.deadline;
                      });
                    }
                  },
                  child: Column(
                    children: ReminderBeforeDeadline.values
                        .map(
                          (value) => RadioListTile(
                            value: value,
                            title: Text(value.label, style: text.bodyMedium),
                          ),
                        )
                        .toList(),
                  ),
                ),
              SizedBox(height: 20),
              if (selectedReminderType == TaskReminderType.beforeDeadline &&
                  selectedBeforeDeadline == ReminderBeforeDeadline.custom)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    spacing: 10,
                    children: [
                      Expanded(
                        child: TextField(
                          controller: customBeforeDeadlineController,
                          focusNode: _focusNode,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(4),
                          ],
                          decoration: InputDecoration(
                            counterText: '',
                            filled: true,
                            fillColor: color.surfaceContainerHighest
                                .withOpacity(0.3),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      Wrap(
                        spacing: 8,
                        children: TimeUnit.values.map((unit) {
                          return ChoiceChip(
                            showCheckmark: false,
                            label: Text(unit.name),
                            selected: selectedTimeUnit == unit,
                            onSelected: (_) {
                              setState(() {
                                selectedTimeUnit = unit;
                              });
                            },
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              if (selectedReminderType == TaskReminderType.custom)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    children: [
                      Row(
                        spacing: 15,
                        children: [
                          Text('Remind me at:'),
                          TextButton(
                            onPressed: _selectReminderAt,
                            child: Text(
                              selectedReminderAt == null
                                  ? 'Not set'
                                  : selectedReminderAt!.toFormatDateAndTime(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        spacing: 20,
                        children: [
                          Text('Repeat'),
                          Switch(
                            value:
                                selectedRepeatType != ReminderRepeatType.none,
                            onChanged: (bool value) {
                              if (!value) {
                                setState(() {
                                  selectedRepeatType = ReminderRepeatType.none;
                                });
                              } else {
                                setState(() {
                                  selectedRepeatType = ReminderRepeatType.daily;
                                });
                              }
                            },
                          ),
                        ],
                      ),
                      if (selectedRepeatType != ReminderRepeatType.none)
                        RadioGroup<ReminderRepeatType>(
                          groupValue: selectedRepeatType,
                          onChanged: (value) {
                            if (selectedRepeatType != value) {
                              setState(() {
                                selectedRepeatType =
                                    value ?? ReminderRepeatType.daily;
                              });
                            }
                          },
                          child: Column(
                            children: ReminderRepeatType.values
                                .where((e) => e != ReminderRepeatType.none)
                                .map(
                                  (value) => RadioListTile(
                                    value: value,
                                    title: Text(
                                      value.name.toUpperFirstLetter(),
                                      style: text.bodyMedium,
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _selectReminderAt() async {
    final date = await showDatePicker(
      context: context,
      initialDate: selectedReminderAt ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (!mounted || date == null) return;

    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(selectedReminderAt ?? DateTime.now()),
    );

    if (time == null) return;

    final reminderAt = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
    setState(() {
      selectedReminderAt = reminderAt;
    });
  }
}
