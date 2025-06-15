import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:taskit/features/task/domain/entities/task_priority_enum.dart';
import 'package:taskit/features/task/presentation/add_task/controller/add_task_controller.dart';
import 'package:taskit/features/task/presentation/add_task/ui/widget/add_task_appbar.dart';
import 'package:taskit/features/task/presentation/add_task/ui/widget/add_task_fab.dart';
import 'package:taskit/shared/extension/color.dart';
import 'package:taskit/shared/extension/date_time.dart';
import 'package:taskit/shared/log/logger_provider.dart';

class AddTaskPage extends ConsumerStatefulWidget {
  const AddTaskPage({super.key});

  @override
  ConsumerState<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends ConsumerState<AddTaskPage> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _dueDateController = TextEditingController();
  final _dueTimeController = TextEditingController();
  final _formState = GlobalKey<FormState>();
  final _focusTitleNode = FocusNode();
  final _focusDescriptionNode = FocusNode();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _titleController.addListener(() {
      if (_titleController.text != ref.read(addTaskControllerProvider).title) {
        ref
            .read(addTaskControllerProvider.notifier)
            .setTitle(_titleController.text);
        if (_timer?.isActive ?? false) {
          _timer?.cancel();
          logger.i('_titleController.text: ${_titleController.text}');
          _timer = Timer(const Duration(seconds: 2), () {
            final currentTitle = _titleController.text;
            if (currentTitle.length < 5) return;
            ref
                .read(addTaskControllerProvider.notifier)
                .updateAiCategory(currentTitle);
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(addTaskControllerProvider);
    final controller = ref.watch(addTaskControllerProvider.notifier);
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    _dueTimeController.addListener(() {
      if (_dueTimeController.text.isEmpty) {
        controller.removeSelectedTime();
      }
    });
    _dueDateController.addListener(() {
      if (_dueDateController.text.isEmpty) {
        controller.removeSelectedDate();
        _dueTimeController.clear();
      }
    });
    _descriptionController.addListener(() {
      controller.setDescription(_descriptionController.text);
    });
    return Stack(
      alignment: Alignment.center,
      children: [
        Scaffold(
          floatingActionButton: AddTaskFab(
            onPressed: () {
              final result = _formState.currentState?.validate() ?? false;
              if (!result) return;
              controller.addTask();
            },
          ),
          appBar: AddTaskAppBar(),
          body: SafeArea(
              child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Form(
                key: _formState,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /*
                      * Title
                      * */
                      TextFormField(
                        controller: _titleController,
                        maxLines: 1,
                        maxLength: 35,
                        focusNode: _focusTitleNode,
                        autofocus: false,
                        onTapOutside: (event) =>
                            FocusScope.of(context).unfocus(),
                        style: text.bodyLarge,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a title';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          suffixIcon: state.title.isNotEmpty
                              ? IconButton(
                                  onPressed: _titleController.clear,
                                  icon: Icon(Icons.clear_rounded,
                                      color: color.onSurfaceVariant))
                              : null,
                          labelStyle: text.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: color.onSurface),
                          label: Text('Title'),
                          filled: true,
                          fillColor: color.surfaceContainer,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: color.outlineVariant)),
                        ),
                      ),
                      /*
                      *
                      * Priority
                      *
                      * */
                      Text(
                        'Priority',
                        style: text.titleMedium,
                      ),
                      SizedBox(
                        height: 50,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: TaskPriority.values.length,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Theme(
                              data: ThemeData(
                                splashColor: TaskPriority.values[index]
                                    .toColorContainer(),
                              ),
                              child: ChoiceChip(
                                  label: Text(TaskPriority.values[index].name),
                                  elevation: 1,
                                  showCheckmark: false,
                                  checkmarkColor:
                                      TaskPriority.values[index].toColor(),
                                  selectedColor: TaskPriority.values[index]
                                      .toColorContainer(),
                                  labelStyle: text.labelMedium?.copyWith(
                                      color: state.selectedPriority ==
                                              TaskPriority.values[index]
                                          ? TaskPriority.values[index].toColor()
                                          : color.onSurfaceVariant,
                                      fontWeight: state.selectedPriority ==
                                              TaskPriority.values[index]
                                          ? FontWeight.w600
                                          : FontWeight.w500),
                                  selected: state.selectedPriority ==
                                      TaskPriority.values[index],
                                  onSelected: (value) =>
                                      controller.setSelectedPriority(
                                          TaskPriority.values[index])),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Category',
                        style: text.titleMedium,
                      ),
                      SizedBox(
                        height: 50,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.categories.length,
                          itemBuilder: (context, index) => Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Theme(
                                data: ThemeData(
                                  splashColor: color.secondaryContainer,
                                ),
                                child: ChoiceChip(
                                  label: Text(state.categories[index].name),
                                  elevation: 1,
                                  showCheckmark: false,
                                  selectedColor: color.secondaryContainer,
                                  labelStyle: text.labelMedium?.copyWith(
                                      color: state.categories[index] ==
                                              state.selectedCategory
                                          ? color.onSecondaryContainer
                                          : color.onSurfaceVariant,
                                      fontWeight: state.categories[index] ==
                                              state.selectedCategory
                                          ? FontWeight.w600
                                          : FontWeight.w500),
                                  selected: state.categories[index] ==
                                      state.selectedCategory,
                                  onSelected: (value) =>
                                      controller.setSelectedCategory(
                                          state.categories[index]),
                                ),
                              )),
                        ),
                      ),
                      /*
                      * Category AI
                      * */
                      if (state.isCategoriesLoading ||
                          state.aiCategories.isNotEmpty)
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            /*
                          * Category AI suggest*/
                            SizedBox(
                              height: 50,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: state.aiCategories.length,
                                itemBuilder: (context, index) => Padding(
                                    padding: EdgeInsets.only(right: 10),
                                    child: Theme(
                                      data: ThemeData(
                                        splashColor: color.secondaryContainer,
                                      ),
                                      child: ChoiceChip(
                                        label: Row(spacing: 5, children: [
                                          Icon(
                                            Icons.auto_awesome_rounded,
                                            color: color.onSecondaryContainer,
                                          ),
                                          Text(state.aiCategories[index].name)
                                        ]),
                                        elevation: 1,
                                        showCheckmark: false,
                                        selectedColor: color.secondaryContainer,
                                        labelStyle: text.labelMedium?.copyWith(
                                            color: state.aiCategories[index] ==
                                                    state.selectedCategory
                                                ? color.onSecondaryContainer
                                                : color.onSurfaceVariant,
                                            fontWeight:
                                                state.aiCategories[index] ==
                                                        state.selectedCategory
                                                    ? FontWeight.w600
                                                    : FontWeight.w500),
                                        selected: state.aiCategories[index] ==
                                            state.selectedCategory,
                                        onSelected: (value) =>
                                            controller.setSelectedCategory(
                                                state.aiCategories[index]),
                                      ),
                                    )),
                              ),
                            ),
                            if (state.isCategoriesLoading)
                              Positioned.fill(
                                  child: Center(
                                      child: CircularProgressIndicator(
                                strokeWidth: 2,
                              )))
                          ],
                        ),
                      const SizedBox(
                        height: 20,
                      ),
                      /*
                      *
                      * Date and time
                      * */
                      Row(
                        spacing: 10,
                        children: [
                          /*
                          * Due Date
                          * */
                          Expanded(
                              child: Column(children: [
                            Material(
                              elevation: 2,
                              borderRadius: BorderRadius.circular(15),
                              color: color.secondaryContainer,
                              child: GestureDetector(
                                onTap: () {
                                  _focusTitleNode.unfocus();
                                  _focusDescriptionNode.unfocus();
                                  FocusScope.of(context).unfocus();
                                  showDatePicker(
                                    context: context,
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.now()
                                        .add(const Duration(days: 365)),
                                  ).then((value) {
                                    controller.setSelectedDate(value);
                                    _dueDateController.text =
                                        value?.toFormatDate() ?? '';
                                  });
                                },
                                child: Container(
                                    width: double.infinity,
                                    height: 60,
                                    padding: EdgeInsets.fromLTRB(10, 3, 3, 6),
                                    decoration: BoxDecoration(
                                        color: color.secondaryContainer,
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border(
                                            bottom: BorderSide(
                                                width: 3,
                                                color: color.secondary))),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Due date',
                                                style: text.titleSmall?.copyWith(
                                                    fontSize: 11,
                                                    fontWeight: FontWeight.w500,
                                                    color: color
                                                        .onSecondaryContainer),
                                              ),
                                              _dueDateController.text.isEmpty
                                                  ? Text(
                                                      'Not set',
                                                      style: text.bodyMedium
                                                          ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: color
                                                            .onSecondaryContainer,
                                                      ),
                                                    )
                                                  : Text(
                                                      _dueDateController.text,
                                                      style: text.bodyMedium
                                                          ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: color
                                                            .onSecondaryContainer,
                                                      ),
                                                    ),
                                            ],
                                          ),
                                          if (_dueDateController
                                              .text.isNotEmpty)
                                            IconButton(
                                                onPressed:
                                                    _dueDateController.clear,
                                                icon: Icon(Icons.clear_rounded,
                                                    color: color
                                                        .onSecondaryContainer))
                                        ])),
                              ),
                            ),
                          ])),
                          /*
                        * Due time
                        *
                        * */
                          Expanded(
                              child: Column(children: [
                            Material(
                              elevation: 2,
                              borderRadius: BorderRadius.circular(15),
                              color: color.tertiaryContainer,
                              child: Opacity(
                                opacity: state.selectedDate == null ? 0.5 : 1,
                                child: AbsorbPointer(
                                  absorbing: state.selectedDate == null,
                                  child: GestureDetector(
                                    onTap: () {
                                      _focusTitleNode.unfocus();
                                      _focusDescriptionNode.unfocus();
                                      FocusScope.of(context).unfocus();
                                      showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now(),
                                      ).then((value) {
                                        controller.setSelectedTime(value);
                                        _dueTimeController.text =
                                            value?.toTimeFormat() ?? '';
                                      });
                                    },
                                    child: Container(
                                        width: double.infinity,
                                        height: 60,
                                        padding:
                                            EdgeInsets.fromLTRB(10, 3, 3, 6),
                                        decoration: BoxDecoration(
                                            color: color.tertiaryContainer,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border: Border(
                                                bottom: BorderSide(
                                                    width: 3,
                                                    color: color.tertiary))),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Due time',
                                                    style: text.titleSmall
                                                        ?.copyWith(
                                                            fontSize: 11,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: color
                                                                .onTertiaryContainer),
                                                  ),
                                                  _dueTimeController
                                                          .text.isEmpty
                                                      ? Text(
                                                          'Not set',
                                                          style: text.bodyMedium
                                                              ?.copyWith(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: color
                                                                .onTertiaryContainer,
                                                          ),
                                                        )
                                                      : Text(
                                                          _dueTimeController
                                                              .text,
                                                          style: text.bodyMedium
                                                              ?.copyWith(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: color
                                                                .onTertiaryContainer,
                                                          ),
                                                        ),
                                                ],
                                              ),
                                              if (_dueTimeController
                                                  .text.isNotEmpty)
                                                IconButton(
                                                    onPressed:
                                                        _dueTimeController
                                                            .clear,
                                                    icon: Icon(
                                                        Icons.clear_rounded,
                                                        color: color
                                                            .onSecondaryContainer))
                                            ])),
                                  ),
                                ),
                              ),
                            ),
                          ])),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      /*
                      * Description
                      * */
                      TextFormField(
                        controller: _descriptionController,
                        maxLines: 3,
                        maxLength: 60,
                        focusNode: _focusDescriptionNode,
                        autofocus: false,
                        onTapOutside: (event) =>
                            FocusScope.of(context).unfocus(),
                        style: text.bodyMedium,
                        decoration: InputDecoration(
                          suffixIcon: _descriptionController.text.isNotEmpty
                              ? IconButton(
                                  onPressed: _descriptionController.clear,
                                  icon: Icon(Icons.clear_rounded,
                                      color: color.onSurfaceVariant))
                              : null,
                          labelStyle: text.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: color.onSurface),
                          label: const Text('Description'),
                          filled: true,
                          fillColor: color.surfaceContainer,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: color.outlineVariant)),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Subtask',
                        style: text.titleMedium,
                      ),
                      const SizedBox(
                        height: 200,
                      )
                    ]),
              ),
            ),
          )),
        ),
        if (state.isLoading)
          Positioned.fill(
            child: Container(
              color: Colors.black.withAlpha(50),
              child: Center(
                child: LoadingAnimationWidget.inkDrop(
                  color: color.primary,
                  size: 80,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
