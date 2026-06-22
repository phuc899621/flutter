import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../controller/view_task_controller.dart';

class EditDescriptionBottomSheet extends ConsumerStatefulWidget {
  final String description;

  const EditDescriptionBottomSheet({super.key, required this.description});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditDescriptionBottomSheetState();
}

class _EditDescriptionBottomSheetState
    extends ConsumerState<EditDescriptionBottomSheet> {
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _descriptionController.text = widget.description;
  }

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final color = Theme.of(context).colorScheme;
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
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
                    ref
                        .read(viewTaskControllerProvider.notifier)
                        .updateDescription(_descriptionController.text);
                    context.pop();
                  },
                  child: Text('Save', style: TextStyle(color: color.onPrimary)),
                ),
              ],
            ),
            TextField(
              maxLines: 4,
              maxLength: 100,
              autofocus: true,
              onTapOutside: (event) {
                FocusScope.of(context).unfocus();
              },
              controller: _descriptionController,
              decoration: InputDecoration(
                hint: Text(
                  'description',
                  style: text.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: color.onSurfaceVariant,
                  ),
                ),
                counterText: '',
                border: OutlineInputBorder(borderSide: BorderSide.none),
              ),
              style: text.bodyMedium?.copyWith(
                fontWeight: FontWeight.w400,
                color: color.onSurface,
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
