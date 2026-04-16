import 'package:flutter/material.dart';
import 'package:taskit/shared/widget/text_field/taskit_input_decoration.dart';

class TaskitPasswordTextField extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;
  final String? errorText;
  final bool autofocus;
  final FormFieldValidator<String>? validator;
  final AutovalidateMode? autovalidateMode;
  final ValueChanged<String>? onChanged;
  final GlobalKey<FormFieldState>? formKey;

  const TaskitPasswordTextField({
    super.key,
    this.formKey,
    required this.labelText,
    required this.controller,
    this.errorText,
    this.autofocus = false,
    this.validator,
    this.autovalidateMode,
    this.onChanged,
  });

  @override
  State<TaskitPasswordTextField> createState() =>
      _TaskitPasswordTextFieldState();
}

class _TaskitPasswordTextFieldState extends State<TaskitPasswordTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return TextFormField(
      key: widget.formKey,
      controller: widget.controller,
      autofocus: widget.autofocus,
      autofillHints: const [AutofillHints.password],
      obscureText: _obscureText,
      onChanged: widget.onChanged,
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
      validator: widget.validator,
      decoration: TaskitInputDecoration.outlined(
        color: color,
        text: text,
        labelText: widget.labelText,
        errorText: widget.errorText,
        suffixIcon: IconButton(
          onPressed: () => setState(() => _obscureText = !_obscureText),
          icon: Icon(
            _obscureText
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
            color: color.onSurfaceVariant,
          ),
        ),
      ),
      style: text.bodySmall?.copyWith(color: color.onSurface),
    );
  }
}
