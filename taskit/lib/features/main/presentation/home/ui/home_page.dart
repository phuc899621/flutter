import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:taskit/config/routers/router_provider.dart';
import 'package:taskit/features/main/presentation/home/controller/home_controller.dart';
import 'package:taskit/features/main/presentation/home/ui/widget/task_item.dart';
import 'package:taskit/features/main/presentation/list/controller/list_controller.dart';
import 'package:taskit/shared/application/time_service.dart';
import 'package:taskit/shared/extension/date_time.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with TickerProviderStateMixin {
  void _showDialogConfirmDeleteTask(int localId) {
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    final controller = ref.read(homeControllerProvider.notifier);
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
                    onPressed: context.pop,
                    child: Text(
                      'Cancel',
                      style: text.labelLarge?.copyWith(
                        color: color.primary,
                      ),
                    )),
                TextButton(
                    onPressed: () {
                      controller.onDelete(localId);
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

  //region SHOW Logout Dialog
  void _showLogoutDialog() async {
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    final controller = ref.read(homeControllerProvider.notifier);
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              titleTextStyle: text.titleLarge?.copyWith(
                color: color.onSurface,
                fontWeight: FontWeight.bold,
              ),
              title: Text('Logout'),
              content: const Text('Are you sure you want to logout?'),
              actions: [
                TextButton(
                    onPressed: context.pop,
                    child: Text(
                      'Cancel',
                      style: text.labelLarge?.copyWith(
                        color: color.primary,
                      ),
                    )),
                TextButton(
                    onPressed: () {
                      controller.logout();
                    },
                    child: Text(
                      'Confirm',
                      style: text.labelLarge?.copyWith(
                        color: color.onError,
                      ),
                    )),
              ],
            ));
  }

  //endregion
  //region Listen
  void _listen() {
    ref.listen(homeControllerProvider.select((value) => value.isLogout),
        (_, next) {
      if (next != null && next) {
        context.go('/');
      }
    });
  }

  //endregion

  //region MAIN
  @override
  Widget build(BuildContext context) {
    _listen();
    final controller = ref.watch(homeControllerProvider.notifier);
    final color = Theme.of(context).colorScheme;
    ref.listen<AsyncValue<DateTime>>(timeStreamProvider, (_, next) {
      next.whenData((now) {
        controller.onTimeChecker(now);
      });
    });
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            backgroundColor: color.surface,
            body: SafeArea(
              top: true,
              child: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  _topAppBar(),
                  _tabBar(),
                ],
                body: _tabBarView(),
              ),
            )));
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
//region TOP APPBAR
  Widget _topAppBar() {
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    final state = ref.watch(homeControllerProvider);
    return SliverAppBar(
      expandedHeight: 180,
      snap: true,
      pinned: true,
      floating: true,
      toolbarHeight: 80,
      centerTitle: false,
      backgroundColor: color.primary,
      flexibleSpace: LayoutBuilder(builder: (context, constraints) {
        final double top = constraints.biggest.height;
        final bool isCollapsed = top <= 90;
        return AnimatedSwitcher(
          duration: Duration(milliseconds: 800),
          child: isCollapsed ? _collapseAppBar() : _expandTopAppBar(),
        );
      }),
      titleSpacing: 15,
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
          child: _searchIconButton(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
          child: _logoutIconButton(),
        ),
      ],
    );
  }

//endregion
  //region Expand TopAppBar Widget
  Widget _expandTopAppBar() {
    final text = Theme.of(context).textTheme;
    final color = Theme.of(context).colorScheme;
    final state = ref.watch(homeControllerProvider);
    return FlexibleSpaceBar(
        background: Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
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
                  DateTime.now().toDisplayFullFormatDate(),
                  style: text.titleMedium?.copyWith(color: color.onPrimary),
                )
              ],
            ),
          ]),
    ));
  }

  //endregion
  //region Collapsed TopAppBar Widget
  Widget _collapseAppBar() {
    final text = Theme.of(context).textTheme;
    final color = Theme.of(context).colorScheme;
    final state = ref.watch(homeControllerProvider);

    return FlexibleSpaceBar(
      titlePadding: EdgeInsets.symmetric(vertical: 12, horizontal: 14),
      centerTitle: false,
      title: Text(
        'Home',
        style: text.headlineMedium,
      ),
    );
  }

  //endregion
