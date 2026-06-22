import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../shared/log/logger_provider.dart';
import '../../../../../category/presentation/ui/widgets/add_category_bottom_sheet.dart';
import '../../controller/add_task_controller.dart';

class TaskCategoryPicker extends ConsumerWidget {
  const TaskCategoryPicker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(
      addTaskControllerProvider.select((s) => s.categories),
    );
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
            _AddCategoryButton(onPressed: () => _showAddCategory(context, ref)),
          ],
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: categories.map((category) {
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
          }).toList(),
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

class _AddCategoryButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _AddCategoryButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    return FilledButton.tonalIcon(
      onPressed: onPressed,
      style: FilledButton.styleFrom(elevation: 1),
      label: Text(
        'Add',
        style: text.labelMedium?.copyWith(color: color.onSecondaryContainer),
      ),
      icon: Icon(Icons.add, color: color.onSecondaryContainer),
    );
  }
}
