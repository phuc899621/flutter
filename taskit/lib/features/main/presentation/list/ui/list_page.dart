import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:taskit/config/app/app_color.dart';
import 'package:taskit/shared/presentation/widget/taskit_choice_chip.dart';
import 'package:taskit/shared/presentation/widget/taskit_list_item.dart';

import '../../../../shared/presentation/widget/taskit_calendar.dart';
import '../../../list/presentation/controller/list_controller.dart';

class ListPage extends ConsumerStatefulWidget {
  const ListPage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ListPage();
}

class _ListPage extends ConsumerState<ListPage> {
  bool isFirstUpdate = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateFirstTask();
    });
  }

  void _updateFirstTask() async {
    if (isFirstUpdate) {
      await ref.read(listControllerProvider.notifier).onFirstUpdateTasks();
      isFirstUpdate = false;
    }
  }

  void _updateTask() async {
    if (!isFirstUpdate) {
      await ref.read(listControllerProvider.notifier).updateTasks();
    }
  }

  @override
  Widget build(BuildContext context) {
    _listener();
    final state = ref.watch(listControllerProvider);
    final tasks = state.tasks;
    final controller = ref.read(listControllerProvider.notifier);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/create_task');
        },
        backgroundColor: AppColor(context).primary,
        elevation: 8.0,
        child: Icon(
          Icons.add_rounded,
          color: AppColor(context).onSurface,
          size: 24.0,
        ),
      ),
      appBar: AppBar(
        backgroundColor: AppColor(context).primary,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              'Task List',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontFamily: 'Inter Tight',
                    color: AppColor(context).onSurface,
                    letterSpacing: 0.0,
                  ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search_rounded,
              color: AppColor(context).onSurface,
              size: 24.0,
            ),
            onPressed: () {
              print('IconButton pressed ...');
            },
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.keyboard_control,
              color: AppColor(context).onSurface,
              size: 24.0,
            ),
          )
        ],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: SafeArea(
        top: true,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: AppColor(context).secondaryContainer,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 16.0),
                      SizedBox(
                        width: double.infinity,
                        child: TaskitWeekCalendar(
                          onDateSelected: (DateTime date) async {
                            controller.setSelectedDate(date);
                            _updateTask();
                          },
                        ),
                      ),
                      const SizedBox(height: 12.0),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 12.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Today\'s Task',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                    fontFamily: 'Inter Tight',
                                    letterSpacing: 0.0,
                                    color: AppColor(context).primaryText,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12.0),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              child: TaskitChoiceChip(
                                  options: const [
                                    "Pending",
                                    "In Progress",
                                    "Completed"
                                  ],
                                  value: "Pending",
                                  onChanged: (value) async {
                                    controller.setSelectedStatus(value);
                                    _updateTask();
                                  })),
                        ),
                      ),
                      const SizedBox(height: 12.0),
                      ListView.builder(
                          itemCount: tasks.length,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            final item = tasks[index];
                            return TaskitItem(
                              model: item,
                              onChanged: (model, status) {
                                controller.updateTaskStatus(model.id, status);
                              },
                            );
                          },
                          padding: EdgeInsets.zero)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _listener() {
    ref.listen(listControllerProvider.select((value) => value.error),
        (_, next) {
      if (next != null) {
        print("${next}errrrrrrrrror");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next),
            backgroundColor: AppColor(context).error,
            duration: const Duration(seconds: 2),
          ),
        );
      }
    });
    ref.listen(listControllerProvider.select((value) => value.selectedDate),
        (_, next) {
      if (next != null) {
        final time = next.toIso8601String();
        print("${time}selectedDate");
      }
    });
    ref.listen(listControllerProvider.select((value) => value.selectedStatus),
        (_, next) {
      if (next != null) {
        print("${next}selectedStatus");
      }
    });
  }
}
