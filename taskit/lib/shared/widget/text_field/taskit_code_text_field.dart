import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'taskit_input_decoration.dart';

class TaskitCodeTextField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;

  const TaskitCodeTextField({
    super.key,
    required this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return TextFormField(
      textAlign: TextAlign.center,
      controller: controller,
      autofocus: true,
      obscureText: false,
      keyboardType: TextInputType.number,
      cursorColor: color.onPrimary,
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
      onChanged: onChanged,
      decoration: TaskitInputDecoration.code(color: color, text: text),
      style: text.titleLarge,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      buildCounter:
          (_, {required currentLength, required isFocused, maxLength}) => null,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(1),
      ],
    );
  }
}
