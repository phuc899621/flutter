import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:taskit/features/main/presentation/home/controller/home_controller.dart';
import 'package:taskit/features/main/presentation/home/ui/widget/task_item.dart';
import 'package:taskit/shared/extension/date_time.dart';

import '../../../../../config/app/app_color.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeControllerProvider);
    final controller = ref.watch(homeControllerProvider.notifier);
    final color = ref.read(colorProvider(context));
    final text = Theme.of(context).textTheme;
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            floatingActionButton: FloatingActionButton(
                foregroundColor: color.onSecondary,
                splashColor: color.secondary,
                backgroundColor: color.secondary,
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
                              spacing: 5,
                              children: [
                                IconButton(
                                    onPressed: () => {},
                                    color: color.onPrimary,
                                    icon: const Icon(
                                      Icons.search_outlined,
                                      size: 30,
                                    )),
                                IconButton(
                                    color: color.onPrimary,
                                    onPressed: () => {},
                                    icon: const Icon(
                                      size: 30,
                                      Icons.notifications_none,
                                    )),
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
                    backgroundColor: color.primary,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        child: Container(
                            decoration: BoxDecoration(
                                color: color.primaryContainer,
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
                                      onDelete: () => debugPrint('delete'),
                                      onCheck: () => controller.onCheck(
                                          state.todayTasks[index].localId),
                                      onEdit: (localId) =>
                                          controller.onEdit(localId),
                                      onSubtaskCheck: (localId) =>
                                          controller.onSubtaskCheck(localId)),
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
                                      onDelete: () => debugPrint('delete'),
                                      onCheck: () => controller.onCheck(
                                          state.pendingTasks[index].localId),
                                      onEdit: (localId) =>
                                          controller.onEdit(localId),
                                      onSubtaskCheck: (localId) =>
                                          controller.onSubtaskCheck(localId)),
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
                                      onDelete: () => debugPrint('delete'),
                                      onCheck: () => controller.onCheck(state
                                          .todayCompletedTasks[index].localId),
                                      onEdit: (localId) =>
                                          controller.onEdit(localId),
                                      onSubtaskCheck: (localId) =>
                                          controller.onSubtaskCheck(localId)),
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
                                      onDelete: () => debugPrint('delete'),
                                      onCheck: () => controller.onCheck(state
                                          .todayOverDueTasks[index].localId),
                                      onEdit: (localId) =>
                                          controller.onEdit(localId),
                                      onSubtaskCheck: (localId) =>
                                          controller.onSubtaskCheck(localId)),
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
                                      onDelete: () => debugPrint('delete'),
                                      onCheck: () => controller.onCheck(
                                          state.tomorrowTasks[index].localId),
                                      onEdit: (localId) =>
                                          controller.onEdit(localId),
                                      onSubtaskCheck: (localId) =>
                                          controller.onSubtaskCheck(localId)),
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
                                      onDelete: () => debugPrint('delete'),
                                      onCheck: () => controller.onCheck(
                                          state.thisWeekTasks[index].localId),
                                      onEdit: (localId) =>
                                          controller.onEdit(localId),
                                      onSubtaskCheck: (localId) =>
                                          controller.onSubtaskCheck(localId)),
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
                                      onDelete: () => debugPrint('delete'),
                                      onCheck: () => controller.onCheck(
                                          state.pendingTasks[index].localId),
                                      onEdit: (localId) =>
                                          controller.onEdit(localId),
                                      onSubtaskCheck: (localId) =>
                                          controller.onSubtaskCheck(localId)),
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
                                      onDelete: () => debugPrint('delete'),
                                      onCheck: () => controller.onCheck(state
                                          .thisWeekCompletedTasks[index]
                                          .localId),
                                      onEdit: (localId) =>
                                          controller.onEdit(localId),
                                      onSubtaskCheck: (localId) =>
                                          controller.onSubtaskCheck(localId)),
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
                                      onDelete: () => debugPrint('delete'),
                                      onCheck: () => controller.onCheck(state
                                          .thisWeekOverDueTasks[index].localId),
                                      onEdit: (localId) =>
                                          controller.onEdit(localId),
                                      onSubtaskCheck: (localId) =>
                                          controller.onSubtaskCheck(localId)),
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
