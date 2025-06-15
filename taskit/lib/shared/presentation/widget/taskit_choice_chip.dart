import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/config/app/app_color.dart';

import '../../../config/app/text_theme.dart';

class TaskitChoiceChip extends ConsumerStatefulWidget {
  final List<String> options;
  final String? value;
  final Function(String) onChanged;
  const TaskitChoiceChip(
      {super.key, required this.options, this.value, required this.onChanged});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TaskitChoiceChip();
}

class _TaskitChoiceChip extends ConsumerState<TaskitChoiceChip> {
  late String selected;
  @override
  void initState() {
    super.initState();
    selected = widget.value ?? widget.options.first;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _onSelected(selected);
    });
  }

  void _onSelected(String option) {
    setState(() {
      selected = option;
    });
    widget.onChanged(option);
  }

  @override
  Widget build(BuildContext context) {
    final color = ref.read(colorProvider(context));
    final text = ref.read(textStyleProvider(context));
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: widget.options.map((option) {
        final isSelected = selected == option;
        return GestureDetector(
          onTap: () async {
            _onSelected(option);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 0),
            curve: Curves.easeInOut, // kiểu chuyển động
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: isSelected ? color.primary : color.secondaryContainer,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSelected ? color.primary : color.secondaryContainer,
                width: 1,
              ),
            ),
            child: Text(
              option,
              style: TextStyle(
                color: isSelected ? color.onPrimary : color.onSurfaceVariant,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