//region Search And Logout Icon

  Widget _searchIconButton() {
    final color = Theme.of(context).colorScheme;
    final shouldFocus = ref.read(shouldFocusSearchTextFieldProvider.notifier);
    final navigationShell = ref.read(navigationShellProvider);
    return Material(
      color: Colors.transparent,
      clipBehavior: Clip.hardEdge,
      shape: CircleBorder(),
      elevation: 2,
      child: IconButton.filledTonal(
          iconSize: 30,
          style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(color.primaryContainer)),
          onPressed: () {
            shouldFocus.state = true;
            navigationShell.goBranch(1);
          },
          color: color.onPrimaryContainer,
          icon: Icon(Icons.search_rounded)),
    );
  }

  Widget _logoutIconButton() {
    final color = Theme.of(context).colorScheme;
    return Material(
      color: Colors.transparent,
      clipBehavior: Clip.hardEdge,
      shape: CircleBorder(),
      elevation: 2,
      child: IconButton.filledTonal(
          iconSize: 30,
          style:
              ButtonStyle(backgroundColor: WidgetStatePropertyAll(color.error)),
          onPressed: _showLogoutDialog,
          color: color.onError,
          icon: Icon(Icons.logout)),
    );
  }

//endregion

//region TAB BAR
  Widget _tabBar() {
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    return SliverAppBar(
      collapsedHeight: 80,
      toolbarHeight: 80,
      pinned: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(15))),
      backgroundColor: color.primary,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(
              color: color.surface,
              borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
          width: double.infinity,
          child: TabBar(
            dragStartBehavior: DragStartBehavior.down,
            tabAlignment: TabAlignment.center,
            isScrollable: true,
            dividerColor: Colors.transparent,
            physics: const BouncingScrollPhysics(),
            labelColor: color.onPrimary,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            labelPadding: const EdgeInsets.symmetric(horizontal: 15),
            splashBorderRadius: BorderRadius.circular(15),
            labelStyle: text.labelLarge?.copyWith(fontWeight: FontWeight.w600),
            unselectedLabelColor: color.onSurfaceVariant,
            unselectedLabelStyle:
                text.labelLarge?.copyWith(fontWeight: FontWeight.w500),
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: color.primary),
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
          ),
        ),
      ),
    );
  }

//endregion

//region TabBarView
  Widget _tabBarView() {
    return TabBarView(
      children: [
        _todayBarView(),
        _tomorrowBarView(),
        _thisWeekBarView(),
      ],
    );
  }

//endregion

//region Today BarView
  Widget _todayBarView() {
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    final state = ref.watch(homeControllerProvider);
    final controller = ref.watch(homeControllerProvider.notifier);
    return CustomScrollView(slivers: [
      if (state.todayTasks.isNotEmpty)
        SliverToBoxAdapter(
            child: Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 14, bottom: 6),
          child: Text('Today\'s tasks', style: text.titleMedium),
        )),
      SliverList(
        delegate: SliverChildBuilderDelegate(
            childCount: state.todayTasks.length,
            (context, index) => Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                  child: TaskItem(
                    task: state.todayTasks[index],
                    onDelete: _showDialogConfirmDeleteTask,
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
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 14, bottom: 6),
          child: Text('Pending tasks', style: text.titleMedium),
        )),
      SliverList(
        delegate: SliverChildBuilderDelegate(
            childCount: state.pendingTasks.length,
            (context, index) => Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                  child: TaskItem(
                    task: state.pendingTasks[index],
                    onDelete: _showDialogConfirmDeleteTask,
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
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 14, bottom: 6),
          child: Text('Completed tasks', style: text.titleMedium),
        )),
      SliverList(
        delegate: SliverChildBuilderDelegate(
            childCount: state.todayCompletedTasks.length,
            (context, index) => Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                  child: TaskItem(
                    task: state.todayCompletedTasks[index],
                    onDelete: _showDialogConfirmDeleteTask,
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
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 14, bottom: 6),
          child: Text('Overdue tasks',
              style: text.titleMedium?.copyWith(color: color.onError)),
        )),
      SliverList(
        delegate: SliverChildBuilderDelegate(
            childCount: state.todayOverDueTasks.length,
            (context, index) => Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                  child: TaskItem(
                    task: state.todayOverDueTasks[index],
                    onDelete: _showDialogConfirmDeleteTask,
                    onCheck: controller.onCheck,
                    onEdit: _showBottomSheetEditTask,
                    onSubtaskCheck: controller.onSubtaskCheck,
                    onSubtaskDelete: controller.onSubtaskDelete,
                  ),
                )),
      ),
      _fillRemaining()
    ]);
  }

