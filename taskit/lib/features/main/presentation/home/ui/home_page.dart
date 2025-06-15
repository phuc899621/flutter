import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:taskit/features/main/presentation/home/controller/home_controller.dart';
import 'package:taskit/features/main/presentation/home/ui/widget/task_item.dart';

import '../../../../../config/app/app_color.dart';
import '../../../../../config/app/text_theme.dart';

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
    final text = ref.read(textStyleProvider(context));
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            floatingActionButton: FloatingActionButton(
                child: Icon(
                  Icons.add_circle,
                  size: 35,
                  color: color.onSurface,
                ),
                onPressed: () => context.push('/add_task')),
            backgroundColor: color.onSurface,
            body: SafeArea(
              top: true,
              child: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  SliverAppBar(
                    collapsedHeight: 100,
                    expandedHeight: 150,
                    toolbarHeight: 100,
                    backgroundColor: color.primary,
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
                                      style: text.headlineMedium,
                                      children: const [
                                        TextSpan(
                                          text: 'Hello, ',
                                        ),
                                        TextSpan(text: 'Phuc')
                                      ]),
                                ),
                                Text(
                                  'Thursday 8th, 2025',
                                  style: text.titleMedium
                                      ?.copyWith(color: color.onPrimary),
                                )
                              ],
                            ),
                            Row(
                              spacing: 10,
                              children: [
                                IconButton(
                                    onPressed: () => {},
                                    color: color.onPrimary,
                                    icon: const Icon(
                                      Icons.search_outlined,
                                      size: 35,
                                    )),
                                IconButton(
                                    color: color.onPrimary,
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
                    backgroundColor: color.onSurface,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 20),
                        child: Container(
                            decoration: BoxDecoration(
                                color: color.primary.withAlpha(20),
                                borderRadius: BorderRadius.circular(20)),
                            padding: const EdgeInsets.all(10.0),
                            child: TabBar(
                              dividerColor: Colors.transparent,
                              indicatorColor: color.primary,
                              labelColor: color.onPrimary,
                              unselectedLabelColor: color.onSurfaceVariant,
                              indicator: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: color.primaryContainer),
                              indicatorSize: TabBarIndicatorSize.tab,
                              tabs: const [
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
                    CustomScrollView(slivers: [
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                            childCount: state.scheduledTasks.length,
                            (context, index) => TaskItem(
                                task: state.scheduledTasks[index],
                                onDelete: () => debugPrint('delete'),
                                onCheck: () => controller.onCheck(
                                    state.scheduledTasks[index].localId),
                                onEdit: (localId) => controller.onEdit(localId),
                                onSubtaskCheck: (localId) =>
                                    controller.onSubtaskCheck(localId))),
                      )
                    ]),
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
                              style: text.headlineMedium
                                  ?.copyWith(color: color.onSurface),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Keep adding and managing your home',
                              style: text.titleMedium
                                  ?.copyWith(color: color.onSurfaceVariant),
                            ),
                            const SizedBox(
                              height: 200,
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
            )));
  }
}
