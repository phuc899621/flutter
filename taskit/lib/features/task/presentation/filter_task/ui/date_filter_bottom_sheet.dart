import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:taskit/features/task/domain/entities/filter_date_option_enum.dart';
import 'package:taskit/shared/extension/date_time.dart';
import 'package:taskit/shared/extension/enum.dart';

import '../controller/filter_controller.dart';

class DateFilterBottomSheet extends ConsumerStatefulWidget {
  const DateFilterBottomSheet({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DateFilterBottomSheetState();
}

class _DateFilterBottomSheetState extends ConsumerState<DateFilterBottomSheet> {
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(filterControllerProvider);
    final controller = ref.read(filterControllerProvider.notifier);
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    final filteringStartDate = state.filteringStartDate;
    final filteringEndDate = state.filteringEndDate;
    final selectedStartDate = state.selectedStartDate;
    final selectedEndDate = state.selectedEndDate;
    _startDateController.text = filteringStartDate?.toFormatDate() ?? '';
    _endDateController.text = filteringEndDate?.toFormatDate() ?? '';
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
                    'Select date filter',
                    style: text.titleLarge?.copyWith(color: color.onSurface),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      controller.onCancelFilteringDate();
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
                crossAxisAlignment: WrapCrossAlignment.start,
                children: [
                  ...FilterDateOption.values.map((e) => Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: ChoiceChip(
                          elevation: state.selectedDateOption == e ? 2 : 0,
                          label: Text(e.optionString),
                          selected: state.selectedDateOption == e,
                          onSelected: (value) {
                            controller.setSelectedDateOption(e);
                          }))),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),

          if (state.selectedDateOption == FilterDateOption.custom)
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Material(
                    elevation: selectedStartDate == null ? 1 : 2,
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () => context.push('/filter/date/start'),
                      child: Ink(
                        decoration: BoxDecoration(
                          color: selectedStartDate == null
                              ? color.surfaceContainer
                              : color.secondaryContainer,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            width: double.infinity,
                            height: 60,
                            child: Row(
                                spacing: 10,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    selectedStartDate != null
                                        ? Icons.calendar_month_rounded
                                        : Icons.calendar_month_outlined,
                                    color: selectedStartDate != null
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
                                            selectedStartDate != null
                                                ? 'Start date'
                                                : 'Select start date',
                                            style: selectedStartDate != null
                                                ? text.bodyMedium?.copyWith(
                                                    color:
                                                        color.onSurfaceVariant,
                                                    fontWeight: FontWeight.w500)
                                                : text.titleMedium?.copyWith(
                                                    color:
                                                        color.onSurfaceVariant),
                                          ),
                                          if (selectedStartDate != null)
                                            Expanded(
                                                child: Text(
                                              selectedStartDate.toFormatDate(),
                                              style: text.titleMedium?.copyWith(
                                                  color: color.onSurface),
                                            ))
                                        ]),
                                  ),
                                  if (selectedStartDate != null)
                                    IconButton(
                                        onPressed: () => controller
                                            .setSelectedStartDate(null),
                                        icon: Icon(Icons.close))
                                ])),
                      ),
                    ))),
          if (state.selectedDateOption == FilterDateOption.custom)
            SizedBox(
              height: 15,
            ),
          if (state.selectedDateOption == FilterDateOption.custom)
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Material(
                    elevation: selectedEndDate == null ? 1 : 2,
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () => context.push('/filter/date/end'),
                      child: Ink(
                        decoration: BoxDecoration(
                          color: selectedEndDate == null
                              ? color.surfaceContainer
                              : color.secondaryContainer,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            width: double.infinity,
                            height: 60,
                            child: Row(
                                spacing: 10,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    selectedEndDate != null
                                        ? Icons.calendar_month_rounded
                                        : Icons.calendar_month_outlined,
                                    color: selectedEndDate != null
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
                                            selectedEndDate != null
                                                ? 'End date'
                                                : 'Select end date',
                                            style: selectedEndDate != null
                                                ? text.bodyMedium?.copyWith(
                                                    color:
                                                        color.onSurfaceVariant,
                                                    fontWeight: FontWeight.w500)
                                                : text.titleMedium?.copyWith(
                                                    color:
                                                        color.onSurfaceVariant),
                                          ),
                                          if (selectedEndDate != null)
                                            Expanded(
                                                child: Text(
                                              selectedEndDate.toFormatDate(),
                                              style: text.titleMedium?.copyWith(
                                                  color: color.onSurface),
                                            ))
                                        ]),
                                  ),
                                  if (selectedEndDate != null)
                                    IconButton(
                                        onPressed: () =>
                                            controller.setSelectedEndDate(null),
                                        icon: Icon(Icons.close))
                                ])),
                      ),
                    ))),
          SizedBox(
            height: 30,
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
                        controller.onCancelFilteringDate();
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
                            controller.onSaveFilteringDate();
                            context.pop();
                          },
                          child: Text('Select',
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
