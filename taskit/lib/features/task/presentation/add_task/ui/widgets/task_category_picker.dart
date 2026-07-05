import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/shared/widget/custom_taskit_button.dart';

import '../../../../../../shared/log/logger_provider.dart';
import '../../../../../category/presentation/ui/widgets/add_category_bottom_sheet.dart';
import '../../controller/add_task_controller.dart';

class TaskCategoryPicker extends ConsumerStatefulWidget {
  const TaskCategoryPicker({super.key});

  @override
  ConsumerState<TaskCategoryPicker> createState() => _TaskCategoryPickerState();
}

class _TaskCategoryPickerState extends ConsumerState<TaskCategoryPicker> {
  static const maxVisibleCategories = 5;

  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final categories = ref.watch(
      addTaskControllerProvider.select((s) => s.categories),
    );
    final visibleCategories = isExpanded
        ? categories
        : categories.take(maxVisibleCategories).toList();
    logger.i('Category watch: $categories');
    final selectedCategory = ref.watch(
      addTaskControllerProvider.select((s) => s.selectedCategory),
    );
    final controller = ref.read(addTaskControllerProvider.notifier);

    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Category', style: text.titleMedium),
            TaskitButton(
              onPressed: () => _showAddCategory(context, ref),
              text: 'Add',
              backgroundColor: color.secondaryContainer,
              foregroundColor: color.onSecondaryContainer,
            ),
          ],
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: [
            ...visibleCategories.map((category) {
              final isSelected = selectedCategory?.localId == category.localId;
              return Theme(
                data: ThemeData(splashColor: color.secondaryContainer),
                child: ChoiceChip(
                  label: Text(category.name),
                  selected: isSelected,
                  onSelected: (_) => controller.setSelectedCategory(category),
                  showCheckmark: false,
                  selectedColor: color.secondaryContainer,
                  labelStyle: text.labelMedium?.copyWith(
                    color: isSelected
                        ? color.onSecondaryContainer
                        : color.onSurfaceVariant,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                  ),
                ),
              );
            }),
            if (!isExpanded && categories.length > maxVisibleCategories)
              ActionChip(
                backgroundColor: color.surfaceContainer,
                label: Text(
                  'More (+${categories.length - maxVisibleCategories})',
                  style: text.labelMedium,
                ),
                onPressed: () {
                  setState(() {
                    isExpanded = true;
                  });
                },
              ),
            if (isExpanded && categories.length > maxVisibleCategories)
              ActionChip(
                backgroundColor: color.surfaceContainer,
                label: Text('Less', style: text.labelMedium),
                onPressed: () {
                  setState(() {
                    isExpanded = false;
                  });
                },
              ),
          ],
        ),
      ],
    );
  }

  void _showAddCategory(BuildContext context, WidgetRef ref) {
    final controller = ref.read(addTaskControllerProvider.notifier);
    final color = Theme.of(context).colorScheme;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => AddCategoryBottomSheet(
        title: 'Add Category',
        validator: (val) => controller.validateCategoryInput(val ?? ''),
        onConfirm: controller.onAddCategory,
      ),
    );
  }
}
