import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:taskit/features/category/domain/entities/category_entity.dart';

import '../../controller/view_task_controller.dart';

class EditCategoryBottomSheet extends ConsumerStatefulWidget {
  final CategoryEntity categoryEntity;

  const EditCategoryBottomSheet({super.key, required this.categoryEntity});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditCategoryBottomSheetState();
}

class _EditCategoryBottomSheetState
    extends ConsumerState<EditCategoryBottomSheet> {
  late CategoryEntity selectedCategory;

  @override
  void initState() {
    super.initState();
    selectedCategory = widget.categoryEntity;
  }

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final color = Theme.of(context).colorScheme;
    final categories = ref.watch(
      viewTaskControllerProvider.select((state) => state.categories),
    );
    return SafeArea(
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
                Center(
                  child: Text(
                    'Edit Category',
                    style: text.titleMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: color.onSurface,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(color.primary),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  onPressed: () {
                    ref
                        .read(viewTaskControllerProvider.notifier)
                        .updateCategory(selectedCategory);
                    context.pop();
                  },
                  child: Text('Save', style: TextStyle(color: color.onPrimary)),
                ),
              ],
            ),
            SizedBox(height: 30),
            Wrap(
              children: categories.map((category) {
                final isSelected = selectedCategory == category;

                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: ChoiceChip(
                    label: Text(category.name),
                    selected: isSelected,
                    onSelected: (selected) {
                      if (selected) {
                        setState(() {
                          selectedCategory = category;
                        });
                      }
                    },
                    elevation: 1,
                    showCheckmark: false,
                    backgroundColor: color.surfaceContainer,
                    side: BorderSide.none,
                    selectedColor: color.secondaryContainer,
                    labelStyle: text.labelMedium?.copyWith(
                      color: isSelected
                          ? color.onSecondaryContainer
                          : color.onSurfaceVariant,
                      fontWeight: isSelected
                          ? FontWeight.w600
                          : FontWeight.w500,
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
