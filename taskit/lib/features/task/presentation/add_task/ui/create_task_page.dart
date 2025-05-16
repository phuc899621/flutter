/*
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/config/app/app_color.dart';
import 'package:taskit/features/task/presentation/add_task/ui/widget/add_subtask_widget.dart';
import 'package:taskit/features/task/presentation/add_task/ui/widget/category_choice_chip.dart';
import 'package:taskit/features/task/presentation/add_task/ui/widget/due_date_button.dart';
import 'package:taskit/features/task/presentation/add_task/ui/widget/due_time_button.dart';
import 'package:taskit/features/task/presentation/add_task/ui/widget/priority_choice_chip.dart';

import '../controller/create_task_controller.dart';

class CreateTaskPage extends ConsumerStatefulWidget {
  const CreateTaskPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends ConsumerState<CreateTaskPage> {
  late TextEditingController _titleController;
  Timer? _debounce;
  late TextEditingController _descriptionController;
  final ScrollController _scrollController = ScrollController();
  final List<TextEditingController> subtaskControllers = [
    TextEditingController()
  ];
  final _formKey = GlobalKey<FormState>();
  bool _isFirstLoad = true;
  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _onInputTitleChanged() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(seconds: 3), () {
      ref
          .read(createTaskControllerProvider.notifier)
          .updateAICategories(_titleController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    */
/*final controller = ref.read(createTaskControllerProvider.notifier);
    final state = ref.watch(createTaskControllerProvider);*/ /*

    bool isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_isFirstLoad) {
        controller.initSelectedDate();
        controller.initCategories();
        _isFirstLoad = false;
      }
    });

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColor(context).primaryContainer,
        floatingActionButton: isKeyboardVisible
            ? null
            : FloatingActionButton.extended(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _onSaveTask();
                  }
                },
                label: Text('Save',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColor(context).onPrimary,
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        )),
                backgroundColor: AppColor(context).primary,
                icon: Icon(
                  Icons.save,
                  color: AppColor(context).onPrimary,
                )),
        appBar: AppBar(
          title: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create Task',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppColor(context).onPrimary,
                    fontFamily: 'Inter Tight',
                    letterSpacing: 0.0),
              ),
            ],
          ),
          centerTitle: true,
          backgroundColor: AppColor(context).primary,
          elevation: 5,
          iconTheme: IconThemeData(
            color: AppColor(context).onPrimary,
          ),
          automaticallyImplyLeading: true,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 20, 16, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Form(
                    key: _formKey,
                    child: TextFormField(
                      controller: _titleController,
                      onChanged: (_) => _onInputTitleChanged(),
                      autofocus: true,
                      obscureText: false,
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        labelText: 'Title...',
                        labelStyle: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                                color: AppColor(context).secondaryText,
                                fontFamily: 'Inter Tight',
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w700),
                        hintStyle:
                            Theme.of(context).textTheme.labelMedium?.copyWith(
                                  color: AppColor(context).secondaryText,
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                        errorStyle:
                            Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: AppColor(context).error,
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColor(context).onSurface,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColor(context).primary,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColor(context).error,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        contentPadding: const EdgeInsetsDirectional.fromSTEB(
                            16, 12, 16, 12),
                      ),
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: AppColor(context).primaryText,
                            fontFamily: 'Inter',
                            letterSpacing: 0.0,
                          ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a title';
                        }
                        if (value.length > 50) {
                          return 'Title must be less than 50 characters';
                        }
                        if (value.length < 4) {
                          return 'Title must be more than 5 characters';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _descriptionController,
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Description...',
                      labelStyle: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(
                              color: AppColor(context).secondaryText,
                              fontFamily: 'Inter Tight',
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600),
                      alignLabelWithHint: true,
                      hintStyle:
                          Theme.of(context).textTheme.labelMedium?.copyWith(
                                color: AppColor(context).secondaryText,
                                fontFamily: 'Inter',
                                letterSpacing: 0.0,
                              ),
                      errorStyle:
                          Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: AppColor(context).error,
                                fontFamily: 'Inter',
                                letterSpacing: 0.0,
                              ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColor(context).onSurface,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColor(context).primary,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColor(context).error,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding:
                          const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
                    ),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColor(context).primaryText,
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        ),
                    maxLines: 9,
                    minLines: 5,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Select category',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColor(context).secondaryText,
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const CategoryChoiceChip(),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Selected Priority',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColor(context).secondaryText,
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  PriorityChoiceChip(onPrioritySelected: (value) {
                    controller.setSelectedPriority(value);
                  }),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Due Date',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColor(context).secondaryText,
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DueDateButton(
                      initialDate: state.selectedDate ??
                          DateTime(
                            DateTime.now().year,
                            DateTime.now().month,
                            DateTime.now().day,
                            0,
                            0,
                            0,
                          ),
                      onDateSelected: (year, month, day) {
                        controller.updateSelectedDate(
                            year,
                            month,
                            day,
                            state.selectedDate!.hour,
                            state.selectedDate!.minute);
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  DueTimeButton(
                      initialDate: state.selectedDate ??
                          DateTime(
                            DateTime.now().year,
                            DateTime.now().month,
                            DateTime.now().day,
                            0,
                            0,
                          ),
                      onTimeSelected: (hour, minute) {
                        controller.updateSelectedDate(
                            state.selectedDate!.year,
                            state.selectedDate!.month,
                            state.selectedDate!.day,
                            hour,
                            minute);
                      }),
                  const SizedBox(height: 20),
                  Text(
                    'Add Subtask',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColor(context).secondaryText,
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AddSubtaskWidget(
                    subtaskControllers: state.subtaskControllers,
                    onAddSubtask: _onAddSubtask,
                    onDeleteSubtask: _onDeleteSubtask,
                  ),
                  TextButton.icon(
                    onPressed: _onAddSubtask,
                    label: Text(
                      'Add',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColor(context).secondaryText,
                            fontFamily: 'Inter',
                            letterSpacing: 0.0,
                          ),
                    ),
                    icon: Icon(
                      Icons.add,
                      color: AppColor(context).secondaryText,
                    ),
                  ),
                  const SizedBox(height: 200),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onDeleteSubtask(int index) {
    ref.read(createTaskControllerProvider.notifier).onDeleteSubtask(index);
  }

  void _onAddSubtask() {
    ref.read(createTaskControllerProvider.notifier).onAddSubtask();
  }

  void _onSaveTask() {
    final form = ({
      'title': _titleController.text,
      'description': _descriptionController.text,
    });
    ref.read(createTaskControllerProvider.notifier).setCreateTaskForm(form);
    ref.read(createTaskControllerProvider.notifier).saveTask();
  }
}
*/
