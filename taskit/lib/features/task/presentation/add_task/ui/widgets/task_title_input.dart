import 'package:flutter/material.dart';

class TaskTitleInput extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;

  const TaskTitleInput({
    super.key,
    required this.controller,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    final baseBorder = OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(10),
    );
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      controller: controller,
      maxLines: 1,
      maxLength: 35,
      focusNode: focusNode,
      autofocus: false,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      style: text.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a title';
        }
        return null;
      },
      decoration: InputDecoration(
        suffixIcon: ValueListenableBuilder(
          valueListenable: controller,
          builder: (context, value, child) {
            return controller.text.isNotEmpty
                ? IconButton(
                    onPressed: controller.clear,
                    icon: Icon(
                      Icons.clear_rounded,
                      color: color.onSurfaceVariant,
                    ),
                  )
                : const SizedBox.shrink();
          },
        ),
        hintStyle: text.titleMedium?.copyWith(
          fontWeight: FontWeight.w500,
          color: color.onSurfaceVariant,
        ),
        hintText: 'Title',
        counterText: '',
        filled: true,
        fillColor: color.surfaceContainer,
        border: baseBorder,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: color.primary, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
