import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/config/app/app_color.dart';

class DueDateButton extends ConsumerStatefulWidget{
  final Function(int year, int month ,int day) onDateSelected;
  final DateTime initialDate;
  const DueDateButton({super.key,required this.initialDate,required this.onDateSelected});
  @override
  ConsumerState<ConsumerStatefulWidget> createState()=>_DueDateButtonState();

}
class _DueDateButtonState extends ConsumerState<DueDateButton>{
  late TextEditingController _dateController;
  @override
  void initState() {
    super.initState();
    _dateController=TextEditingController();
    _dateController.text=widget.initialDate.toString().split(' ')[0];

  }

  Future<void> selectedDate() async{
    DateTime? datePicker= await showDatePicker(
        context: context,
        initialDate: widget.initialDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2030),
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
            primary: AppColor(context).primary,
            onPrimary: AppColor(context).onPrimary,
            surface: AppColor(context).primary
          ),
      ), child: child!,
      )
    );
    if(datePicker!=null){
      widget.onDateSelected(datePicker.year,datePicker.month,datePicker.day);
      setState(() {
        _dateController.text=datePicker.toString().split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
          width: double.infinity,
          height: 48.0,
          child: TextField(
            controller: _dateController,
              decoration: InputDecoration(
                hintText: 'Date',
                fillColor: AppColor(context).secondaryContainer,
                hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColor(context).secondaryText,
                  fontFamily: 'Inter',
                  letterSpacing: 0.0,
                ),
                prefixIcon: Icon(Icons.calendar_today,color: AppColor(context).secondaryText,),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColor(context).onSurface,
                    width: 2.0
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColor(context).onSurface,
                    width: 1.0
                  ),
                  borderRadius: BorderRadius.circular(12),

                )

              ),
              onTap: selectedDate,


              readOnly: true,
              obscureText: false,

            ),

      );

  }

}