import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/task/presentation/edit_task/ui/widget/wheel_picker_item.dart';

class SingleWheelPicker extends ConsumerStatefulWidget {
  final List<String> items;
  final int initialIndex;

  final FixedExtentScrollController controller;

  const SingleWheelPicker(
      {super.key,
      required this.items,
      this.initialIndex = 0,
      required this.controller});

  @override
  ConsumerState<SingleWheelPicker> createState() => _SingleWheelPickerState();
}

class _SingleWheelPickerState extends ConsumerState<SingleWheelPicker> {
  @override
  Widget build(BuildContext context) {
    return ListWheelScrollView.useDelegate(
        scrollBehavior: MaterialScrollBehavior(),
        itemExtent: 25,
        perspective: 0.005,
        diameterRatio: 1.2,
        magnification: 1.4,
        controller: widget.controller,
        useMagnifier: true,
        physics: FixedExtentScrollPhysics(),
        childDelegate: ListWheelChildBuilderDelegate(
            childCount: widget.items.length,
            builder: (context, index) =>
                WheelPickerItem(text: widget.items[index])));
  }
}
