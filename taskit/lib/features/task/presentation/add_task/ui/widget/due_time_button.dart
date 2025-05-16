import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:taskit/config/app/app_color.dart';

class DueTimeButton extends ConsumerStatefulWidget{
  final Function(int, int) onTimeSelected;
  final DateTime initialDate;
  const DueTimeButton({super.key,required this.initialDate,required this.onTimeSelected});
  @override
  ConsumerState<ConsumerStatefulWidget> createState()=>_DueTimeButtonState();

}
class _DueTimeButtonState extends ConsumerState<DueTimeButton>{
  late TextEditingController _timeController;
  @override
  void initState() {
    super.initState();
    _timeController=TextEditingController();
    _timeController.text=formatTime(widget.initialDate);
  }
  @override
  void dispose() {
    _timeController.dispose();
    super.dispose();
  }
  String formatTime(DateTime dateTime) {
    return DateFormat('HH:mm').format(dateTime);
  }

  Future<void> selectedTime() async{
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(
          hour:  widget.initialDate.hour,
          minute: widget.initialDate.minute
      ),
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
              primary: AppColor(context).primary,
              onPrimary: AppColor(context).onPrimary,
              surface: AppColor(context).primary,
          )
        ),
        child: child!,
      )
    );
    if(selectedTime!=null){
      widget.onTimeSelected(selectedTime.hour,selectedTime.minute);
      setState(() {
        _timeController.text=formatTime(DateTime(0,0,0,selectedTime.hour,selectedTime.minute));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48.0,
      child: TextField(
        controller: _timeController,
        decoration: InputDecoration(
            hintText: 'Time',
            fillColor: AppColor(context).secondaryContainer,
            hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColor(context).secondaryText,
              fontFamily: 'Inter',
              letterSpacing: 0.0,
            ),
            prefixIcon: Icon(Icons.access_time_sharp,color: AppColor(context).secondaryText,),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: AppColor(context).onSurface,
                  width: 2.0
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            border: OutlineInputBorder(
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
        onTap: selectedTime,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: AppColor(context).secondaryText,
          fontFamily: 'Inter',
          letterSpacing: 0.0,
        ),
        readOnly: true,
        obscureText: false,

      ),

    );

  }

}