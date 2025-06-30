import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:taskit/features/main/presentation/home/ui/widget/task_item.dart';
import 'package:taskit/features/main/presentation/list/controller/search_text_controller.dart';
import 'package:taskit/features/main/presentation/list/controller/tab_selected_index.dart';
import 'package:taskit/features/task/domain/entities/order_option_enum.dart';
import 'package:taskit/shared/extension/enum.dart';
import 'package:taskit/shared/log/logger_provider.dart';

import '../controller/list_controller.dart';

class ListPage extends ConsumerStatefulWidget {
  const ListPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ListPageState();
}

class _ListPageState extends ConsumerState<ListPage>
    with TickerProviderStateMixin {
  final _searchFocusNode = FocusNode();
  bool isInit = false;
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      logger.i('_tabController.index: ${_tabController.index}');
      ref.read(tabSelectedIndexProvider.notifier).state = _tabController.index;
    });
  }

  void _showBottomSheetEditTask(int localId) {
    context.push('/edit_task', extra: localId);
  }

  void _showDialogConfirmDeleteTask(int localId) {
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    final controller = ref.read(listControllerProvider.notifier);
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

  //region MAIN
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    final controller = ref.watch(listControllerProvider.notifier);
    final state = ref.watch(listControllerProvider);
    final refs = ref.watch(shouldFocusSearchTextFieldProvider);
    if (refs) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _searchFocusNode.requestFocus();
        ref.read(shouldFocusSearchTextFieldProvider.notifier).state = false;
      });
    }
    return Scaffold(
        floatingActionButton: _fabAddTask(),
        body: SafeArea(
            top: true,
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) =>
                  [_topAppBar(), _searchAppBar(), _tabBar()],
              body: TabBarView(controller: _tabController, children: [
                _tabAll(),
                _tabPending(),
                _tabScheduled(),
                _tabCompleted(),
              ]),
            )));
  }

  //endregion
  //region FAB
  Widget _fabAddTask() {
    final color = Theme.of(context).colorScheme;
    return FloatingActionButton(
        foregroundColor: color.onPrimaryContainer,
        splashColor: color.primary,
        backgroundColor: color.primaryContainer,
        child: Icon(
          Icons.add_sharp,
          size: 30,
        ),
        onPressed: () => context.push('/add_task'));
  }

  //endregion
  //region Top APPBAR
  Widget _topAppBar() {
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    final state = ref.watch(listControllerProvider);
    final filterTextBtn = Text(
      'Filter ${state.isFiltering ? 'On' : 'Off'}',
      style: text.titleSmall?.copyWith(
          fontWeight: FontWeight.w500,
          color: state.isFiltering ? color.primary : color.onPrimaryContainer),
    );
    final filterStyleBtn = ButtonStyle(
        elevation: WidgetStatePropertyAll(2),
        backgroundColor: WidgetStatePropertyAll(state.isFiltering
            ? color.surfaceContainerLow
            : color.primaryContainer));
    final filterIconBtn = Icon(
      Icons.tune_outlined,
      color: state.isFiltering ? color.primary : color.onPrimaryContainer,
    );
    return SliverAppBar(
      pinned: true,
      floating: true,
      backgroundColor: color.primary,
      toolbarHeight: 70,
      title: Text('List Task'),
      titleTextStyle: text.headlineMedium,
      actionsPadding: EdgeInsets.symmetric(horizontal: 5),
      actions: [
        FilledButton.tonalIcon(
          onPressed: () => context.push('/filter'),
          label: filterTextBtn,
          style: filterStyleBtn,
          icon: filterIconBtn,
        ),
      ],
    );
  }

//region SearchBar
  Widget _searchAppBar() {
    final textController = ref.watch(searchControllerProvider);
    final controller = ref.watch(listControllerProvider.notifier);
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    final suffixIcon = textController.getOrCreateController().text.isNotEmpty
        ? IconButton(
            onPressed: () {
              textController.clear();
              controller.setSearchText('');
              controller.callUpdateFilteringTask();
            },
            icon: Icon(
              Icons.clear_rounded,
            ),
          )
        : null;
    return SliverAppBar(
      toolbarHeight: 70,
      pinned: false,
      floating: true,
      snap: true,
      backgroundColor: color.primary,
      flexibleSpace: FlexibleSpaceBar(
        background: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: SizedBox(
              height: 50,
              child: TextField(
                  autofocus: false,
                  maxLines: 1,
                  focusNode: _searchFocusNode,
                  controller: textController.getOrCreateController(),
                  onTapOutside: (_) => FocusScope.of(context).unfocus(),
                  onChanged: (text) {
                    controller.setSearchText(text);
                    controller.callUpdateFilteringTask();
                  },
                  textCapitalization: TextCapitalization.sentences,
                  style: text.bodyMedium?.copyWith(
                      color: color.onSurface, fontWeight: FontWeight.w500),
                  maxLength: 35,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: color.primary,
                          width: 2,
                        ),
                      ),
                      filled: true,
                      fillColor: color.surfaceContainerLowest,
                      counterText: '',
                      hintText: 'Search tasks',
                      hintStyle: text.bodyMedium?.copyWith(
                          color: color.onSurfaceVariant,
                          fontWeight: FontWeight.w500),
                      prefixIcon: Icon(
                        Icons.search_rounded,
                      ),
                      suffixIcon: suffixIcon)),
            ),
          ),
        ),
      ),
    );
  }

