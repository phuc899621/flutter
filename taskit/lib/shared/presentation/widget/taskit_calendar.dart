import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:taskit/config/app/app_color.dart';

class TaskitWeekCalendar extends ConsumerStatefulWidget{
  final Function(DateTime) onDateSelected;
  const TaskitWeekCalendar({super.key,required this.onDateSelected});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>_TaskitWeekCalendar();
}

class _TaskitWeekCalendar extends ConsumerState<TaskitWeekCalendar>{
  DateTime _currentDate=DateTime.now();
  DateTime? _selectedDate;
  List<DateTime> getListDaysOfWeek(DateTime date){
    final monday = date.subtract(Duration(days: date.weekday - 1));
    return List.generate(7, (index) => monday.add(Duration(days: index)));
  }
  void _goToPreviousWeek(){
    setState(() {
      _currentDate = _currentDate.subtract(const Duration(days: 7));
    });
  }
  void _goToNextWeek(){
    setState(() {
      _currentDate = _currentDate.add(const Duration(days: 7));
    });
  }
  void _onSelectedDate(DateTime date) {
    setState(() {
      _selectedDate = date;
    });
    widget.onDateSelected(date);
  }
  void _goToCurrentWeek() {
    setState(() {
      _currentDate = DateTime.now();
    });
    _onSelectedDate(_currentDate);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _goToCurrentWeek(); // Gọi sau khi build xong
    });
  }

  @override
  Widget build(BuildContext context) {
    final weekDates = getListDaysOfWeek(_currentDate);
    final currentMonth = DateFormat('MMMM yyyy').format(_currentDate);
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        color: AppColor(context).secondaryContainer,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(width: 10.0),
                Expanded(
                  child: Text(
                    currentMonth,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontFamily: 'Inter Tight',
                      letterSpacing: 0.0,
                      color: AppColor(context).primaryText
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                Container(
                  width: 36.0,
                  height: 36.0,
                  decoration: BoxDecoration(
                    color: AppColor(context).secondaryContainer,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.calendar_today,
                      color:  AppColor(context).primaryText,
                      size: 20.0,
                    ),
                    onPressed: ()=>_goToCurrentWeek(),
                    padding: EdgeInsets.zero,
                    splashRadius: 20.0,
                  ),
                ),
                const SizedBox(width: 10.0),
                Container(
                  width: 36.0,
                  height: 36.0,
                  decoration: BoxDecoration(
                    color: AppColor(context).secondaryContainer,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color:  AppColor(context).primaryText,
                      size: 20.0,
                    ),
                    onPressed: ()=>_goToPreviousWeek(),
                    padding: EdgeInsets.zero,
                    splashRadius: 20.0,
                  ),
                ),
                const SizedBox(width: 10.0),
                Container(
                  width: 36.0,
                  height: 36.0,
                  decoration: BoxDecoration(
                    color: AppColor(context).secondaryContainer,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color:  AppColor(context).primaryText,
                      size: 20.0,
                    ),
                    onPressed: ()=>_goToNextWeek(),
                    padding: EdgeInsets.zero,
                    splashRadius: 20.0,
                  ),
                ),
                const SizedBox(width: 10.0),
              ]
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 0.0, 0, 10.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: weekDates.map((date) {
                final dayName = DateFormat.E().format(date); // Mon, Tue, Wed, ...
                return Expanded(
                    child: GestureDetector(
                    onTap: () => _onSelectedDate(date),
                    child: Container(
                          width: 24.0,
                          height: 24.0,
                          alignment: AlignmentDirectional.center,
                          child: Center(
                              child:
                              Text(
                                dayName,
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontFamily: 'Inter',
                                  color: AppColor(context).secondaryText,
                                  fontSize: 11.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              )

                          ),
                        ),
                    ),
                );
              }).toList(),
           ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0.0, 0, 0.0),
              child: Container(
                width: double.infinity,
                height: 60,
                decoration: const BoxDecoration(),
                child: GridView(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7,
                    crossAxisSpacing: 0.0,
                    mainAxisSpacing: 0.0,
                    childAspectRatio: 1.5,
                  ),
                  scrollDirection: Axis.vertical,
                  children: weekDates.map((date){
                    return GestureDetector(
                    onTap: () => _onSelectedDate(date),
                    child: Container(
                      decoration: BoxDecoration(
                        color: _selectedDate?.day == date.day &&
                            _selectedDate?.month == date.month &&
                            _selectedDate?.year == date.year
                            ? AppColor(context).primary
                            : AppColor(context).secondaryContainer,
                        shape: BoxShape.circle,
                      ),
                      child: Align(
                        alignment: const AlignmentDirectional(0, 0),
                        child: Text(
                          date.day.toString(),
                          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            fontFamily: 'Inter',
                            color: _selectedDate?.day == date.day &&
                                _selectedDate?.month == date.month &&
                                _selectedDate?.year == date.year
                                ? AppColor(context).onPrimary
                                : AppColor(context).primaryText,
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
    ),
    );
  }
}
  
