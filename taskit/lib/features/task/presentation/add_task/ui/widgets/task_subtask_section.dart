import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controller/add_task_controller.dart';

class TaskSubtasksSection extends ConsumerWidget {
  final ScrollController scrollController;

  const TaskSubtasksSection({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(addTaskControllerProvider);
    final controller = ref.read(addTaskControllerProvider.notifier);
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 35,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Subtasks', style: text.titleMedium),
              FilledButton.tonalIcon(
                style: ButtonStyle(elevation: WidgetStateProperty.all(1)),
                onPressed: () {
                  controller.addSubtask();
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (scrollController.hasClients) {
                      scrollController.animateTo(
                        scrollController.position.maxScrollExtent,
                        duration: const Duration(milliseconds: 700),
                        curve: Curves.easeOut,
                      );
                    }
                  });
                },
                label: Text(
                  'Add',
                  style: text.labelMedium?.copyWith(
                    color: color.onSecondaryContainer,
                  ),
                ),
                icon: Icon(Icons.add, color: color.onSecondaryContainer),
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        ListView.builder(
          itemCount: state.subtasks.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Theme(
              data: ThemeData(splashColor: color.error),
              child: Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(10),
                color: color.surface,
                child: Container(
                  height: 55,
                  width: double.infinity,
                  padding: const EdgeInsets.only(right: 5),
                  child: Row(
                    spacing: 10,
                    children: [
                      Container(
                        width: 10,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: color.secondary,
                          borderRadius: const BorderRadius.horizontal(
                            left: Radius.circular(10),
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: state.subtasks[index],
                          autofocus: false,
                          onTapOutside: (event) {
                            FocusScope.of(context).unfocus();
                          },
                          style: text.bodyMedium?.copyWith(
                            color: color.onSurface,
                            fontWeight: FontWeight.w500,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Input subtask title',
                            hintStyle: text.bodyMedium?.copyWith(
                              fontWeight: FontWeight.normal,
                              color: color.onSurfaceVariant,
                            ),
                            counterText: '',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () => controller.onDeleteSubtask(index),
                        icon: Icon(
                          Icons.delete_forever,
                          color: color.onError,
                          size: 25,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
