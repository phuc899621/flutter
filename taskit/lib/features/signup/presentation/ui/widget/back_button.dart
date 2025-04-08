import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpBackButton extends ConsumerWidget{
  final VoidCallback onPressed;
  const SignUpBackButton({super.key,required this.onPressed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: IconButton(
        iconSize: 46.2,
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: 24.0,
        ),
        onPressed: onPressed,
      ),
    );
  }

}