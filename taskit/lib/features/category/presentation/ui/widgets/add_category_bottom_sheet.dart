import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddCategoryBottomSheet extends ConsumerStatefulWidget {
  final String title;
  final String? initialValue;
  final String? Function(String?) validator;

  final Function(String) onConfirm;

  const AddCategoryBottomSheet({
    super.key,
    required this.title,
    this.initialValue,
    required this.validator,
    required this.onConfirm,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddCategoryBottomSheetState();
}

class _AddCategoryBottomSheetState
    extends ConsumerState<AddCategoryBottomSheet> {
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
                  Text(
                    widget.title,
                    style: text.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
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
              ),
              const SizedBox(height: 20),

              TextFormField(
                controller: _controller,
                autofocus: true,
                maxLength: 20,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  hintText: 'Enter category name',
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
