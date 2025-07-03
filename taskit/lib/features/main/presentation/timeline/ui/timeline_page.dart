import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:taskit/config/app/app_color.dart';
import 'package:taskit/features/main/presentation/timeline/controller/timeline_controller.dart';
import 'package:taskit/shared/extension/date_time.dart';

import '../../../../../config/routers/router_provider.dart';
import '../../home/ui/widget/task_item.dart';
import '../../list/controller/list_controller.dart';

class TimelinePage extends ConsumerStatefulWidget {
  const TimelinePage({super.key});

  @override
  ConsumerState<TimelinePage> createState() => _TimeLinePageState();
}

class _TimeLinePageState extends ConsumerState<TimelinePage> {
  final _easyDateController = EasyDatePickerController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(milliseconds: 500), () {
        _easyDateController.animateToFocusDate(
            duration: Duration(milliseconds: 700));
      });
    });
  }

  void _showBottomSheetEditTask(int localId) {
    context.push('/edit_task', extra: localId);
  }

  void _showDialogConfirmDeleteTask(int localId) {
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              titleTextStyle: text.titleLarge?.copyWith(
                color: color.onSurface,
                fontWeight: FontWeight.bold,
              ),
              title: Text('Delete task'),
              content: const Text('Are you sure you want to delete this task?'),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      'Cancel',
                      style: text.labelLarge?.copyWith(
                        color: color.primary,
                      ),
                    )),
                TextButton(
                    onPressed: () {
                      ref
                          .read(timelineControllerProvider.notifier)
                          .onDelete(localId);
                      Navigator.pop(context);
                      context.pop();
                    },
                    child: Text(
                      'Delete',
                      style: text.labelLarge?.copyWith(
                        color: color.onError,
                      ),
                    )),
              ],
            ));
  }

//region MAIN
  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final color = Theme.of(context).colorScheme;
    final controller = ref.read(timelineControllerProvider.notifier);
    final state = ref.watch(timelineControllerProvider);
    final focusDate = state.focusDate;
    if (focusDate == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        controller.setFocusDate(DateTime.now().toStartOfDay());
      });
    }
    return Scaffold(
      backgroundColor: color.surface,
      body: SafeArea(
        top: true,
        child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) =>
                [_topAppBar(), _horizontalCalendar()],
            body: _body()),
      ),
    );
  }

//endregion

  //region FAB
  Widget _fabAddTask() {
    final color = Theme.of(context).colorScheme;
    return ExpandableFab(
      distance: 70,
      type: ExpandableFabType.up,
      openButtonBuilder: RotateFloatingActionButtonBuilder(
        child: const Icon(Icons.add),
        fabSize: ExpandableFabSize.regular,
        foregroundColor: color.onPrimaryContainer,
        backgroundColor: color.primaryContainer,
        shape: const CircleBorder(),
      ),
      closeButtonBuilder: DefaultFloatingActionButtonBuilder(
        child: const Icon(Icons.close),
        fabSize: ExpandableFabSize.regular,
        foregroundColor: color.surface,
        backgroundColor: color.onSurface,
        shape: const CircleBorder(),
      ),
      children: [
        FloatingActionButton(
            heroTag: 'Add Task',
            shape: CircleBorder(),
            foregroundColor: color.onPrimaryContainer,
            splashColor: color.primary,
            backgroundColor: color.primaryContainer,
            child: Icon(
              Icons.note_alt_outlined,
              size: 30,
            ),
            onPressed: () => context.push('/add_task')),
        FloatingActionButton(
            heroTag: 'Add Task Using Voice',
            shape: CircleBorder(),
            foregroundColor: color.onPrimaryContainer,
            splashColor: color.primary,
            backgroundColor: color.primaryContainer,
            onPressed: () => context.push('/voice'),
            child: Icon(
              Icons.mic,
              size: 30,
            ))
      ],
    );
  }

//endregion
//region TopAppBar
  Widget _topAppBar() {
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    final shouldFocus = ref.read(shouldFocusSearchTextFieldProvider.notifier);
    final navigationShell = ref.read(navigationShellProvider);
    return SliverAppBar(
      backgroundColor: color.primary,
      toolbarHeight: 70,
      floating: false,
      pinned: true,
      title: Text('Calendar'),
      titleTextStyle: text.headlineSmall,
      actionsPadding: EdgeInsets.only(right: 14),
      actions: [
        Material(
          color: Colors.transparent,
          elevation: 2,
          shape: const CircleBorder(),
          child: Container(
            decoration: BoxDecoration(
                color: color.primaryContainer, shape: BoxShape.circle),
            child: IconButton(
                onPressed: () {
                  shouldFocus.state = true;
                  navigationShell.goBranch(1);
                },
                color: color.onPrimaryContainer,
                icon: const Icon(
                  Icons.search_outlined,
                )),
          ),
        ),
      ],
    );
  }

