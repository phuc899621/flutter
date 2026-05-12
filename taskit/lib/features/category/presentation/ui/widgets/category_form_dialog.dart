import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryFormDialog extends ConsumerStatefulWidget {
  final String title;
  final String? initialValue;
  final String? Function(String?) validator;

  final Function(String) onConfirm;

  const CategoryFormDialog({
    super.key,
    required this.title,
    this.initialValue,
    required this.validator,
    required this.onConfirm,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CategoryFormDialogState();
}

class _CategoryFormDialogState extends ConsumerState<CategoryFormDialog> {
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
    return AlertDialog(
      backgroundColor: color.surface,
      title: Text(widget.title),
      titleTextStyle: text.titleLarge?.copyWith(
        color: color.onSurface,
        fontWeight: FontWeight.w600,
      ),
      content: Form(
        key: _formKey,
        child: TextFormField(
          controller: _controller,
          autofocus: true,
          maxLength: 20,
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            hintText: 'Enter category name',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
          validator: widget.validator,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: () {
            if (_formKey.currentState?.validate() ?? false) {
              widget.onConfirm(_controller.text);
              Navigator.pop(context);
            }
          },
          child: const Text('Confirm'),
        ),
      ],
    );
  }
}
