import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignupButton extends ConsumerWidget{
  final VoidCallback onPressed;
  const SignupButton({super.key,required this.onPressed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

     return ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity,40),
            backgroundColor: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
            ),
          ) ,
          child: Text(
            'Sign Up',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontFamily: 'Inter Tight',
              color: Colors.white
            )
          ),
     );
  }



}