//endregion
//region TabBar
  Widget _tabBar() {
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    final state = ref.watch(listControllerProvider);
    return SliverAppBar(
        pinned: true,
        toolbarHeight: 120,
        backgroundColor: color.primary,
        flexibleSpace: FlexibleSpaceBar(
          background: Container(
            decoration: BoxDecoration(
              color: color.surface,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30),
              ),
            ),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: TabBar(
                    controller: _tabController,
                    dragStartBehavior: DragStartBehavior.down,
                    tabAlignment: TabAlignment.start,
                    isScrollable: true,
                    dividerColor: Colors.transparent,
                    physics: const BouncingScrollPhysics(),
                    labelStyle:
                        text.labelLarge?.copyWith(fontWeight: FontWeight.w600),
                    labelColor: color.onPrimary,
                    unselectedLabelStyle:
                        text.labelLarge?.copyWith(fontWeight: FontWeight.w600),
                    unselectedLabelColor: color.onSurfaceVariant,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    labelPadding: const EdgeInsets.symmetric(horizontal: 15),
                    splashBorderRadius: BorderRadius.circular(15),
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: color.primary),
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: [
                      Tab(
                        text: 'All (${state.filteringTask.length})',
                      ),
                      Tab(
                        text: 'Pending (${state.filteringPendingTask.length})',
                      ),
                      Tab(
                        text:
                            'Scheduled (${state.filteringScheduledTask.length})',
                      ),
                      Tab(
                        text:
                            'Completed (${state.filteringCompletedTask.length})',
                      ),
                    ],
                  ),
                ),
                _dropDownOrdering()
              ],
            ),
          ),
        ));
  }

//endregion
//region Ordering DropDown
  Widget _dropDownOrdering() {
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    final state = ref.watch(listControllerProvider);
    final controller = ref.read(listControllerProvider.notifier);
    return Container(
      height: 50,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Align(
        alignment: Alignment.topRight,
        child: MenuAnchor(
          alignmentOffset: Offset(0, 0),
          menuChildren: [
            ...OrderByOption.values.map((option) => MenuItemButton(
                leadingIcon: Icon(
                  Icons.filter_list,
                  color: color.onSurfaceVariant,
                ),
                onPressed: () => controller.setOrderByOption(option),
                child: Text(
                  option.optionString,
                  style: text.labelMedium?.copyWith(
                    color: color.onSurfaceVariant,
                  ),
                )))
          ],
          builder: (context, controller, child) => ActionChip(
            elevation: 5,
            onPressed: () =>
                controller.isOpen ? controller.close() : controller.open(),
            avatar: Icon(Icons.filter_list, color: color.onSurfaceVariant),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: color.onSurfaceVariant)),
            label: Text(
              state.orderByOption.optionString,
              style: text.labelMedium?.copyWith(
                color: color.onSurface,
              ),
            ),
          ),
        ),
      ),
    );
  }

//endregion
//region TabAll
  Widget _tabAll() {
    final state = ref.watch(listControllerProvider);
    final controller = ref.watch(listControllerProvider.notifier);
    return CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
      SliverList(
        delegate: SliverChildBuilderDelegate(
            childCount: state.filteringTask.length,
            (context, index) => Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                  child: TaskItem(
                    task: state.filteringTask[index],
                    onDelete: _showDialogConfirmDeleteTask,
                    onCheck: controller.onCheck,
                    onEdit: _showBottomSheetEditTask,
                    onSubtaskCheck: controller.onSubtaskCheck,
                    onSubtaskDelete: controller.onSubtaskDelete,
                  ),
                )),
      ),
    ]);
  }

  //endregion
//region Tab Pending
  Widget _tabPending() {
    final state = ref.watch(listControllerProvider);
    final controller = ref.watch(listControllerProvider.notifier);
    return CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
      SliverList(
        delegate: SliverChildBuilderDelegate(
            childCount: state.filteringPendingTask.length,
            (context, index) => Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                  child: TaskItem(
                    task: state.filteringPendingTask[index],
                    onDelete: _showDialogConfirmDeleteTask,
                    onCheck: controller.onCheck,
                    onEdit: _showBottomSheetEditTask,
                    onSubtaskCheck: controller.onSubtaskCheck,
                    onSubtaskDelete: controller.onSubtaskDelete,
                  ),
                )),
      ),
    ]);
  }

//endregion
//region TabScheduled
  Widget _tabScheduled() {
    final state = ref.watch(listControllerProvider);
    final controller = ref.watch(listControllerProvider.notifier);
    return CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
      SliverList(
        delegate: SliverChildBuilderDelegate(
            childCount: state.filteringScheduledTask.length,
            (context, index) => Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                  child: TaskItem(
                    task: state.filteringScheduledTask[index],
                    onDelete: _showDialogConfirmDeleteTask,
                    onCheck: controller.onCheck,
                    onEdit: _showBottomSheetEditTask,
                    onSubtaskCheck: controller.onSubtaskCheck,
                    onSubtaskDelete: controller.onSubtaskDelete,
                  ),
                )),
      ),
    ]);
  }

//endregion
//region TabCompleted
  Widget _tabCompleted() {
    final state = ref.watch(listControllerProvider);
    final controller = ref.watch(listControllerProvider.notifier);
    return CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
      SliverList(
        delegate: SliverChildBuilderDelegate(
            childCount: state.filteringCompletedTask.length,
            (context, index) => Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                  child: TaskItem(
                    task: state.filteringCompletedTask[index],
                    onDelete: _showDialogConfirmDeleteTask,
                    onCheck: controller.onCheck,
                    onEdit: _showBottomSheetEditTask,
                    onSubtaskCheck: controller.onSubtaskCheck,
                    onSubtaskDelete: controller.onSubtaskDelete,
                  ),
                )),
      ),
    ]);
  }
//endregion
}
