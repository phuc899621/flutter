



import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../config/app/app_color.dart';

class CategoryChoiceChip extends ConsumerStatefulWidget{
  final List<String> categories;
  final List<String> AICategories;
  final Function(String) onCategorySelected;
  const CategoryChoiceChip({super.key,required this.categories,required this.AICategories,required this.onCategorySelected});
  @override
  ConsumerState<ConsumerStatefulWidget> createState()=>_CategoryChoiceChipState();

}
class _CategoryChoiceChipState extends ConsumerState<CategoryChoiceChip>{
  int _selectedIndex=-1;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: List.generate(widget.categories.length, (index){
        final category=widget.categories[index];
        final isSelected=index==_selectedIndex;
        return ChoiceChip(
          label: Text(category),
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
          selectedColor: AppColor(context).secondary,
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
            widget.onCategorySelected(category);
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