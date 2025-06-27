import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:taskit/features/main/presentation/list/controller/list_controller.dart';
import 'package:taskit/features/task/presentation/filter_task/controller/filter_controller.dart';
import 'package:taskit/shared/extension/date_time.dart';
import 'package:taskit/shared/extension/enum.dart';

import '../../../domain/entities/filter_date_option_enum.dart';

class FilterBottomSheet extends ConsumerStatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FilterBottomSheetState();
}

class _FilterBottomSheetState extends ConsumerState<FilterBottomSheet> {
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final listState = ref.read(listControllerProvider);
      final filterState = ref.read(filterControllerProvider);
      final filterController = ref.read(filterControllerProvider.notifier);
      filterController.setFilteringCategories(listState.filteringCategories);
      filterController.setFilteringPriorities(listState.filteringPriorities);
      filterController.setFilteringDateOption(listState.filteringDateOption);
      filterController.setFilteringStartDate(listState.filteringStartDate);
      filterController.setFilteringEndDate(listState.filteringEndDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(filterControllerProvider);
    final controller = ref.read(filterControllerProvider.notifier);
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    final filteringStartDate = state.filteringStartDate;
    final filteringEndDate = state.filteringEndDate;
    _startDateController.text =
        filteringStartDate == null ? '' : filteringStartDate.toFormatDate();
    _endDateController.text =
        filteringEndDate == null ? '' : filteringEndDate.toFormatDate();
    return SingleChildScrollView(
      child: Column(
        children: [
          //region TopBar
          //endregion
          Container(
            width: double.infinity,
            color: color.surfaceContainerLow,
            padding: EdgeInsets.only(right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: context.pop,
                    icon: Icon(
                      Icons.arrow_drop_down_sharp,
                      color: color.onSurface,
                    )),
                Text(
                  'Filter',
                  style: text.titleLarge?.copyWith(color: color.onSurface),
                ),
                TextButton(
                    onPressed: controller.onResetAll, child: Text('Reset'))
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          //region Category
          //endregion
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Category',
                  style: text.titleMedium?.copyWith(
                      color: color.onSurface, fontWeight: FontWeight.w600),
                ),
                TextButton(
                    onPressed: () {
                      controller
                          .setSelectedCategories(state.filteringCategories);
                      context.push('/filter/category');
                    },
                    style: ButtonStyle(
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ))),
                    child: Row(
                      spacing: 5,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'View all',
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          size: 20,
                        )
                      ],
                    ))
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Wrap(
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.start,
                children: [
                  ...state.filteringCategories.map((category) => Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: ChoiceChip(
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          showCheckmark: true,
                          checkmarkColor: color.onSecondaryContainer,
                          label: Text(
                            category.name,
                          ),
                          selected: true,
                          onSelected: (bool value) {},
                        ),
                      ))
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          //region Priority
          //endregion
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Priority',
                  style: text.titleMedium?.copyWith(
                      color: color.onSurface, fontWeight: FontWeight.w600),
                ),
                TextButton(
                    style: ButtonStyle(
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ))),
                    onPressed: () {
                      controller
                          .setSelectedPriorities(state.filteringPriorities);
                      context.push('/filter/priority');
                    },
                    child: Row(
                      spacing: 5,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'View all',
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          size: 20,
                        )
                      ],
                    ))
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Wrap(
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.start,
                children: [
                  ...state.filteringPriorities.map((category) => Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: ChoiceChip(
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          showCheckmark: true,
                          checkmarkColor: color.onSecondaryContainer,
                          label: Text(
                            category.name,
                          ),
                          selected: true,
                          onSelected: (bool value) {},
                        ),
                      ))
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          //region Selected Date range
          //endregion
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Date range',
                  style: text.titleMedium?.copyWith(
                      color: color.onSurface, fontWeight: FontWeight.w600),
                ),
                TextButton(
                    style: ButtonStyle(
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ))),
                    onPressed: () {
                      controller
                          .setSelectedDateOption(state.filteringDateOption);
                      controller.setSelectedStartDate(filteringStartDate);
                      controller.setSelectedEndDate(filteringEndDate);
                      context.push('/filter/date');
                    },
                    child: Row(
                      spacing: 5,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          state.filteringDateOption.optionString,
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          size: 20,
                        )
                      ],
                    ))
              ],
            ),
          ),
          if (state.filteringDateOption == FilterDateOption.custom)
            Container(
              width: double.infinity,
              height: 80,
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                spacing: 10,
                children: [
                  Expanded(
                    child: Material(
                        elevation: filteringStartDate == null ? 1 : 2,
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            width: double.infinity,
                            height: 60,
                            decoration: BoxDecoration(
                              color: filteringStartDate == null
                                  ? color.surfaceContainer
                                  : color.secondaryContainer,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                                spacing: 10,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    filteringStartDate != null
                                        ? Icons.calendar_month_rounded
                                        : Icons.calendar_month_outlined,
                                    color: filteringStartDate != null
                                        ? color.onSecondaryContainer
                                        : color.onSurfaceVariant,
                                  ),
                                  Expanded(
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            filteringStartDate != null
                                                ? 'Start date'
                                                : 'No start date',
                                            style: filteringStartDate != null
                                                ? text.bodySmall?.copyWith(
                                                    color:
                                                        color.onSurfaceVariant,
                                                    fontWeight: FontWeight.w500)
                                                : text.titleSmall?.copyWith(
                                                    color:
                                                        color.onSurfaceVariant),
                                          ),
                                          if (filteringStartDate != null)
                                            Expanded(
                                                child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                filteringStartDate
                                                    .toFormatDate(),
                                                style: text.titleSmall
                                                    ?.copyWith(
                                                        color: color.onSurface),
                                              ),
                                            ))
                                        ]),
                                  ),
                                ]))),
                  ),
                  Expanded(
                    child: Material(
                        elevation: filteringEndDate == null ? 1 : 2,
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            width: double.infinity,
                            height: 60,
                            decoration: BoxDecoration(
                              color: filteringEndDate == null
                                  ? color.surfaceContainer
                                  : color.secondaryContainer,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                                spacing: 10,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    filteringEndDate != null
                                        ? Icons.calendar_month_rounded
                                        : Icons.calendar_month_outlined,
                                    color: filteringEndDate != null
                                        ? color.onSecondaryContainer
                                        : color.onSurfaceVariant,
                                  ),
                                  Expanded(
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            filteringEndDate != null
                                                ? 'End date'
                                                : 'No end date',
                                            style: filteringEndDate != null
                                                ? text.bodySmall?.copyWith(
                                                    color:
                                                        color.onSurfaceVariant,
                                                    fontWeight: FontWeight.w500)
                                                : text.titleSmall?.copyWith(
                                                    color:
                                                        color.onSurfaceVariant),
                                          ),
                                          if (filteringEndDate != null)
                                            Expanded(
                                                child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                filteringEndDate.toFormatDate(),
                                                style: text.titleSmall
                                                    ?.copyWith(
                                                        color: color.onSurface),
                                              ),
                                            ))
                                        ]),
                                  ),
                                ]))),
                  )
                ],
              ),
            ),
          SizedBox(
            height: 35,
          ),
          //region Selected/Cancel
          //endregion
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
                      onPressed: context.pop,
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
                            controller.onSaveFiltering();
                            context.pop();
                          },
                          child: Text('Save',
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