//endregion
//region HorizontalCalendar
  Widget _horizontalCalendar() {
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    final controller = ref.read(timelineControllerProvider.notifier);
    final state = ref.watch(timelineControllerProvider);
    final focusDate = state.focusDate;
    return SliverAppBar(
        backgroundColor: color.primary,
        pinned: true,
        toolbarHeight: 210,
        flexibleSpace: FlexibleSpaceBar(
            background: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Container(
            decoration: BoxDecoration(
              color: color.surface,
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            ),
            child: EasyDateTimeLinePicker.itemBuilder(
                physics: BouncingScrollPhysics(),
                controller: _easyDateController,
                focusedDate: focusDate ?? DateTime.now(),
                daySeparatorPadding: 15,
                timelineOptions: TimelineOptions(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 8),
                  height: 130,
                ),
                firstDate: DateTime(DateTime.now().year - 1, 1, 1),
                lastDate: DateTime(DateTime.now().year + 1, 12, 31),
                itemExtent: 60,
                selectionMode: SelectionMode.autoCenter(
                  duration: Duration(seconds: 1),
                  curve: Curves.easeInOut,
                ),
                headerOptions: HeaderOptions(
                    headerType: HeaderType.picker,
                    headerBuilder: _calendarHeader),
                itemBuilder: _calendarCard,
                currentDate: DateTime.now().toStartOfDay(),
                onDateChange: controller.setFocusDate),
          ),
        )));
  }

//endregion
//region Calendar card
  Widget _calendarCard(BuildContext context, DateTime date, bool isSelected,
      bool isDisable, bool isToday, void Function() onTap) {
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    final state = ref.watch(timelineControllerProvider);
    return Container(
      padding: EdgeInsets.symmetric(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Material(
            elevation: isSelected ? 3 : 1,
            borderRadius: BorderRadius.circular(15),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: onTap,
              child: Ink(
                decoration: BoxDecoration(
                    color:
                        isSelected ? color.primary : color.surfaceContainerLow,
                    borderRadius: BorderRadius.circular(15),
                    border: isToday
                        ? Border.all(color: color.primary, width: 2)
                        : null),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 3, horizontal: 3),
                  width: double.infinity,
                  height: 90,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Center(
                            child: Text(
                          date.threeCharMonth,
                          style: text.bodySmall?.copyWith(
                              color: isSelected
                                  ? color.onPrimary
                                  : (isToday
                                      ? color.primary
                                      : color.onSurfaceVariant)),
                        )),
                      ),
                      Expanded(
                        child: Center(
                            child: Text(
                          date.day.toString(),
                          style: text.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: isSelected
                                  ? color.onPrimary
                                  : (isToday
                                      ? color.primary
                                      : color.onSurfaceVariant)),
                        )),
                      ),
                      Expanded(
                        child: Center(
                            child: Text(
                          date.threeCharDayOfWeek,
                          style: text.bodySmall?.copyWith(
                              color: isSelected
                                  ? color.onPrimary
                                  : (isToday
                                      ? color.primary
                                      : color.onSurfaceVariant)),
                        )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          if (state.allTasks.any((task) {
            final dueDate = task.dueDate;
            return dueDate != null && dueDate.isSameDay(date);
          }))
            Container(
              width: 8,
              height: 8,
              decoration:
                  BoxDecoration(color: color.primary, shape: BoxShape.circle),
            )
        ],
      ),
    );
  }

//endregion
//region Calendar Header
  Widget _calendarHeader(
      BuildContext context, DateTime date, void Function() onTap) {
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Row(
        spacing: 8,
        mainAxisSize: MainAxisSize.max,
        children: [
          TextButton.icon(
            iconAlignment: IconAlignment.end,
            onPressed: onTap,
            label: Text(
              date.toDisplayFormatDate(),
              style: text.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: color.primary,
              ),
            ),
            icon: Icon(
              Icons.arrow_right,
            ),
          ),
          Spacer(),
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: ConstColor.surfaceContainer),
            child: IconButton(
                onPressed: () {
                  _easyDateController.animateToCurrentDate();
                },
                icon: Icon(Icons.today)),
          ),
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: ConstColor.surfaceContainer),
            child: IconButton(
                onPressed: () {
                  _easyDateController.animateToFocusDate();
                },
                icon: Icon(Icons.push_pin)),
          )
        ],
      ),
    );
  }

//endregion
//region Body
  Widget _body() {
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    final controller = ref.read(timelineControllerProvider.notifier);
    final state = ref.watch(timelineControllerProvider);
    return CustomScrollView(
      slivers: [
        if (state.tasks.isNotEmpty)
          SliverList(
            delegate: SliverChildBuilderDelegate(
                childCount: state.tasks.length,
                (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 14),
                      child: TaskItem(
                        task: state.tasks[index],
                        onDelete: _showDialogConfirmDeleteTask,
                        onCheck: controller.onCheck,
                        onEdit: _showBottomSheetEditTask,
                        onSubtaskCheck: controller.onSubtaskCheck,
                        onSubtaskDelete: controller.onSubtaskDelete,
                      ),
                    )),
          ),
        if (state.tasks.isEmpty)
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    const Icon(
                      Icons.hourglass_bottom,
                      size: 50,
                      color: Colors.yellow,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'No available tasks',
                      style: text.headlineSmall
                          ?.copyWith(color: color.onSurfaceVariant),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                  ]),
            ),
          ),
      ],
    );
  }
}
