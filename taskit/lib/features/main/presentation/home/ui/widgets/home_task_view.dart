import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/task/presentation/widgets/task_item.dart';

import '../../../../../task/domain/entities/task_entity.dart';
import '../../controller/home_controller.dart';

class TaskSectionData {
  final String title;
  final List<TaskEntity> tasks;
  final Color? titleColor;

  const TaskSectionData({
    required this.title,
    required this.tasks,
    this.titleColor,
  });
}

class HomeTaskView extends ConsumerWidget {
  final List<TaskSectionData> sections;
  final Function(TaskEntity) onDelete;
  final Function(int) onEdit;

  const HomeTaskView({
    super.key,
    required this.sections,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    final controller = ref.watch(homeControllerProvider.notifier);
    final isAllEmpty = sections.every((section) => section.tasks.isEmpty);
    return CustomScrollView(
      slivers: [
        if (isAllEmpty)
          _buildEmptySection(context)
        else
          for (final section in sections) ...[
            if (section.tasks.isNotEmpty)
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 14,
                    bottom: 6,
                  ),
                  child: Text(section.title, style: text.titleMedium),
                ),
              ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: section.tasks.length,
                (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 6,
                    horizontal: 12,
                  ),
                  child: TaskItem(
                    task: section.tasks[index],
                    onDelete: onDelete,
                    onCheck: controller.onCheck,
                    onEdit: onEdit,
                    onSubtaskCheck: controller.onSubtaskCheck,
                    onSubtaskDelete: controller.onSubtaskDelete,
                  ),
                ),
              ),
            ),
          ],
        SliverToBoxAdapter(child: SizedBox(height: 100)),
      ],
    );
  }

  Widget _buildEmptySection(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.lightbulb_outline, size: 80, color: Colors.amber),
          const SizedBox(height: 20),
          Text(
            'Taskit',
            style: text.headlineMedium?.copyWith(color: Colors.amber),
          ),
          const SizedBox(height: 8),
          Text(
            'Keep adding and managing your tasks',
            style: text.bodyLarge?.copyWith(color: color.onSurfaceVariant),
          ),
        ],
      ),
    );
  }
}
