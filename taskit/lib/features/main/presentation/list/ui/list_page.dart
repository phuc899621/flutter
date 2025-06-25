import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:taskit/features/main/presentation/home/ui/widget/task_item.dart';
import 'package:taskit/features/main/presentation/list/controller/search_text_controller.dart';

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
          appBar: AppBar(
            title: const Text('List Page'),
            titleTextStyle: text.headlineSmall,
            actionsPadding: EdgeInsets.only(right: 10),
            actions: [
              FilledButton.tonalIcon(
                onPressed: () {},
                label: Text(
                  'Filter',
                  style: text.titleSmall?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: color.onPrimaryContainer),
                ),
                style: ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll(color.primaryContainer)),
                icon: Icon(
                  Icons.tune_rounded,
                  color: color.onPrimaryContainer,
                ),
              ),
            ],
          ),
          body: SafeArea(
              child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                color: color.surfaceContainerLow,
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
              Container(
                color: color.surfaceContainerLow,
                width: double.infinity,
                child: TabBar(
                  dragStartBehavior: DragStartBehavior.down,
                  tabAlignment: TabAlignment.start,
                  isScrollable: true,
                  dividerColor: Colors.transparent,
                  physics: const BouncingScrollPhysics(),
                  labelColor: color.onPrimaryContainer,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  labelPadding: const EdgeInsets.symmetric(horizontal: 15),
                  splashBorderRadius: BorderRadius.circular(15),
                  labelStyle:
                      text.labelLarge?.copyWith(fontWeight: FontWeight.w600),
                  unselectedLabelColor: color.onSurfaceVariant,
                  unselectedLabelStyle: text.labelLarge,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: color.primaryContainer),
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: [
                    Tab(
                      text: 'All',
                    ),
                    Tab(
                      text: 'Pending',
                    ),
                    Tab(
                      text: 'Scheduled',
                    ),
                    Tab(
                      text: 'Completed',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Expanded(
                child: TabBarView(children: [
                  //====================================================
                  //==================== ALL ===========================
                  //====================================================
                  Column(mainAxisSize: MainAxisSize.max, children: [
                    SizedBox(
                        height: 25,
                        child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                '${state.filteringTask.length} results',
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
                        itemCount: state.filteringTask.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: TaskItem(
                            task: state.filteringTask[index],
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
              ),
            ],
          ))),
    );
  }
}
