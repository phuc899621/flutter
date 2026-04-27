import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:taskit/features/main/presentation/home/controller/home_controller.dart';
import 'package:taskit/features/main/presentation/home/ui/widget/home_app_bar.dart';
import 'package:taskit/features/main/presentation/home/ui/widget/home_task_view.dart';
import 'package:taskit/shared/application/time_service.dart';

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
              style: text.labelLarge?.copyWith(color: color.primary),
            ),
          ),
          TextButton(
            onPressed: () {
              controller.onDelete(localId);
              context.pop();
            },
            child: Text(
              'Delete',
              style: text.labelLarge?.copyWith(color: color.onError),
            ),
          ),
        ],
      ),
    );
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
              style: text.labelLarge?.copyWith(color: color.primary),
            ),
          ),
          TextButton(
            onPressed: () {
              controller.logout();
            },
            child: Text(
              'Confirm',
              style: text.labelLarge?.copyWith(color: color.onError),
            ),
          ),
        ],
      ),
    );
  }

  //endregion
  //region Listen
  void _listen() {
    ref.listen(homeControllerProvider.select((value) => value.isLogout), (
      _,
      next,
    ) {
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
              HomeAppBar(onLogout: _showLogoutDialog),
              _tabBar(),
            ],
            body: _tabBarView(),
          ),
        ),
      ),
    );
  }

  //region TAB BAR
  Widget _tabBar() {
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    return SliverAppBar(
      collapsedHeight: 80,
      toolbarHeight: 80,
      pinned: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
      ),
      backgroundColor: color.primary,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(
            color: color.surface,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          ),
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
            unselectedLabelStyle: text.labelLarge?.copyWith(
              fontWeight: FontWeight.w500,
            ),
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: color.primary,
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Tab(text: 'Today'),
              Tab(text: 'Tomorrow'),
              Tab(text: 'This week'),
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
      children: [_todayBarView(), _tomorrowBarView(), _thisWeekBarView()],
    );
  }

  //endregion

  //region Today BarView
  Widget _todayBarView() {
    final color = Theme.of(context).colorScheme;
    final state = ref.watch(homeControllerProvider);
    return HomeTaskView(
      onDelete: _showDialogConfirmDeleteTask,
      onEdit: _showBottomSheetEditTask,
      sections: [
        TaskSectionData(title: "Today's tasks", tasks: state.todayTasks),
        TaskSectionData(title: 'Pending tasks', tasks: state.pendingTasks),
        TaskSectionData(
          title: 'Completed tasks',
          tasks: state.todayCompletedTasks,
        ),
        TaskSectionData(
          title: 'Overdue tasks',
          tasks: state.todayOverDueTasks,
          titleColor: color.error,
        ),
      ],
    );
  }

  //endregion
  //region Tomorrow BarView
  Widget _tomorrowBarView() {
    final state = ref.watch(homeControllerProvider);
    return HomeTaskView(
      onDelete: _showDialogConfirmDeleteTask,
      onEdit: _showBottomSheetEditTask,
      sections: [
        TaskSectionData(title: "Tomorrow's tasks", tasks: state.tomorrowTasks),
      ],
    );
  }

  //endregion
  //region ThisWeek BarView
  Widget _thisWeekBarView() {
    final color = Theme.of(context).colorScheme;
    final state = ref.watch(homeControllerProvider);
    return HomeTaskView(
      onDelete: _showDialogConfirmDeleteTask,
      onEdit: _showBottomSheetEditTask,
      sections: [
        TaskSectionData(title: "This week's tasks", tasks: state.thisWeekTasks),
        TaskSectionData(title: 'Pending tasks', tasks: state.pendingTasks),
        TaskSectionData(
          title: 'Completed tasks',
          tasks: state.thisWeekCompletedTasks,
        ),
        TaskSectionData(
          title: 'Overdue tasks',
          tasks: state.thisWeekOverDueTasks,
          titleColor: color.error,
        ),
      ],
    );
  }
}
