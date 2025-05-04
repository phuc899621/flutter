

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/config/app/app_color.dart';

class PriorityChoiceChip extends ConsumerStatefulWidget{
  final Function(String) onPrioritySelected;
  const PriorityChoiceChip({super.key,required this.onPrioritySelected});
  @override
  ConsumerState<ConsumerStatefulWidget> createState()=>_PriorityChoiceChipState();
}

class _PriorityChoiceChipState extends ConsumerState<PriorityChoiceChip>{
  final List<String> _options=['None','Low','Medium','High'];
  int _selectedIndex=0;

  Color getColor(int index){
    switch(index){
      case 0:
        return ConstColor.none;
      case 1:
        return ConstColor.low;
      case 2:
        return ConstColor.medium;
      case 3:
        return ConstColor.high;
      default:
        return ConstColor.none;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
        spacing: 8,
        runSpacing: 8,
        children: List.generate(_options.length, (index){
          final priority=_options[index];
          final isSelected=index==_selectedIndex;
          return ChoiceChip(
            label: Text(priority),
            selected: isSelected,
            labelStyle: isSelected?
            Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppColor(context).onSecondary,
              fontFamily: 'Inter',
              letterSpacing: 0.0,
            ):Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppColor(context).secondaryText,
              fontFamily: 'Inter',
              letterSpacing: 0.0,
            ),
            selectedColor: getColor(_selectedIndex),
            elevation: 5,
            backgroundColor: AppColor(context).onSurface,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(
                color: Colors.transparent,
                width: 2,
              ),
            ),
            onSelected: (isSelected){
              widget.onPrioritySelected(priority);
              setState(() {
                _selectedIndex=index;
              });
            },
            showCheckmark: false,
          );


        })
    );
  }

}