import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:taskit/features/main/presentation/home/ui/widget/task_item.dart';
import 'package:taskit/features/main/presentation/list/controller/search_text_controller.dart';
import 'package:taskit/features/task/domain/entities/order_option_enum.dart';
import 'package:taskit/shared/extension/enum.dart';

import '../controller/list_controller.dart';

class ListPage extends ConsumerStatefulWidget {
  const ListPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ListPageState();
}

class _ListPageState extends ConsumerState<ListPage> {
  void _showBottomSheetEditTask(int localId) {
    context.push('/edit_task', extra: localId);
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    final controller = ref.watch(listControllerProvider.notifier);
    final state = ref.watch(listControllerProvider);
    final textController = ref.watch(searchControllerProvider);
    return DefaultTabController(
      length: 4,
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
          body: SafeArea(
              top: true,
              child: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  SliverAppBar(
                    pinned: true,
                    floating: true,
                    backgroundColor: color.primary,
                    toolbarHeight: 70,
                    title: Text('List Page'),
                    titleTextStyle: text.headlineSmall,
                    actions: [
                      FilledButton.tonalIcon(
                        onPressed: () {
                          context.push('/filter');
                        },
                        label: Text(
                          'Filter ${state.isFiltering ? 'On' : 'Off'}',
                          style: text.titleSmall?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: state.isFiltering
                                  ? color.primary
                                  : color.onPrimaryContainer),
                        ),
                        style: ButtonStyle(
                            elevation: WidgetStatePropertyAll(2),
                            backgroundColor: WidgetStatePropertyAll(
                                state.isFiltering
                                    ? color.surfaceContainerLow
                                    : color.primaryContainer)),
                        icon: Icon(
                          Icons.tune_outlined,
                          color: state.isFiltering
                              ? color.primary
                              : color.onPrimaryContainer,
                        ),
                      ),
                    ],
                  ),
                  SliverAppBar(
                    toolbarHeight: 70,
                    pinned: false,
                    floating: true,
                    snap: true,
                    backgroundColor: color.primary,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        child: TextField(
                            autofocus: false,
                            maxLines: 1,
                            controller: textController.getOrCreateController(),
                            onTapOutside: (result) =>
                                FocusScope.of(context).unfocus(),
                            onChanged: (text) {
                              controller.setSearchText(text);
                              controller.callUpdateFilteringTask();
                            },
                            textCapitalization: TextCapitalization.sentences,
                            style: text.bodyMedium?.copyWith(
                                color: color.onSurface,
                                fontWeight: FontWeight.w500),
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
                              suffixIcon: textController
                                      .getOrCreateController()
                                      .text
                                      .isNotEmpty
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
                                  : null,
                            )),
                      ),
                    ),
                  ),
                  SliverAppBar(
                      pinned: true,
                      expandedHeight: 120,
                      toolbarHeight: 120,
                      backgroundColor: color.surfaceContainerLow,
                      flexibleSpace: FlexibleSpaceBar(
                        background: Container(
                          color: color.surfaceContainerLow,
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TabBar(
                                dragStartBehavior: DragStartBehavior.down,
                                tabAlignment: TabAlignment.start,
                                isScrollable: true,
                                dividerColor: Colors.transparent,
                                physics: const BouncingScrollPhysics(),
                                labelColor: color.onPrimaryContainer,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                labelPadding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                splashBorderRadius: BorderRadius.circular(15),
                                labelStyle: text.labelLarge
                                    ?.copyWith(fontWeight: FontWeight.w600),
                                unselectedLabelColor: color.onSurfaceVariant,
                                unselectedLabelStyle: text.labelLarge,
                                indicator: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: color.primaryContainer),
                                indicatorSize: TabBarIndicatorSize.tab,
                                tabs: [
                                  Tab(
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                              text: 'All',
                                              style: text.labelLarge?.copyWith(
                                                  fontWeight: FontWeight.w500,
                                                  color: color
                                                      .onPrimaryContainer)),
                                          TextSpan(
                                              text:
                                                  ' (${state.filteringTask.length})',
                                              style: text.labelLarge?.copyWith(
                                                fontWeight: FontWeight.w500,
                                                color: color.onSurfaceVariant,
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Tab(
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                              text: 'Pending',
                                              style: text.labelLarge?.copyWith(
                                                  fontWeight: FontWeight.w500,
                                                  color: color
                                                      .onPrimaryContainer)),
                                          TextSpan(
                                              text:
                                                  ' (${state.filteringPendingTask.length})',
                                              style: text.labelLarge?.copyWith(
                                                fontWeight: FontWeight.w500,
                                                color: color.onSurfaceVariant,
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Tab(
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                              text: 'Scheduled',
                                              style: text.labelLarge?.copyWith(
                                                  fontWeight: FontWeight.w500,
                                                  color: color
                                                      .onPrimaryContainer)),
                                          TextSpan(
                                              text:
                                                  ' (${state.filteringScheduledTask.length})',
                                              style: text.labelLarge?.copyWith(
                                                fontWeight: FontWeight.w500,
                                                color: color.onSurfaceVariant,
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Tab(
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                              text: 'Completed',
                                              style: text.labelLarge?.copyWith(
                                                  fontWeight: FontWeight.w500,
                                                  color: color
                                                      .onPrimaryContainer)),
                                          TextSpan(
                                              text:
                                                  ' (${state.filteringCompletedTask.length})',
                                              style: text.labelLarge?.copyWith(
                                                fontWeight: FontWeight.w500,
                                                color: color.onSurfaceVariant,
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height: 50,
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: MenuAnchor(
                                    alignmentOffset: Offset(0, 0),
                                    menuChildren: [
                                      ...OrderByOption.values.map((option) =>
                                          MenuItemButton(
                                              leadingIcon: Icon(
                                                Icons.filter_list,
                                                color: color.onSurfaceVariant,
                                              ),
                                              onPressed: () => controller
                                                  .setOrderByOption(option),
                                              child: Text(
                                                option.optionString,
                                                style:
                                                    text.labelMedium?.copyWith(
                                                  color: color.onSurfaceVariant,
                                                ),
                                              )))
                                    ],
                                    builder: (context, controller, child) =>
                                        ActionChip(
                                      elevation: 5,
                                      onPressed: () => controller.isOpen
                                          ? controller.close()
                                          : controller.open(),
                                      avatar: Icon(Icons.filter_list,
                                          color: color.onSurfaceVariant),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          side: BorderSide(
                                              color: color.onSurfaceVariant)),
                                      label: Text(
                                        state.orderByOption.optionString,
                                        style: text.labelMedium?.copyWith(
                                          color: color.onSurface,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                ],
                body: TabBarView(children: [
                  //====================================================
                  //==================== ALL ===========================
                  //====================================================
                  CustomScrollView(
                      physics: const BouncingScrollPhysics(),
                      slivers: [
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                              childCount: state.filteringTask.length,
                              (context, index) => Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16, right: 16, bottom: 12),
                                    child: TaskItem(
                                      task: state.filteringTask[index],
                                      onDelete: controller.onDelete,
                                      onCheck: controller.onCheck,
                                      onEdit: _showBottomSheetEditTask,
                                      onSubtaskCheck: controller.onSubtaskCheck,
                                      onSubtaskDelete:
                                          controller.onSubtaskDelete,
                                    ),
                                  )),
                        ),
                      ]),
                  //====================================================
                  //==================== PENDING ===========================
                  //====================================================
                  Column(mainAxisSize: MainAxisSize.max, children: [
                    SizedBox(
                        height: 25,
                        child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                '${state.filteringPendingTask.length} results',
                                style: text.labelLarge?.copyWith(
                                    color: color.onSurfaceVariant,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                            ])),
                    Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) => SizedBox(
                          height: 15,
                        ),
                        itemCount: state.filteringPendingTask.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: TaskItem(
                            task: state.filteringPendingTask[index],
                            onDelete: controller.onDelete,
                            onCheck: controller.onCheck,
                            onEdit: _showBottomSheetEditTask,
                            onSubtaskCheck: controller.onSubtaskCheck,
                            onSubtaskDelete: controller.onSubtaskDelete,
                          ),
                        ),
                      ),
                    ),
                  ]),
                  //====================================================
                  //==================SCHEDULED ===========================
                  //====================================================
                  Column(mainAxisSize: MainAxisSize.max, children: [
                    SizedBox(
                        height: 25,
                        child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                '${state.filteringScheduledTask.length} results',
                                style: text.labelLarge?.copyWith(
                                    color: color.onSurfaceVariant,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                            ])),
                    Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) => SizedBox(
                          height: 15,
                        ),
                        itemCount: state.filteringScheduledTask.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: TaskItem(
                            task: state.filteringScheduledTask[index],
                            onDelete: controller.onDelete,
                            onCheck: controller.onCheck,
                            onEdit: _showBottomSheetEditTask,
                            onSubtaskCheck: controller.onSubtaskCheck,
                            onSubtaskDelete: controller.onSubtaskDelete,
                          ),
                        ),
                      ),
                    ),
                  ]),
                  //====================================================
                  //===================COMPLETED =======================
                  //====================================================
                  Column(mainAxisSize: MainAxisSize.max, children: [
                    SizedBox(
                        height: 25,
                        child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                '${state.filteringCompletedTask.length} results',
                                style: text.labelLarge?.copyWith(
                                    color: color.onSurfaceVariant,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                            ])),
                    Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) => SizedBox(
                          height: 15,
                        ),
                        itemCount: state.filteringCompletedTask.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: TaskItem(
                            task: state.filteringCompletedTask[index],
                            onDelete: controller.onDelete,
                            onCheck: controller.onCheck,
                            onEdit: _showBottomSheetEditTask,
                            onSubtaskCheck: controller.onSubtaskCheck,
                            onSubtaskDelete: controller.onSubtaskDelete,
                          ),
                        ),
                      ),
                    ),
                  ]),
                ]),
              ))),
    );
  }
}
