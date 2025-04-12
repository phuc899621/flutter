import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TaskitElevationButton extends ConsumerWidget{
  final String text;
  final VoidCallback onPressed;

  const TaskitElevationButton({super.key,this.text="",required this.onPressed});
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
      child: Text(text,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontFamily: 'Inter Tight',
              color: Colors.white
          )
      ),
    );
  }

}
class TaskitBackButton extends ConsumerWidget{
  final VoidCallback onPressed;
  const TaskitBackButton({super.key,required this.onPressed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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