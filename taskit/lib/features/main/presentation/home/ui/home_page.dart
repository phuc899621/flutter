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

class _HomePageState extends ConsumerState<HomePage>
    with TickerProviderStateMixin {
  List<String> categories = ['ds', 'dsa'];
  @override
  Widget build(BuildContext context) {
    final tabController = TabController(length: categories.length, vsync: this);
    final state = ref.watch(homeControllerProvider);
    final controller = ref.watch(homeControllerProvider.notifier);
    return DefaultTabController(
      length: 6,
      child: Scaffold(
          backgroundColor: AppColor(context).secondaryContainer,
          body: SafeArea(
              top: true,
              child: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) => [
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
                    collapsedHeight: 90,
                    toolbarHeight: 90,
                    pinned: true,
                    backgroundColor: AppColor(context).secondaryBackground,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 20),
                        child: Container(
                            decoration: BoxDecoration(
                                color: AppColor(context).secondaryBackground,
                                borderRadius: BorderRadius.circular(20)),
                            padding: const EdgeInsets.all(10.0),
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
                                  text: 'Pending',
                                ),
                                Tab(
                                  text: 'Scheduled',
                                ),
                                Tab(
                                  text: 'Completed',
                                ),
                              ],
                            )),
                      ),
                    ),
                  ),
                ],
                body: TabBarView(
                  children: [
                    CustomScrollView(
                      slivers: [
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
                                          color:
                                              AppColor(context).secondaryText),
                                ),
                                const SizedBox(
                                  height: 200,
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ],
                ),
              ))),
    );
  }
}
