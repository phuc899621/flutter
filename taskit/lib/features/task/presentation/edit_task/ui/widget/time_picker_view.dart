import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/task/presentation/edit_task/ui/widget/single_wheel_picker.dart';
import 'package:taskit/shared/log/logger_provider.dart';

class TimePickerView extends ConsumerStatefulWidget {
  final ValueChanged<TimeOfDay>? onChanged;
  final TimeOfDay initTime;

  const TimePickerView({super.key, this.onChanged, required this.initTime});

  @override
  ConsumerState<TimePickerView> createState() => _TimePickerViewState();
}

class _TimePickerViewState extends ConsumerState<TimePickerView> {
  late final FixedExtentScrollController hourController;
  late final FixedExtentScrollController minuteController;
  late final FixedExtentScrollController periodController;
  int previousHour = 0;
  int previousMinute = 0;
  int previousPeriod = 0;
  bool isInit = false;

  final period = ['AM', 'PM'];

  final hours = List.generate(12, (i) => (i + 1).toString());
  final minutes = List.generate(60, (i) => i.toString().padLeft(2, '0'));

  void _onChanged() {
    TimeOfDay timeOfDay;
    if (periodController.selectedItem == 1) {
      timeOfDay = TimeOfDay(
          hour: hourController.selectedItem + 13,
          minute: minuteController.selectedItem);
    } else {
      timeOfDay = TimeOfDay(
          hour: hourController.selectedItem + 1,
          minute: minuteController.selectedItem);
    }
    logger.i(timeOfDay.toString());
    widget.onChanged?.call(timeOfDay);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    if (!isInit) {
      int hour = widget.initTime.hour;
      int minute = widget.initTime.minute;
      int period = 0;
      hour > 12 ? {hour = hour - 13, period = 1} : hour = hour - 1;
      hourController = FixedExtentScrollController(initialItem: hour);
      minuteController = FixedExtentScrollController(initialItem: minute);
      periodController = FixedExtentScrollController(initialItem: period);
      isInit = true;
      previousHour = hour;
      hourController.addListener(() {
        if (hourController.selectedItem != previousHour) {
          _onChanged();
          previousHour = hourController.selectedItem;
        }
      });
      minuteController.addListener(() {
        if (minuteController.selectedItem != previousMinute) {
          _onChanged();
          previousMinute = minuteController.selectedItem;
        }
      });
      periodController.addListener(() {
        if (periodController.selectedItem != previousPeriod) {
          _onChanged();
          previousPeriod = periodController.selectedItem;
        }
      });
    }
    return Stack(
      alignment: Alignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 140,
                width: 60,
                color: color.surface,
                child: SingleWheelPicker(
                  items: hours,
                  controller: hourController,
                )),
            SizedBox(
              width: 10,
            ),
            Transform.scale(
              scale: 1.4,
              child: Text(
                ':',
                style: text.titleMedium?.copyWith(
                    fontWeight: FontWeight.w500, color: color.primary),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
                height: 140,
                width: 60,
                color: color.surface,
                child: SingleWheelPicker(
                  items: minutes,
                  controller: minuteController,
                )),
            SizedBox(
              width: 20,
            ),
            Container(
                height: 140,
                width: 60,
                color: color.surface,
                child: SingleWheelPicker(
                  items: period,
                  controller: periodController,
                )),
          ],
        ),
        IgnorePointer(
          child: Container(
              height: 35,
              width: 240,
              decoration: BoxDecoration(
                color: color.primary.withAlpha(30),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
              )),
        )
      ],
    );
  }
}
