import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:taskit/features/task/presentation/add_task/controller/add_task_controller.dart';
import 'package:taskit/features/task/presentation/add_task/state/add_task_state.dart';
import 'package:taskit/features/task/presentation/add_task/ui/widgets/task_description_input.dart';
import 'package:taskit/features/task/presentation/add_task/ui/widgets/task_priority_picker.dart';
import 'package:taskit/features/task/presentation/add_task/ui/widgets/task_subtask_section.dart';
import 'package:taskit/features/task/presentation/add_task/ui/widgets/task_title_input.dart';
import 'package:taskit/shared/log/logger_provider.dart';
import 'package:taskit/shared/utils/snack_bar_utils.dart';

import '../widgets/task_category_picker.dart';
import '../widgets/task_date_time_picker.dart';

class AddTaskPage extends ConsumerStatefulWidget {
  const AddTaskPage({super.key});

  @override
  ConsumerState<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends ConsumerState<AddTaskPage> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _formState = GlobalKey<FormState>();
  final _focusTitleNode = FocusNode();
  final _focusDescriptionNode = FocusNode();
  final _scrollController = ScrollController();

  void _listener() {
    ref.listen(addTaskControllerProvider.select((value) => value.status), (
      _,
      next,
    ) {
      if (next == AddTaskStatus.createSuccess) {
        Navigator.of(context).pop();
      }
    });
    ref.listen(addTaskControllerProvider.select((value) => value.apiError), (
      _,
      next,
    ) {
      if (next != null) {
        SnackBarUtils.show(context, next, isError: true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _listener();
    final state = ref.watch(addTaskControllerProvider);
    final controller = ref.watch(addTaskControllerProvider.notifier);
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return Stack(
      alignment: Alignment.center,
      children: [
        Scaffold(
          backgroundColor: color.surface,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            actionsPadding: EdgeInsets.all(8),
            leading: context.canPop()
                ? IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back, color: color.onPrimary),
                  )
                : null,
            backgroundColor: color.primary,
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
            ),
            title: Text('Add Task', style: text.headlineMedium),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              controller: _scrollController,
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Form(
                key: _formState,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 15,
                  children: [
                    SizedBox(height: 15),
                    TaskTitleInput(
                      controller: _titleController,
                      focusNode: _focusTitleNode,
                    ),
                    TaskPriorityPicker(),
                    TaskCategoryPicker(),
                    if (state.status == AddTaskStatus.aiLoading ||
                        state.aiCategories.isNotEmpty)
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          /*
                        * Category AI suggest*/
                          /*
                          Wrap(
                            children: [
                              ...state.aiCategories.map(
                                (category) => Padding(
                                    padding: EdgeInsets.only(right: 10),
                                    child: Theme(
                                      data: ThemeData(
                                        splashColor: color.secondaryContainer,
                                      ),
                                      child: ChoiceChip(
                                        label: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            spacing: 5,
                                            children: [
                                              Icon(
                                                Icons.auto_awesome_rounded,
                                                color:
                                                    color.onSecondaryContainer,
                                              ),
                                              Text(category.name)
                                            ]),
                                        elevation: 1,
                                        showCheckmark: false,
                                        selectedColor: color.secondaryContainer,
                                        labelStyle: text.labelMedium?.copyWith(
                                            color: category ==
                                                    state.selectedCategory
                                                ? color.onSecondaryContainer
                                                : color.onSurfaceVariant,
                                            fontWeight: category ==
                                                    state.selectedCategory
                                                ? FontWeight.w600
                                                : FontWeight.w500),
                                        selected:
                                            category == state.selectedCategory,
                                        onSelected: (value) => controller
                                            .setSelectedCategory(category),
                                      ),
                                    )),
                              ),
                            ],
                          ),
                          if (state.isCategoriesLoading)
                            Positioned.fill(
                                child: Center(
                                    child: CircularProgressIndicator(
                              strokeWidth: 2,
                            )))
                        ],
                      ),*/
                        ],
                      ),
                    TaskDueDateTimePicker(),
                    TaskDescriptionInput(
                      controller: _descriptionController,
                      focusNode: _focusDescriptionNode,
                    ),
                    TaskSubtasksSection(scrollController: _scrollController),
                    const SizedBox(height: 150),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 20,
          right: 20,
          child: ElevatedButton(
            onPressed: () {
              logger.d('Create task');
              if (_formState.currentState?.validate() ?? false) {
                controller.addTask(
                  _titleController.text,
                  _descriptionController.text,
                );
              }
            },
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(color.primary),
              elevation: WidgetStateProperty.all(2),
            ),
            child: Text(
              'Create',
              style: text.titleMedium?.copyWith(
                color: color.onPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        if (state.status == AddTaskStatus.addLoading)
          Positioned.fill(
            child: Container(
              color: Colors.black.withAlpha(50),
              child: Center(
                child: LoadingAnimationWidget.inkDrop(
                  color: color.onPrimary,
                  size: 80,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
