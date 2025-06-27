import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../controller/filter_controller.dart';

class CategoryFilterBottomSheet extends ConsumerStatefulWidget {
  const CategoryFilterBottomSheet({super.key});

  @override
  ConsumerState<CategoryFilterBottomSheet> createState() =>
      _CategoryFilterBottomSheetState();
}

class _CategoryFilterBottomSheetState
    extends ConsumerState<CategoryFilterBottomSheet> {
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
                    'Select categories',
                    style: text.titleLarge?.copyWith(color: color.onSurface),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      controller.onCancelFilteringCategory();
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
                alignment: WrapAlignment.start,
                children: [
                  ...state.categories.map((category) => Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: FilterChip(
                          color: WidgetStatePropertyAll(
                              !state.selectedCategories.contains(category)
                                  ? color.surfaceContainer
                                  : color.secondaryContainer),
                          elevation: state.selectedCategories.contains(category)
                              ? 1
                              : 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          showCheckmark: true,
                          label: Text(category.name),
                          onSelected: (isSelected) {
                            controller.onSelectCategory(category, isSelected);
                          },
                          selected: state.selectedCategories.contains(category),
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
                        controller.onCancelFilteringCategory();
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
                            controller.onSaveFilteringCategory();
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
