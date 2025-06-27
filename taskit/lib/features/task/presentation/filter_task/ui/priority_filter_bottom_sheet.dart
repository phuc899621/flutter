import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:taskit/features/task/domain/entities/task_priority_enum.dart';
import 'package:taskit/shared/extension/string.dart';

import '../controller/filter_controller.dart';

class PriorityFilterBottomSheet extends ConsumerStatefulWidget {
  const PriorityFilterBottomSheet({super.key});

  @override
  ConsumerState<PriorityFilterBottomSheet> createState() =>
      _PriorityFilterBottomSheetState();
}

class _PriorityFilterBottomSheetState
    extends ConsumerState<PriorityFilterBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(filterControllerProvider);
    final controller = ref.read(filterControllerProvider.notifier);
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Column(
        children: [
          //region TopBar
          //endregion
          Container(
            width: double.infinity,
            height: 50,
            color: color.surfaceContainerLow,
            padding: EdgeInsets.only(right: 5),
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    textAlign: TextAlign.center,
                    'Select priorities',
                    style: text.titleLarge?.copyWith(color: color.onSurface),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      controller.onCancelFilteringPriority();
                      context.pop();
                    },
                    icon: Icon(
                      Icons.arrow_back_rounded,
                      color: color.onSurface,
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: SizedBox(
              width: double.infinity,
              child: Wrap(
                children: [
                  ...TaskPriority.values.map((priority) => Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: FilterChip(
                          color: WidgetStatePropertyAll(
                              !state.selectedPriorities.contains(priority)
                                  ? color.surfaceContainer
                                  : color.secondaryContainer),
                          elevation: state.selectedPriorities.contains(priority)
                              ? 1
                              : 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          showCheckmark: true,
                          label: Text(priority.name.toUpperFirstLetter()),
                          onSelected: (isSelected) {
                            controller.onSelectPriority(priority, isSelected);
                          },
                          selected: state.selectedPriorities.contains(priority),
                        ),
                      ))
                ],
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          SizedBox(
            height: 60,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 20,
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                      ),
                      onPressed: () {
                        controller.onCancelFilteringPriority();
                        context.pop();
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(color: color.onSurfaceVariant),
                      )),
                  Expanded(
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(color.primary),
                            shape:
                                WidgetStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                          ),
                          onPressed: () {
                            controller.onSaveFilteringPriority();
                            context.pop();
                          },
                          child: Text('Selected',
                              style: TextStyle(
                                color: color.onPrimary,
                              ))))
                ],
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
