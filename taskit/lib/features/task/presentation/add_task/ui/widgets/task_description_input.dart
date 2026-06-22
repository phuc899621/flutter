import 'package:flutter/material.dart';

class TaskDescriptionInput extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;

  const TaskDescriptionInput({
    super.key,
    required this.controller,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = theme.colorScheme;
    final text = theme.textTheme;
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      maxLines: 3,
      maxLength: 60,
      textCapitalization: TextCapitalization.sentences,
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
      style: text.bodyMedium?.copyWith(color: color.onSurface),
      decoration: InputDecoration(
        hintText: 'Description',
        hintStyle: text.bodyMedium?.copyWith(
          fontWeight: FontWeight.w500,
          color: color.onSurfaceVariant,
        ),
        filled: true,
        fillColor: color.surfaceContainer,
        counterText: '',
        suffixIcon: _ClearButton(controller: controller),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: color.primary, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

class _ClearButton extends StatelessWidget {
  final TextEditingController controller;

  const _ClearButton({required this.controller});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (context, value, _) {
        if (controller.text.isEmpty) return const SizedBox.shrink();
        return IconButton(
          onPressed: controller.clear,
          icon: Icon(
            Icons.clear_rounded,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        );
      },
    );
  }
}
