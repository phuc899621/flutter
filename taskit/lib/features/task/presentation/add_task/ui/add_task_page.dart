import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:taskit/config/app/app_color.dart';
import 'package:taskit/features/task/domain/entities/task_priority_enum.dart';
import 'package:taskit/features/task/presentation/add_task/controller/add_task_controller.dart';
import 'package:taskit/shared/extension/color.dart';
import 'package:taskit/shared/extension/date_time.dart';
import 'package:taskit/shared/extension/string.dart';
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
      if (_titleController.text != ref
          .read(addTaskControllerProvider)
          .title) {
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
    final text = Theme
        .of(context)
        .textTheme;
    final color = Theme
        .of(context)
        .colorScheme;
    final state = ref.read(addTaskControllerProvider);
    final controller = ref.read(addTaskControllerProvider.notifier);
    showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(
              backgroundColor: color.surface,
              titleTextStyle: text.titleLarge?.copyWith(
                  color: color.onSurface, fontWeight: FontWeight.w600),
              title: Text('Add category'),
              content: Form(
                key: _categoryFormState,
                child: TextFormField(
                  textCapitalization: TextCapitalization.sentences,
                  controller: _categoryController,
                  maxLines: 1,
                  maxLength: 20,
                  autofocus: false,
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  style: text.bodyMedium?.copyWith(
                      color: color.onSurface, fontWeight: FontWeight.w500),
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
                    counterText: '',
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
              actionsPadding:
              EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              actions: [
                FilledButton.tonal(
                    onPressed: () => Navigator.pop(context),
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                          color.outlineVariant.withAlpha(50)),
                    ),
                    child: Text(
                      'Cancel',
                      style: text.titleSmall?.copyWith(
                          color: ConstColor.onSurfaceVariant,
                          fontWeight: FontWeight.w600),
                    )),
                FilledButton.tonal(
                    style: ButtonStyle(
                      backgroundColor:
                      WidgetStateProperty.all(color.primaryContainer),
                    ),
                    onPressed: () {
                      if (_categoryFormState.currentState?.validate() ??
                          false) {
                        controller.onAddCategory();
                        _categoryController.clear();
                        Navigator.pop(context);
                      }
                    },
                    child: Text(
                      'Add',
                      style: text.titleSmall?.copyWith(
                          color: ConstColor.onPrimaryContainer,
                          fontWeight: FontWeight.w600),
                    ))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    _listener();
    final state = ref.watch(addTaskControllerProvider);
    final controller = ref.watch(addTaskControllerProvider.notifier);
    final color = Theme
        .of(context)
        .colorScheme;
    final text = Theme
        .of(context)
        .textTheme;
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
          backgroundColor: color.surface,
          appBar: AppBar(
              automaticallyImplyLeading: false,
              centerTitle: true,
              actionsPadding: EdgeInsets.all(8),
              leading: context.canPop()
                  ? IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.arrow_back,
                  color: color.onPrimary,
                ),
              )
                  : null,
              backgroundColor: color.primary,
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(10),
                ),
              ),
              title: Text(
                'Add Task',
                style: text.headlineMedium,
              )),
          body: SafeArea(
              child: SingleChildScrollView(
                controller: _scrollController,
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Form(
                  key: _formState,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        //===========================================
                        //============== Title ======================
                        //===========================================
                        //region TITLE
                        //endregion
                        Material(
                          elevation: 1,
                          borderRadius: BorderRadius.circular(10),
                          child: TextFormField(
                              textCapitalization: TextCapitalization.sentences,
                              controller: _titleController,
                              maxLines: 1,
                              maxLength: 35,
                              focusNode: _focusTitleNode,
                              autofocus: false,
                              onTapOutside: (event) =>
                                  FocusScope.of(context).unfocus(),
                              style: text.bodyLarge
                                  ?.copyWith(fontWeight: FontWeight.w500),
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
                                      fontWeight: FontWeight.w500,
                                      color: color.onSurfaceVariant),
                                  hintText: 'Title',
                                  counterText: '',
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
                        ),
                        //=========================================
                        //================= Priority ==============
                        //=========================================
                        //region PRIORITY
                        //endregion
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Priority',
                          style: text.titleMedium,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          height: 45,
                          child: Row(
                            children: [
                              ...TaskPriority.values.map(
                                    (priority) =>
                                    Padding(
                                      padding: const EdgeInsets.only(right: 15),
                                      child: Theme(
                                        data: ThemeData(
                                          splashColor: priority
                                              .toColorContainer(),
                                        ),
                                        child: ChoiceChip(
                                            label: Text(
                                                priority.name
                                                    .toUpperFirstLetter()),
                                            elevation: 1,
                                            showCheckmark: false,
                                            side: BorderSide.none,
                                            backgroundColor: color
                                                .surfaceContainer,
                                            selectedColor: priority
                                                .toColorContainer(),
                                            labelStyle: text.labelMedium
                                                ?.copyWith(
                                                color:
                                                state.selectedPriority ==
                                                    priority
                                                    ? priority.toColor()
                                                    : color.onSurfaceVariant,
                                                fontWeight:
                                                state.selectedPriority ==
                                                    priority
                                                    ? FontWeight.w600
                                                    : FontWeight.w500),
                                            selected:
                                            state.selectedPriority == priority,
                                            onSelected: (value) =>
                                                controller
                                                    .setSelectedPriority(
                                                    priority)),
                                      ),
                                    ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        //===========================================
                        //============== Category ===================
                        //===========================================
                        //region CATEGORY
                        //endregion
                        SizedBox(
                          height: 35,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Category',
                                style: text.titleMedium,
                              ),
                              FilledButton.tonalIcon(
                                style: ButtonStyle(
                                  elevation: WidgetStateProperty.all(1),
                                ),
                                onPressed: _showAddCategoryDialog,
                                label: Text(
                                  'Add',
                                  style: text.labelMedium?.copyWith(
                                    color: color.onSecondaryContainer,
                                  ),
                                ),
                                icon: Icon(
                                  Icons.add,
                                  color: color.onSecondaryContainer,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Wrap(
                          children: [
                            ...state.categories.map(
                                  (category) =>
                                  Padding(
                                      padding: EdgeInsets.only(right: 10),
                                      child: Theme(
                                        data: ThemeData(
                                          splashColor: color.secondaryContainer,
                                        ),
                                        child: ChoiceChip(
                                          label: Text(category.name),
                                          elevation: 1,
                                          showCheckmark: false,
                                          selectedColor: color
                                              .secondaryContainer,
                                          labelStyle: text.labelMedium
                                              ?.copyWith(
                                              color: category ==
                                                  state.selectedCategory
                                                  ? color.onSecondaryContainer
                                                  : color.onSurfaceVariant,
                                              fontWeight:
                                              category == state.selectedCategory
                                                  ? FontWeight.w600
                                                  : FontWeight.w500),
                                          selected: category ==
                                              state.selectedCategory,
                                          onSelected: (value) =>
                                              controller.setSelectedCategory(
                                                  category),
                                        ),
                                      )),
                            ),
                          ],
                        ),
                        /*SizedBox(
                      height: 5,
                    ),
                    //===========================================
                    //=============== CATEGORY AI ===============
                    //===========================================
                    //region CATEGORY AI
                    //endregion
                    if (state.isCategoriesLoading ||
                        state.aiCategories.isNotEmpty)
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          */ /*
                        * Category AI suggest*/ /*
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
                        const SizedBox(
                          height: 25,
                        ),
                        //=======================================
                        //============= Due Date ================
                        //=======================================
                        //region DUEDATE
                        //endregion
                        Row(
                          spacing: 10,
                          children: [
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
                                              value
                                                  ?.formatToRelativeDateString() ??
                                                  '';
                                        });
                                      },
                                      child: Container(
                                          width: double.infinity,
                                          height: 60,
                                          padding: EdgeInsets.fromLTRB(
                                              10, 3, 3, 6),
                                          decoration: BoxDecoration(
                                              color: color.secondaryContainer,
                                              borderRadius: BorderRadius
                                                  .circular(15),
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Due date',
                                                      style: text.titleSmall
                                                          ?.copyWith(
                                                          fontSize: 11,
                                                          fontWeight: FontWeight
                                                              .w500,
                                                          color: color
                                                              .onSecondaryContainer),
                                                    ),
                                                    _dueDateController.text
                                                        .isEmpty
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
                                                if (_dueDateController.text
                                                    .isNotEmpty)
                                                  IconButton(
                                                      onPressed:
                                                      _dueDateController.clear,
                                                      icon: Icon(
                                                          Icons.clear_rounded,
                                                          color: color
                                                              .onSecondaryContainer))
                                              ])),
                                    ),
                                  ),
                                ])),
                            Expanded(
                                child: Column(children: [
                                  Material(
                                    elevation: 2,
                                    borderRadius: BorderRadius.circular(15),
                                    color: color.tertiaryContainer,
                                    child: Opacity(
                                      opacity: state.selectedDate == null
                                          ? 0.5
                                          : 1,
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
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 3, 3, 6),
                                              decoration: BoxDecoration(
                                                  color: color
                                                      .tertiaryContainer,
                                                  borderRadius:
                                                  BorderRadius.circular(15),
                                                  border: Border(
                                                      bottom: BorderSide(
                                                          width: 3,
                                                          color: color
                                                              .tertiary))),
                                              child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  mainAxisSize: MainAxisSize
                                                      .max,
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
                                                        _dueTimeController.text
                                                            .isEmpty
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
                                                              Icons
                                                                  .clear_rounded,
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
                          height: 25,
                        ),

                        //============================================
                        //================ DESCRIPTION ===============
                        //============================================
                        //region DESCRIPTION
                        //endregion
                        Material(
                          elevation: 1,
                          borderRadius: BorderRadius.circular(10),
                          child: TextFormField(
                            controller: _descriptionController,
                            maxLines: 3,
                            maxLength: 60,
                            onChanged: (_) =>
                                controller
                                    .setDescription(
                                    _descriptionController.text),
                            focusNode: _focusDescriptionNode,
                            autofocus: false,
                            onTapOutside: (event) {
                              FocusScope.of(context).unfocus();
                            },
                            style:
                            text.bodyMedium?.copyWith(color: color.onSurface),
                            decoration: InputDecoration(
                                suffixIcon: _descriptionController.text
                                    .isNotEmpty
                                    ? IconButton(
                                    onPressed: _descriptionController.clear,
                                    icon: Icon(Icons.clear_rounded,
                                        color: color.onSurfaceVariant))
                                    : null,
                                hintStyle: text.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: color.onSurfaceVariant),
                                hintText: 'Description',
                                filled: true,
                                counterText: '',
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
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 35,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Subtasks',
                                style: text.titleMedium,
                              ),
                              FilledButton.tonalIcon(
                                style: ButtonStyle(
                                  elevation: WidgetStateProperty.all(1),
                                ),
                                onPressed: () {
                                  _subtaskControllers.add(
                                      TextEditingController());
                                  controller.addSubtask();
                                  _scrollController.animateTo(
                                      _scrollController.position
                                          .maxScrollExtent,
                                      duration: Duration(milliseconds: 700),
                                      curve: Curves.easeOut);
                                },
                                label: Text(
                                  'Add',
                                  style: text.labelMedium?.copyWith(
                                    color: color.onSecondaryContainer,
                                  ),
                                ),
                                icon: Icon(
                                  Icons.add,
                                  color: color.onSecondaryContainer,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        ListView.builder(
                          itemCount: state.subtasks.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) =>
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 6),
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
                                                borderRadius: BorderRadius
                                                    .horizontal(
                                                    left: Radius.circular(10))),
                                          ),
                                          Expanded(
                                            child: TextField(
                                              controller: _subtaskControllers[index],
                                              onChanged: (_) {
                                                controller.onSubtaskInputSubmit(
                                                    index,
                                                    _subtaskControllers[index]
                                                        .text);
                                              },
                                              autofocus: false,
                                              onTapOutside: (event) {
                                                FocusScope
                                                    .of(context)
                                                    .unfocus();
                                              },
                                              style: text.bodyMedium?.copyWith(
                                                  color: color.onSurface,
                                                  fontWeight: FontWeight.w500),
                                              decoration: InputDecoration(
                                                  hintText: 'Input subtask title',
                                                  hintStyle: text.bodyMedium
                                                      ?.copyWith(
                                                      fontWeight: FontWeight
                                                          .normal,
                                                      color: color
                                                          .onSurfaceVariant),
                                                  counterText: '',
                                                  border: InputBorder.none),
                                            ),
                                          ),
                                          IconButton(
                                            padding: EdgeInsets.zero,
                                            onPressed: () {
                                              _subtaskControllers.removeAt(
                                                  index);
                                              controller.onDeleteSubtask(index);
                                            },
                                            icon: Icon(
                                              Icons.delete_forever,
                                              color: color.onError,
                                              size: 25,
                                            ),
                                          ),
                                        ]),
                                      )),
                                ),
                              ),
                        ),
                        const SizedBox(
                          height: 200,
                        )
                      ]),
                ),
              )),
        ),
        Positioned(
          bottom: 5,
          left: 20,
          right: 20,
          child: ElevatedButton(
              onPressed: () {
                if (_formState.currentState?.validate() ?? false) {
                  controller.addTask();
                }
              },
              style: ButtonStyle(
                backgroundColor:
                WidgetStateProperty.all(color.primaryContainer),
                textStyle: WidgetStateProperty.all(text.titleMedium?.copyWith(
                    color: color.onPrimaryContainer,
                    fontWeight: FontWeight.w600)),
                elevation: WidgetStateProperty.all(2),
              ),
              child: Text('Add Task')),
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
