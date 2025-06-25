import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TaskitOutlineTextField extends ConsumerWidget {
  final String labelText;
  final TextEditingController controller;
  final String autofillHints;
  final TextInputType keyboardType;

  const TaskitOutlineTextField({
    super.key,
    required this.labelText,
    required this.controller,
    required this.autofillHints,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    return TextFormField(
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
      controller: controller,
      autofocus: true,
      autofillHints: [autofillHints],
      obscureText: false,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: text.labelSmall,
        alignLabelWithHint: false,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: color.primaryContainer,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: color.primary,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: color.error,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: color.primary,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        filled: true,
        fillColor: color.secondaryContainer,
      ),
      style: text.bodySmall?.copyWith(color: color.onSurface),
      keyboardType: keyboardType,
    );
  }
}

class TaskitOutLineTextFieldWithPassword extends ConsumerStatefulWidget {
  final String labelText;
  final TextEditingController controller;

  const TaskitOutLineTextFieldWithPassword({
    super.key,
    required this.labelText,
    required this.controller,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TaskitOutLineTextFieldWithPasswordState();
}

class _TaskitOutLineTextFieldWithPasswordState
    extends ConsumerState<TaskitOutLineTextFieldWithPassword> {
  bool _obscureText = true;

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    return TextFormField(
      controller: widget.controller,
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
      autofocus: true,
      autofillHints: const [AutofillHints.password],
      obscureText: _obscureText,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: text.labelSmall,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: color.secondaryContainer,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: color.primary,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: color.error,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: color.primary,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        filled: true,
        fillColor: color.secondaryContainer,
        suffixIcon: InkWell(
          onTap: () => _toggleObscureText(),
          focusNode: FocusNode(skipTraversal: true),
          child: Icon(
            _obscureText
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
            color: color.onSurfaceVariant,
            size: 24.0,
          ),
        ),
      ),
      style: text.bodySmall?.copyWith(
        fontFamily: 'Inter',
        letterSpacing: 0.0,
        color: color.onSurface,
      ),
    );
  }
}

class TaskitCodeTextField extends ConsumerWidget {
  final TextEditingController controller;

  const TaskitCodeTextField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    return Center(
      child: TextFormField(
        textAlign: TextAlign.center,
        controller: controller,
        onTapOutside: (_) => FocusScope.of(context).unfocus(),
        autofocus: true,
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        obscureText: false,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 20),
          labelStyle: text.labelMedium,
          hintStyle: text.labelMedium,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.surface,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: color.primary,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: color.error,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: color.primary,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          filled: true,
          fillColor: color.secondaryContainer,
        ),
        style: text.labelLarge,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        buildCounter: (context,
                {required currentLength, required isFocused, maxLength}) =>
            null,
        keyboardType: TextInputType.number,
        cursorColor: color.onPrimary,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(1),
        ],
      ),
    );
  }
}
