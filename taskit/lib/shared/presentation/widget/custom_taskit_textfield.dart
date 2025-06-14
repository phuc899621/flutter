import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../config/app/app_color.dart';

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
    return TextFormField(
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
      controller: controller,
      autofocus: true,
      autofillHints: [autofillHints],
      obscureText: false,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
              fontFamily: 'Inter',
              letterSpacing: 0.0,
            ),
        alignLabelWithHint: false,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColor(context).primaryContainer,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColor(context).primary,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColor(context).error,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColor(context).primary,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        filled: true,
        fillColor: AppColor(context).secondaryContainer,
      ),
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
          fontFamily: 'Inter',
          letterSpacing: 0.0,
          color: AppColor(context).onSurface),
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
    // TODO: implement build
    return TextFormField(
      controller: widget.controller,
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
      autofocus: true,
      autofillHints: const [AutofillHints.password],
      obscureText: _obscureText,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
              fontFamily: 'Inter',
              letterSpacing: 0.0,
            ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColor(context).secondaryContainer,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColor(context).primary,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColor(context).error,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColor(context).primary,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        filled: true,
        fillColor: AppColor(context).secondaryContainer,
        suffixIcon: InkWell(
          onTap: () => _toggleObscureText(),
          focusNode: FocusNode(skipTraversal: true),
          child: Icon(
            _obscureText
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
            color: AppColor(context).onSurfaceVariant,
            size: 24.0,
          ),
        ),
      ),
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontFamily: 'Inter',
            letterSpacing: 0.0,
            color: AppColor(context).onSurface,
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
          labelStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
                fontFamily: 'Inter',
                letterSpacing: 0.0,
              ),
          hintStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
                fontFamily: 'Inter',
                letterSpacing: 0.0,
              ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.surface,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColor(context).primary,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColor(context).error,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColor(context).primary,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          filled: true,
          fillColor: AppColor(context).secondaryContainer,
        ),
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              fontFamily: 'Inter',
              letterSpacing: 0.0,
            ),
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        buildCounter: (context,
                {required currentLength, required isFocused, maxLength}) =>
            null,
        keyboardType: TextInputType.number,
        cursorColor: AppColor(context).onPrimary,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(1),
        ],
      ),
    );
  }
}
