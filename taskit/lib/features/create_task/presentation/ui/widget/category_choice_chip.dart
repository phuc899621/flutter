



import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/create_task/presentation/controller/create_task_controller.dart';
import 'package:taskit/shared/extension/string_hardcoded.dart';

import '../../../../../config/app/app_color.dart';

class CategoryChoiceChip extends ConsumerStatefulWidget{
  const CategoryChoiceChip({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState()=>_CategoryChoiceChipState();

}
class _CategoryChoiceChipState extends ConsumerState<CategoryChoiceChip>{
  int _selectedIndex=-1;
  String _selectedText="";

  @override
  Widget build(BuildContext context) {
    final controller=ref.read(createTaskControllerProvider.notifier);
    final state=ref.watch(createTaskControllerProvider);
    debugPrint('Categories: ${state.categories}');
    debugPrint('AICategories: ${state.AICategories}');
    final combinedCategories=state.categories+state.AICategories;

    return Stack(
        children: [
          Wrap(
      spacing: 8,
      runSpacing: 8,
      children: List.generate(combinedCategories.length, (index){
        final category=combinedCategories[index];
        final isSelected=index==_selectedIndex;
        return ChoiceChip(
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if(index>state.categories.length-1)
                Icon(
                  Icons.lightbulb,
                  color: isSelected?AppColor(context).onSecondary :AppColor(context).secondaryText,
                ),
              SizedBox(width: 3,),
              Text(
                  category,
                style: isSelected?
                Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColor(context).onSecondary,
                  fontFamily: 'Inter',
                  letterSpacing: 0.0,
                ):Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColor(context).secondaryText,
                  fontFamily: 'Inter',
                  letterSpacing: 0.0,
                ),
              ),
            ]
          ),
          selected: isSelected,
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
            controller.setSelectedCategory(category);
            setState(() {
              _selectedIndex=index;
              _selectedText=category;
            });
          },
          showCheckmark: false,
        );


      }),
          ),
          if(state.isCategoriesLoading) Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: AppColor(context).primary,
              ),
            )

    ]
    );
  }

}