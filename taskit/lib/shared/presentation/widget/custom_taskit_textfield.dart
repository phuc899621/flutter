import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TaskitOutlineTextField extends ConsumerWidget{
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
      controller: controller,
      autofocus: true,
      autofillHints: [autofillHints],
      obscureText: false,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: Theme.of(context)
            .textTheme.labelMedium?.copyWith(
          fontFamily: 'Inter',
          letterSpacing: 0.0,
        ),
        alignLabelWithHint: false,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context)
                .colorScheme.primaryContainer,
            width: 2.0,
          ),
          borderRadius:
          BorderRadius.circular(12.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context)
                .primaryColor,
            width: 2.0,
          ),
          borderRadius:
          BorderRadius.circular(12.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context)
                .colorScheme.background,
            width: 2.0,
          ),
          borderRadius:
          BorderRadius.circular(12.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context)
                .colorScheme.background,
            width: 2.0,
          ),
          borderRadius:
          BorderRadius.circular(12.0),
        ),
        filled: true,
        fillColor: Theme.of(context)
            .colorScheme.primaryContainer,
      ),
      style: Theme.of(context).textTheme
          .bodyMedium?.copyWith(
        fontFamily: 'Inter',
        letterSpacing: 0.0,
      ),
      keyboardType: keyboardType,
    );
  }
}

class TaskitOutLineTextFieldWithPassword extends ConsumerStatefulWidget{
  final String labelText;
  final TextEditingController controller;

  const TaskitOutLineTextFieldWithPassword({
    super.key,
    required this.labelText,
    required this.controller,
  });
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>_TaskitOutLineTextFieldWithPasswordState();

}
class _TaskitOutLineTextFieldWithPasswordState extends ConsumerState<TaskitOutLineTextFieldWithPassword>{
  bool _obscureText=true;
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
      autofocus: true,
      autofillHints: [AutofillHints.password],
      obscureText: _obscureText,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: Theme
            .of(context)
            .textTheme
            .labelMedium
            ?.copyWith(
          fontFamily: 'Inter',
          letterSpacing: 0.0,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme
                .of(context)
                .colorScheme
                .primaryContainer,
            width: 2.0,
          ),
          borderRadius:
          BorderRadius.circular(12.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme
                .of(context)
                .primaryColor,
            width: 2.0,
          ),
          borderRadius:
          BorderRadius.circular(12.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme
                .of(context)
                .colorScheme
                .background,
            width: 2.0,
          ),
          borderRadius:
          BorderRadius.circular(12.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme
                .of(context)
                .colorScheme
                .background,
            width: 2.0,
          ),
          borderRadius:
          BorderRadius.circular(12.0),
        ),
        filled: true,
        fillColor: Theme
            .of(context)
            .colorScheme
            .primaryContainer,
        suffixIcon: InkWell(
          onTap: () => _toggleObscureText(),
          focusNode:
          FocusNode(skipTraversal: true),
          child: Icon(
            _obscureText
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
            color: Theme
                .of(context)
                .colorScheme
                .onSecondary,
            size: 24.0,
          ),
        ),
      ),
      style: Theme
          .of(context)
          .textTheme
          .bodyMedium
          ?.copyWith(
        fontFamily: 'Inter',
        letterSpacing: 0.0,

      ),
    );
  }


}