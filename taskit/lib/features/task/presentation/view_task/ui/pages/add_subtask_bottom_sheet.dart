import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AddSubtaskBottomSheet extends ConsumerStatefulWidget {
  final String title;
  final String? initialValue;
  final String? Function(String?) validator;

  final Function(String) onConfirm;

  const AddSubtaskBottomSheet({
    super.key,
    required this.title,
    this.initialValue,
    required this.validator,
    required this.onConfirm,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddSubtaskBottomSheetState();
}

class _AddSubtaskBottomSheetState extends ConsumerState<AddSubtaskBottomSheet> {
  late final TextEditingController _controller;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final color = Theme.of(context).colorScheme;
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: color.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
                      widget.title,
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
                      if (_formKey.currentState?.validate() ?? false) {
                        widget.onConfirm(_controller.text);
                        Navigator.pop(context);
                      }
                    },
                    child: Text(
                      'Confirm',
                      style: TextStyle(color: color.onPrimary),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              TextFormField(
                controller: _controller,
                autofocus: true,
                maxLength: 20,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  hintText: 'Enter subtask',
                  filled: true,
                  fillColor: color.surfaceContainerHighest.withOpacity(0.3),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                validator: widget.validator,
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
