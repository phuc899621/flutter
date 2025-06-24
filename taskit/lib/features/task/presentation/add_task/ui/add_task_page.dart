import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:taskit/features/task/domain/entities/task_priority_enum.dart';
import 'package:taskit/features/task/presentation/add_task/controller/add_task_controller.dart';
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
  final _categoryController = TextEditingController();
  final _formState = GlobalKey<FormState>();
  final _categoryFormState = GlobalKey<FormState>();
  final _focusTitleNode = FocusNode();
  final _focusDescriptionNode = FocusNode();
  final List<TextEditingController> _subtaskControllers = [];
  final _scrollController = ScrollController();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _titleController.addListener(() {
      if (_titleController.text != ref.read(addTaskControllerProvider).title) {
        ref
            .read(addTaskControllerProvider.notifier)
            .setTitle(_titleController.text);

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
    });
  }

  void _listener() {
    ref.listen(
        addTaskControllerProvider.select((value) => value.isCreateTaskSuccess),
        (_, next) {
      Navigator.of(context).pop();
    });
  }

  void _showAddCategoryDialog() {
    final text = Theme.of(context).textTheme;
    final color = Theme.of(context).colorScheme;
    final state = ref.read(addTaskControllerProvider);
    final controller = ref.read(addTaskControllerProvider.notifier);
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              titleTextStyle: text.titleLarge?.copyWith(
                  color: color.onSurface, fontWeight: FontWeight.bold),
              title: Text('Add category'),
              content: Form(
                key: _categoryFormState,
                child: TextFormField(
                  controller: _categoryController,
                  maxLines: 1,
                  maxLength: 20,
                  autofocus: false,
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  style: text.bodyMedium?.copyWith(color: color.onSurface),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter category';
                    }
                    if (value.length < 3) {
                      return '3 characters at least';
                    }
                    if (state.categories.any((element) =>
                        element.name.toLowerCase().trim() ==
                        value.toLowerCase().trim())) {
                      return 'Category already exists';
                    }
                    return null;
                  },
                  onChanged: (_) =>
                      controller.setAddCategory(_categoryController.text),
                  decoration: InputDecoration(
                    errorStyle: TextStyle(
                      color: color.onError,
                      fontWeight: FontWeight.w600,
                    ),
                    suffixIcon: state.addCategory.isNotEmpty
                        ? IconButton(
                            onPressed: _categoryController.clear,
                            icon: Icon(Icons.clear_rounded,
                                color: color.onSurfaceVariant))
                        : null,
                    hintText: 'Enter category:',
                    hintStyle: text.bodyMedium?.copyWith(
                        color: color.onSurfaceVariant,
                        fontWeight: FontWeight.w500),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Cancel')),
                TextButton(
                    onPressed: () {
                      if (_categoryFormState.currentState?.validate() ??
                          false) {
                        controller.onAddCategory();
                        _categoryController.clear();
                        Navigator.pop(context);
                      }
                    },
                    child: Text('Add'))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    _listener();
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

    return Stack(
      alignment: Alignment.center,
      children: [
        Scaffold(
          appBar: AppBar(
              automaticallyImplyLeading: false,
              centerTitle: true,
              actionsPadding: EdgeInsets.all(8),
              actions: [
                IconButton(
                  onPressed: () {
                    if (_formState.currentState?.validate() ?? false) {
                      controller.addTask();
                    }
                  },
                  icon: Icon(
                    Icons.save,
                    size: 30,
                  ),
                )
              ],
              leading: Navigator.canPop(context)
                  ? IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.arrow_back,
                        size: 25,
                        color: color.onPrimary,
                      ),
                    )
                  : null,
              backgroundColor: color.primary,
              title: Text(
                'Add Task',
                style: text.headlineMedium,
              )),
          body: SafeArea(
              child: SingleChildScrollView(
            controller: _scrollController,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
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
                              hintStyle: text.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: color.onSurface),
                              hintText: 'Title',
                              filled: true,
                              fillColor: color.surfaceContainer,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: color.primary, width: 2),
                                borderRadius: BorderRadius.circular(10),
                              ))),
                      //=========================================
                      //================= Priority ==============
                      //=========================================
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
                      SizedBox(
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Category',
                              style: text.titleMedium,
                            ),
                            IconButton(
                                onPressed: _showAddCategoryDialog,
                                icon: Icon(
                                  Icons.add_circle,
                                  color: color.onSurfaceVariant,
                                  size: 30,
                                ))
                          ],
                        ),
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
                        onChanged: (_) => controller
                            .setDescription(_descriptionController.text),
                        focusNode: _focusDescriptionNode,
                        autofocus: false,
                        onTapOutside: (event) {
                          FocusScope.of(context).unfocus();
                        },
                        style: text.bodyMedium,
                        decoration: InputDecoration(
                            suffixIcon: _descriptionController.text.isNotEmpty
                                ? IconButton(
                                    onPressed: _descriptionController.clear,
                                    icon: Icon(Icons.clear_rounded,
                                        color: color.onSurfaceVariant))
                                : null,
                            hintStyle: text.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: color.onSurface),
                            hintText: 'Description',
                            filled: true,
                            fillColor: color.surfaceContainer,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: color.primary, width: 2),
                              borderRadius: BorderRadius.circular(10),
                            )),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      if (state.subtasks.isNotEmpty)
                        Text(
                          'Subtask',
                          style: text.titleMedium,
                        ),
                      ListView.builder(
                        itemCount: state.subtasks.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Theme(
                            data: ThemeData(
                              splashColor: color.error,
                            ),
                            child: Material(
                                elevation: 2,
                                borderRadius: BorderRadius.circular(10),
                                color: color.surface,
                                child: Container(
                                  height: 55,
                                  width: double.infinity,
                                  padding: EdgeInsets.only(right: 5),
                                  child: Row(spacing: 10, children: [
                                    Container(
                                      width: 10,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                          color: color.secondary,
                                          borderRadius: BorderRadius.horizontal(
                                              left: Radius.circular(10))),
                                    ),
                                    Expanded(
                                      child: TextField(
                                        controller: _subtaskControllers[index],
                                        onChanged: (_) {
                                          controller.onSubtaskInputSubmit(index,
                                              _subtaskControllers[index].text);
                                        },
                                        autofocus: false,
                                        onTapOutside: (event) {
                                          FocusScope.of(context).unfocus();
                                        },
                                        style: text.bodyMedium?.copyWith(
                                            color: color.onSurface,
                                            fontWeight: FontWeight.w500),
                                        decoration: InputDecoration(
                                            hintText: 'Input subtask title',
                                            hintStyle: text.bodyMedium
                                                ?.copyWith(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color:
                                                        color.onSurfaceVariant),
                                            counterText: '',
                                            border: InputBorder.none),
                                      ),
                                    ),
                                    Container(
                                        width: 35,
                                        height: 35,
                                        decoration: BoxDecoration(
                                            color: color.error,
                                            shape: BoxShape.circle),
                                        child: Center(
                                          child: IconButton(
                                            padding: EdgeInsets.zero,
                                            onPressed: () {
                                              _subtaskControllers
                                                  .removeAt(index);
                                              controller.onDeleteSubtask(index);
                                            },
                                            icon: Icon(
                                              Icons.delete_forever,
                                              color: color.onError,
                                              size: 25,
                                            ),
                                          ),
                                        )),
                                  ]),
                                )),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 55,
                        child: Stack(
                          children: [
                            Center(
                              child: Container(
                                color: color.outline.withAlpha(70),
                                height: 3,
                              ),
                            ),
                            Center(
                              child: Container(
                                width: 150,
                                height: 45,
                                color: color.surface,
                                child: Center(
                                  child: Theme(
                                    data: ThemeData(
                                        splashColor:
                                            color.onSecondaryContainer),
                                    child: Material(
                                      elevation: 2,
                                      borderRadius: BorderRadius.circular(10),
                                      child: GestureDetector(
                                          onTap: () {
                                            _subtaskControllers
                                                .add(TextEditingController());
                                            controller.addSubtask();
                                            _scrollController.animateTo(
                                                _scrollController
                                                    .position.maxScrollExtent,
                                                duration:
                                                    Duration(milliseconds: 400),
                                                curve: Curves.easeOut);
                                          },
                                          child: Container(
                                              height: 40,
                                              width: 120,
                                              decoration: BoxDecoration(
                                                  color: color.secondary,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Center(
                                                child: Row(
                                                  spacing: 10,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.add_circle,
                                                      color: color.onSecondary,
                                                      size: 20,
                                                    ),
                                                    Text(
                                                      'Subtask',
                                                      style: text.titleSmall
                                                          ?.copyWith(
                                                              color: color
                                                                  .onSecondary,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                    ),
                                                  ],
                                                ),
                                              ))),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
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
