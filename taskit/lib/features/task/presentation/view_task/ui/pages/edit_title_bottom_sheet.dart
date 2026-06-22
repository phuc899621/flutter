import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../controller/view_task_controller.dart';

class EditTitleBottomSheet extends ConsumerStatefulWidget {
  final String title;

  const EditTitleBottomSheet({super.key, required this.title});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditTitleBottomSheetState();
}

class _EditTitleBottomSheetState extends ConsumerState<EditTitleBottomSheet> {
  final TextEditingController _titleController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.title;
  }

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final color = Theme.of(context).colorScheme;
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: context.pop,
                    icon: Icon(Icons.arrow_back_rounded),
                  ),
                  Center(
                    child: Text(
                      'Edit Title',
                      style: text.titleMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: color.onSurface,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(color.primary),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    onPressed: () {
                      //validate
                      if (!_formKey.currentState!.validate()) return;
                      ref
                          .read(viewTaskControllerProvider.notifier)
                          .updateTitle(_titleController.text);
                      context.pop();
                    },
                    child: Text(
                      'Save',
                      style: TextStyle(color: color.onPrimary),
                    ),
                  ),
                ],
              ),
              TextFormField(
                maxLines: 1,
                maxLength: 35,
                autofocus: true,
                onTapOutside: (event) {
                  FocusScope.of(context).unfocus();
                },
                controller: _titleController,
                validator: (value) {
                  final title = value?.trim() ?? '';
                  return ref
                      .read(viewTaskControllerProvider.notifier)
                      .validateTaskTitle(title);
                },
                decoration: InputDecoration(
                  hint: Text(
                    'Title',
                    style: text.titleLarge?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: color.onSurfaceVariant,
                    ),
                  ),
                  counterText: '',
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                ),
                style: text.titleLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: color.onSurface,
                ),
              ),
              SizedBox(height: 20),
              // TextFormField(
              //   maxLines: 2,
              //   maxLength: 50,
              //   autofocus: false,
              //   onTapOutside: (event) {
              //     FocusScope.of(context).unfocus();
              //   },
              //   controller: _descriptionController,
              //   decoration: InputDecoration(
              //     hint: Text(
              //       'Description',
              //       style: text.bodyMedium?.copyWith(
              //         fontWeight: FontWeight.w400,
              //         color: color.onSurfaceVariant,
              //       ),
              //     ),
              //     counterText: '',
              //     border: OutlineInputBorder(borderSide: BorderSide.none),
              //   ),
              //   style: text.bodyMedium?.copyWith(
              //     fontWeight: FontWeight.w400,
              //     color: color.onSurface,
              //   ),
              //   onChanged: (value) {
              //     logger.i('on description change: $value');
              //     ref
              //         .read(viewTaskControllerProvider.notifier)
              //         .updateDescription(value);
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
