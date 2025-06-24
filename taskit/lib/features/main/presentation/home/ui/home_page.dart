import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:taskit/features/main/presentation/home/controller/home_controller.dart';
import 'package:taskit/features/main/presentation/home/ui/widget/task_item.dart';
import 'package:taskit/shared/application/time_service.dart';
import 'package:taskit/shared/extension/date_time.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with TickerProviderStateMixin {
  void _showDialogDelete(int localId) {
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
                          .read(homeControllerProvider.notifier)
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

  void _showBottomSheetEditTask(int localId) {
    context.push('/edit_task', extra: localId);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeControllerProvider);
    final controller = ref.watch(homeControllerProvider.notifier);
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    ref.listen<AsyncValue<DateTime>>(timeStreamProvider, (_, next) {
      next.whenData((now) {
        controller.onTimeChecker(now);
      });
    });
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            floatingActionButton: FloatingActionButton(
                foregroundColor: color.onPrimaryContainer,
                splashColor: color.primary,
                backgroundColor: color.primaryContainer,
                child: Icon(
                  Icons.add_sharp,
                  size: 30,
                ),
                onPressed: () => context.push('/add_task')),
            backgroundColor: color.surface,
            body: SafeArea(
              top: true,
              child: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  SliverAppBar(
                    collapsedHeight: 90,
                    expandedHeight: 140,
                    toolbarHeight: 90,
                    snap: true,
                    floating: true,
                    backgroundColor: color.primary,
                    flexibleSpace: FlexibleSpaceBar(
                        background: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 14),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'Hello, ${state.userName} ',
                                  style: text.headlineMedium,
                                ),
                                Text(
                                  DateTime.now().toDisplayFormatDate(),
                                  style: text.titleMedium
                                      ?.copyWith(color: color.onPrimary),
                                )
                              ],
                            ),
                            Row(
                              spacing: 10,
                              children: [
                                Material(
                                  color: Colors.transparent,
                                  elevation: 2,
                                  shape: const CircleBorder(),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: color.primaryContainer,
                                        shape: BoxShape.circle),
                                    child: IconButton(
                                        onPressed: () => {},
                                        color: color.onPrimaryContainer,
                                        icon: const Icon(
                                          Icons.search_outlined,
                                        )),
                                  ),
                                ),
                                Material(
                                  color: Colors.transparent,
                                  elevation: 2,
                                  shape: const CircleBorder(),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: color.primaryContainer,
                                        shape: BoxShape.circle),
                                    child: IconButton(
                                        color: color.onPrimaryContainer,
                                        onPressed: () => {},
                                        icon: const Icon(
                                          Icons.notifications_none,
                                        )),
                                  ),
                                ),
                              ],
                            )
                          ]),
                    )),
                  ),
                  SliverAppBar(
                    collapsedHeight: 70,
                    toolbarHeight: 70,
                    pinned: true,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(15))),
                    backgroundColor: color.surface,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        child: Material(
                          elevation: 2,
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                              decoration: BoxDecoration(
                                  color: color.primary.withAlpha(17),
                                  borderRadius: BorderRadius.circular(15)),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 8),
                              child: TabBar(
                                dividerColor: Colors.transparent,
                                indicatorColor: color.primary,
                                labelColor: color.onPrimary,
                                labelStyle: text.labelLarge
                                    ?.copyWith(fontWeight: FontWeight.w600),
                                unselectedLabelColor: color.onSurfaceVariant,
                                unselectedLabelStyle: text.labelLarge,
                                indicator: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: color.primary),
                                indicatorSize: TabBarIndicatorSize.tab,
                                tabs: [
                                  Tab(
                                    text: 'Today',
                                  ),
                                  Tab(
                                    text: 'Tomorrow',
                                  ),
                                  Tab(
                                    text: 'This week',
                                  ),
                                ],
                              )),
                        ),
                      ),
                    ),
                  ),
                ],
                body: TabBarView(
                  children: [
                    CustomScrollView(slivers: [
                      if (state.todayTasks.isNotEmpty)
                        SliverToBoxAdapter(
                            child: Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, top: 14, bottom: 6),
                          child:
                              Text('Today\'s tasks', style: text.titleMedium),
                        )),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                            childCount: state.todayTasks.length,
                            (context, index) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 14),
                                  child: TaskItem(
                                    task: state.todayTasks[index],
                                    onDelete: _showDialogDelete,
                                    onCheck: controller.onCheck,
                                    onEdit: _showBottomSheetEditTask,
                                    onSubtaskCheck: controller.onSubtaskCheck,
                                    onSubtaskDelete: controller.onSubtaskDelete,
                                  ),
                                )),
                      ),
                      if (state.pendingTasks.isNotEmpty)
                        SliverToBoxAdapter(
                            child: Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, top: 14, bottom: 6),
                          child: Text('Pending tasks', style: text.titleMedium),
                        )),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                            childCount: state.pendingTasks.length,
                            (context, index) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 14),
                                  child: TaskItem(
                                    task: state.pendingTasks[index],
                                    onDelete: _showDialogDelete,
                                    onCheck: controller.onCheck,
                                    onEdit: _showBottomSheetEditTask,
                                    onSubtaskCheck: controller.onSubtaskCheck,
                                    onSubtaskDelete: controller.onSubtaskDelete,
                                  ),
                                )),
                      ),
                      if (state.todayCompletedTasks.isNotEmpty)
                        SliverToBoxAdapter(
                            child: Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, top: 14, bottom: 6),
                          child:
                              Text('Completed tasks', style: text.titleMedium),
                        )),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                            childCount: state.todayCompletedTasks.length,
                            (context, index) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 14),
                                  child: TaskItem(
                                    task: state.todayCompletedTasks[index],
                                    onDelete: _showDialogDelete,
                                    onCheck: controller.onCheck,
                                    onEdit: _showBottomSheetEditTask,
                                    onSubtaskCheck: controller.onSubtaskCheck,
                                    onSubtaskDelete: controller.onSubtaskDelete,
                                  ),
                                )),
                      ),
                      if (state.todayOverDueTasks.isNotEmpty)
                        SliverToBoxAdapter(
                            child: Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, top: 14, bottom: 6),
                          child: Text('Overdue tasks',
                              style: text.titleMedium
                                  ?.copyWith(color: color.onError)),
                        )),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                            childCount: state.todayOverDueTasks.length,
                            (context, index) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 14),
                                  child: TaskItem(
                                    task: state.todayOverDueTasks[index],
                                    onDelete: _showDialogDelete,
                                    onCheck: controller.onCheck,
                                    onEdit: _showBottomSheetEditTask,
                                    onSubtaskCheck: controller.onSubtaskCheck,
                                    onSubtaskDelete: controller.onSubtaskDelete,
                                  ),
                                )),
                      ),
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 200,
                                ),
                                const Icon(
                                  Icons.lightbulb,
                                  size: 50,
                                  color: Colors.yellow,
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  'Taskit',
                                  style: text.headlineMedium
                                      ?.copyWith(color: color.onSurface),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Keep adding and managing your tasks',
                                  textAlign: TextAlign.center,
                                  style: text.titleMedium
                                      ?.copyWith(color: color.onSurfaceVariant),
                                ),
                                const SizedBox(
                                  height: 200,
                                ),
                              ]),
                        ),
                      ),
                    ]),
                    CustomScrollView(slivers: [
                      if (state.tomorrowTasks.isNotEmpty)
                        SliverToBoxAdapter(
                            child: Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, top: 14, bottom: 6),
                          child: Text('Tomorrow\'s tasks',
                              style: text.titleMedium),
                        )),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                            childCount: state.tomorrowTasks.length,
                            (context, index) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 14),
                                  child: TaskItem(
                                    task: state.tomorrowTasks[index],
                                    onDelete: _showDialogDelete,
                                    onCheck: controller.onCheck,
                                    onEdit: _showBottomSheetEditTask,
                                    onSubtaskCheck: controller.onSubtaskCheck,
                                    onSubtaskDelete: controller.onSubtaskDelete,
                                  ),
                                )),
                      ),
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 200,
                                ),
                                const Icon(
                                  Icons.lightbulb,
                                  size: 50,
                                  color: Colors.yellow,
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  'Taskit',
                                  style: text.headlineMedium
                                      ?.copyWith(color: color.onSurface),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Keep adding and managing your tasks',
                                  textAlign: TextAlign.center,
                                  style: text.titleMedium
                                      ?.copyWith(color: color.onSurfaceVariant),
                                ),
                                const SizedBox(
                                  height: 200,
                                ),
                              ]),
                        ),
                      ),
                    ]),
                    CustomScrollView(slivers: [
                      if (state.thisWeekTasks.isNotEmpty)
                        SliverToBoxAdapter(
                            child: Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, top: 14, bottom: 6),
                          child: Text('This week\'s tasks',
                              style: text.titleMedium),
                        )),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                            childCount: state.thisWeekTasks.length,
                            (context, index) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 14),
                                  child: TaskItem(
                                    task: state.thisWeekTasks[index],
                                    onDelete: _showDialogDelete,
                                    onCheck: controller.onCheck,
                                    onEdit: _showBottomSheetEditTask,
                                    onSubtaskCheck: controller.onSubtaskCheck,
                                    onSubtaskDelete: controller.onSubtaskDelete,
                                  ),
                                )),
                      ),
                      if (state.pendingTasks.isNotEmpty)
                        SliverToBoxAdapter(
                            child: Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, top: 14, bottom: 6),
                          child: Text('Pending tasks', style: text.titleMedium),
                        )),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                            childCount: state.pendingTasks.length,
                            (context, index) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 14),
                                  child: TaskItem(
                                    task: state.pendingTasks[index],
                                    onDelete: _showDialogDelete,
                                    onCheck: controller.onCheck,
                                    onEdit: _showBottomSheetEditTask,
                                    onSubtaskCheck: controller.onSubtaskCheck,
                                    onSubtaskDelete: controller.onSubtaskDelete,
                                  ),
                                )),
                      ),
                      if (state.thisWeekCompletedTasks.isNotEmpty)
                        SliverToBoxAdapter(
                            child: Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, top: 14, bottom: 6),
                          child:
                              Text('Completed tasks', style: text.titleMedium),
                        )),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                            childCount: state.thisWeekCompletedTasks.length,
                            (context, index) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 14),
                                  child: TaskItem(
                                    task: state.thisWeekCompletedTasks[index],
                                    onDelete: _showDialogDelete,
                                    onCheck: controller.onCheck,
                                    onEdit: _showBottomSheetEditTask,
                                    onSubtaskCheck: controller.onSubtaskCheck,
                                    onSubtaskDelete: controller.onSubtaskDelete,
                                  ),
                                )),
                      ),
                      if (state.thisWeekOverDueTasks.isNotEmpty)
                        SliverToBoxAdapter(
                            child: Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, top: 14, bottom: 6),
                          child: Text('Overdue tasks',
                              style: text.titleMedium
                                  ?.copyWith(color: color.onError)),
                        )),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                            childCount: state.thisWeekOverDueTasks.length,
                            (context, index) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 14),
                                  child: TaskItem(
                                    task: state.thisWeekOverDueTasks[index],
                                    onDelete: _showDialogDelete,
                                    onCheck: controller.onCheck,
                                    onEdit: _showBottomSheetEditTask,
                                    onSubtaskCheck: controller.onSubtaskCheck,
                                    onSubtaskDelete: controller.onSubtaskDelete,
                                  ),
                                )),
                      ),
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 200,
                                ),
                                const Icon(
                                  Icons.lightbulb,
                                  size: 50,
                                  color: Colors.yellow,
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  'Taskit',
                                  style: text.headlineMedium
                                      ?.copyWith(color: color.onSurface),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Keep adding and managing your tasks',
                                  textAlign: TextAlign.center,
                                  style: text.titleMedium
                                      ?.copyWith(color: color.onSurfaceVariant),
                                ),
                                const SizedBox(
                                  height: 200,
                                ),
                              ]),
                        ),
                      ),
                    ]),
                  ],
                ),
              ),
            )));
  }
}