//endregion
//region Tomorrow BarView
  Widget _tomorrowBarView() {
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    final state = ref.watch(homeControllerProvider);
    final controller = ref.watch(homeControllerProvider.notifier);
    return CustomScrollView(slivers: [
      if (state.tomorrowTasks.isNotEmpty)
        SliverToBoxAdapter(
            child: Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 14, bottom: 6),
          child: Text('Tomorrow\'s tasks', style: text.titleMedium),
        )),
      SliverList(
        delegate: SliverChildBuilderDelegate(
            childCount: state.tomorrowTasks.length,
            (context, index) => Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                  child: TaskItem(
                    task: state.tomorrowTasks[index],
                    onDelete: _showDialogConfirmDeleteTask,
                    onCheck: controller.onCheck,
                    onEdit: _showBottomSheetEditTask,
                    onSubtaskCheck: controller.onSubtaskCheck,
                    onSubtaskDelete: controller.onSubtaskDelete,
                  ),
                )),
      ),
      _fillRemaining()
    ]);
  }

//endregion
//region ThisWeek BarView
  Widget _thisWeekBarView() {
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    final state = ref.watch(homeControllerProvider);
    final controller = ref.watch(homeControllerProvider.notifier);
    return CustomScrollView(slivers: [
      if (state.thisWeekTasks.isNotEmpty)
        SliverToBoxAdapter(
            child: Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 14, bottom: 6),
          child: Text('This week\'s tasks', style: text.titleMedium),
        )),
      SliverList(
        delegate: SliverChildBuilderDelegate(
            childCount: state.thisWeekTasks.length,
            (context, index) => Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                  child: TaskItem(
                    task: state.thisWeekTasks[index],
                    onDelete: _showDialogConfirmDeleteTask,
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
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 14, bottom: 6),
          child: Text('Pending tasks', style: text.titleMedium),
        )),
      SliverList(
        delegate: SliverChildBuilderDelegate(
            childCount: state.pendingTasks.length,
            (context, index) => Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                  child: TaskItem(
                    task: state.pendingTasks[index],
                    onDelete: _showDialogConfirmDeleteTask,
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
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 14, bottom: 6),
          child: Text('Completed tasks', style: text.titleMedium),
        )),
      SliverList(
        delegate: SliverChildBuilderDelegate(
            childCount: state.thisWeekCompletedTasks.length,
            (context, index) => Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                  child: TaskItem(
                    task: state.thisWeekCompletedTasks[index],
                    onDelete: _showDialogConfirmDeleteTask,
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
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 14, bottom: 6),
          child: Text('Overdue tasks',
              style: text.titleMedium?.copyWith(color: color.onError)),
        )),
      SliverList(
        delegate: SliverChildBuilderDelegate(
            childCount: state.thisWeekOverDueTasks.length,
            (context, index) => Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                  child: TaskItem(
                    task: state.thisWeekOverDueTasks[index],
                    onDelete: _showDialogConfirmDeleteTask,
                    onCheck: controller.onCheck,
                    onEdit: _showBottomSheetEditTask,
                    onSubtaskCheck: controller.onSubtaskCheck,
                    onSubtaskDelete: controller.onSubtaskDelete,
                  ),
                )),
      ),
      _fillRemaining()
    ]);
  }

//endregion

//region FillRemaining
  Widget _fillRemaining() {
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
            style: text.headlineMedium?.copyWith(color: color.onSurface),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Keep adding and managing your tasks',
            textAlign: TextAlign.center,
            style: text.titleMedium?.copyWith(color: color.onSurfaceVariant),
          ),
          const SizedBox(
            height: 200,
          ),
        ]),
      ),
    );
  }
}
