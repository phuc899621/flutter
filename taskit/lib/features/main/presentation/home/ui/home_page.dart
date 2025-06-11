import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../../config/app/app_color.dart';

class TaskPage extends ConsumerStatefulWidget {
  const TaskPage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TaskPageState();
}

class _TaskPageState extends ConsumerState<TaskPage> {
  int selectedIndex = 0;
  List<bool> checkedIndexs = List<bool>.generate(10, (i) => false);
  final categories = List<String>.generate(10, (index) => "Cate $index");
  final tasks = List<String>.generate(10, (index) => "Task $index");
  final expandedIndexs = List<bool>.generate(10, (index) => false);

  @override
  Widget build(BuildContext context) {
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
                                              'Today\'s task',
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tasks',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                                  color: AppColor(context).primaryText,
                                  fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          child: Card(
                            clipBehavior: Clip.hardEdge,
                            color: AppColor(context).secondaryBackground,
                            child: Slidable(
                              endActionPane: ActionPane(
                                  extentRatio: 0.3,
                                  motion: const StretchMotion(),
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                          color: AppColor(context)
                                              .errorLight
                                              .withValues(alpha: 0.4),
                                          borderRadius:
                                              const BorderRadius.horizontal(
                                                  right: Radius.circular(10)),
                                        ),
                                        child: Expanded(
                                            child: Icon(
                                                size: 30,
                                                color:
                                                    AppColor(context).onError,
                                                Icons.delete_outline)),
                                      ),
                                    )
                                  ]),
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        spacing: 10,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            'Do homework',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium
                                                ?.copyWith(
                                                    color: AppColor(context)
                                                        .primaryText),
                                          ),
                                          Row(
                                            spacing: 10,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.horizontal(
                                                          right:
                                                              Radius.circular(
                                                                  10)),
                                                  color: AppColor(context)
                                                      .primary
                                                      .withValues(alpha: 0.2),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      vertical: 4,
                                                      horizontal: 8),
                                                  child: Row(
                                                    spacing: 5,
                                                    children: [
                                                      const Icon(
                                                        Icons.category_outlined,
                                                        size: 15,
                                                        color:
                                                            ConstColor.primary,
                                                      ),
                                                      Text(
                                                        'School',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .labelMedium
                                                            ?.copyWith(
                                                                color: AppColor(
                                                                        context)
                                                                    .primary,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Icon(
                                                size: 22,
                                                Icons.flag_outlined,
                                                color: Colors.red,
                                              ),
                                            ],
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.horizontal(
                                                        right: Radius.circular(
                                                            10)),
                                                color: AppColor(context)
                                                    .secondaryText
                                                    .withValues(alpha: 0.2)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 4,
                                                      horizontal: 8),
                                              child: Row(
                                                spacing: 5,
                                                children: [
                                                  const Icon(
                                                    Icons.schedule_outlined,
                                                    size: 15,
                                                    color: ConstColor
                                                        .secondaryText,
                                                  ),
                                                  Text(
                                                    'Any time',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelMedium
                                                        ?.copyWith(
                                                            color: AppColor(
                                                                    context)
                                                                .secondaryText,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Checkbox(
                                        value: true,
                                        onChanged: (b) => {},
                                        side: BorderSide(),
                                      )
                                    ]),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
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
                            'Keep adding and managing your task',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                    color: AppColor(context).secondaryText),
                          ),
                          SizedBox(
                            height: 200,
                          ),
                        ]),
                  ),
                ],
              ))),
    );
  }
}
