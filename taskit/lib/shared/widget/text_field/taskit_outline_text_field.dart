import 'package:flutter/material.dart';
import 'package:taskit/shared/widget/text_field/taskit_input_decoration.dart';

class TaskitOutlineTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final Iterable<String> autofillHints;
  final TextInputType keyboardType;
  final String? errorText;
  final bool autoFocus;
  final GlobalKey<FormFieldState>? formKey;

  final ValueChanged<String>? onChanged;
  final bool enable;
  final FormFieldValidator<String>? validator;

  const TaskitOutlineTextField({
    super.key,
    this.formKey,
    required this.labelText,
    this.errorText,
    required this.controller,
    required this.autofillHints,
    required this.keyboardType,
    this.autoFocus = false,
    this.onChanged,
    this.enable = true,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    return TextFormField(
      controller: controller,
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
      autofocus: autoFocus,
      autofillHints: autofillHints,
      keyboardType: keyboardType,
      onChanged: onChanged,
      enabled: enable,
      obscureText: false,
      validator: validator,
      decoration: TaskitInputDecoration.outlined(
        color: color,
        text: text,
        labelText: labelText,
        errorText: errorText,
      ),
      style: text.bodySmall?.copyWith(color: color.onSurface),
    );
  }
}
