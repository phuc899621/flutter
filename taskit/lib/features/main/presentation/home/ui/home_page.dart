import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/main/presentation/home/controller/home_controller.dart';
import 'package:taskit/features/main/presentation/home/ui/widget/scheduled_task.dart';

import '../../../../../config/app/app_color.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeControllerProvider);
    final controller = ref.watch(homeControllerProvider.notifier);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          backgroundColor: AppColor(context).secondaryContainer,
          body: SafeArea(
              top: true,
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    collapsedHeight: 100,
                    expandedHeight: 150,
                    toolbarHeight: 100,
                    backgroundColor: AppColor(context).primary,
                    flexibleSpace: FlexibleSpaceBar(
                        background: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 12),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                RichText(
                                  text: TextSpan(
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium
                                          ?.copyWith(
                                            color: AppColor(context).onPrimary,
                                            letterSpacing: 0.0,
                                          ),
                                      children: const [
                                        TextSpan(
                                          text: 'Hello, ',
                                        ),
                                        TextSpan(text: 'Phuc')
                                      ]),
                                ),
                                Text(
                                  'Thursday 8th, 2025',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                          color: AppColor(context).onPrimary),
                                )
                              ],
                            ),
                            Row(
                              spacing: 10,
                              children: [
                                IconButton(
                                    onPressed: () => {},
                                    color: AppColor(context).onPrimary,
                                    icon: const Icon(
                                      Icons.search_outlined,
                                      size: 35,
                                    )),
                                IconButton(
                                    color: AppColor(context).onPrimary,
                                    onPressed: () => {},
                                    icon: const Icon(
                                      size: 35,
                                      Icons.notifications_none,
                                    )),
                              ],
                            )
                          ]),
                    )),
                  ),
                  SliverAppBar(
                    collapsedHeight: 180,
                    toolbarHeight: 180,
                    backgroundColor: AppColor(context).primary,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 8),
                            child: Material(
                              elevation: 5,
                              color: Colors.transparent,
                              child: Container(
                                  height: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColor(context).primaryContainer,
                                  ),
                                  child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Center(
                                                child: Text(
                                                  '8',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headlineLarge
                                                      ?.copyWith(
                                                        color: AppColor(context)
                                                            .onPrimary,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              'Today\'s home',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall
                                                  ?.copyWith(
                                                    color: AppColor(context)
                                                        .onPrimary,
                                                  ),
                                            )
                                          ]))),
                            ),
                          ),
                          Expanded(
                            child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 8),
                                    child: Material(
                                      elevation: 5,
                                      color: Colors.transparent,
                                      child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color:
                                                  AppColor(context).errorLight),
                                          width: double.infinity,
                                          height: 70,
                                          child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              child: Row(
                                                  spacing: 20,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      '2',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge
                                                          ?.copyWith(
                                                            color: AppColor(
                                                                    context)
                                                                .onPrimary,
                                                          ),
                                                    ),
                                                    Text(
                                                      'Upcoming deadlines',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleSmall
                                                          ?.copyWith(
                                                            color: AppColor(
                                                                    context)
                                                                .onPrimary,
                                                          ),
                                                    )
                                                  ]))),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 8),
                                    child: Material(
                                      color: Colors.transparent,
                                      elevation: 5,
                                      child: Container(
                                          width: double.infinity,
                                          height: 70,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: AppColor(context).medium,
                                          ),
                                          child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              child: Row(
                                                  spacing: 20,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      '8',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge
                                                          ?.copyWith(
                                                            color: AppColor(
                                                                    context)
                                                                .onPrimary,
                                                          ),
                                                    ),
                                                    Text(
                                                      'On going tasks',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleSmall
                                                          ?.copyWith(
                                                            color: AppColor(
                                                                    context)
                                                                .onPrimary,
                                                          ),
                                                    )
                                                  ]))),
                                    ),
                                  ),
                                ]),
                          )
                        ],
                      ),
                    ),
                  ),
                  SliverAppBar(
                    collapsedHeight: 90,
                    toolbarHeight: 90,
                    pinned: true,
                    backgroundColor: AppColor(context).primary,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 20),
                        child: Container(
                            decoration: BoxDecoration(
                                color: AppColor(context).primaryBackground,
                                borderRadius: BorderRadius.circular(10)),
                            padding: const EdgeInsets.all(4.0),
                            child: TabBar(
                              dividerColor: Colors.transparent,
                              indicatorColor: AppColor(context).primary,
                              labelColor: AppColor(context).onPrimary,
                              unselectedLabelColor:
                                  AppColor(context).secondaryText,
                              indicator: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColor(context).primaryContainer),
                              indicatorSize: TabBarIndicatorSize.tab,
                              tabs: [
                                Tab(
                                  text: 'Today',
                                ),
                                Tab(
                                  text: 'To Do',
                                ),
                                Tab(
                                  text: 'Deadlines',
                                )
                              ],
                            )),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                      child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                    child: Text(
                      'Tasks',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppColor(context).primaryText,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
                  SliverList(
                      delegate: SliverChildBuilderDelegate(
                    (context, index) => ScheduledTaskItem(
                      task: state.scheduledTasks[index],
                      onDelete: () => debugPrint('delete'),
                      onCheck: () => debugPrint('check'),
                      onClick: () => debugPrint('click'),
                    ),
                    childCount: state.scheduledTasks.length,
                  )),
                  SliverFillRemaining(
                    hasScrollBody: false,
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
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(
                                    color: AppColor(context).primaryText),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Keep adding and managing your home',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                    color: AppColor(context).secondaryText),
                          ),
                          const SizedBox(
                            height: 200,
                          ),
                        ]),
                  ),
                ],
              ))),
    );
  }
}
