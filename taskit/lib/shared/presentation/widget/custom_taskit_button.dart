import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/config/app/app_color.dart';

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
        backgroundColor: AppColor(context).primary,
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
        color: AppColor(context).primary,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: IconButton(
        iconSize: 50,
        icon: Icon(
          Icons.arrow_back,
          color: AppColor(context).onPrimary,
          size: 24.0,
        ),
        onPressed: onPressed,
      ),
    );
  }

}