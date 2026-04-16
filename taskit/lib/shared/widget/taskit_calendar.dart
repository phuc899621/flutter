import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class TaskitWeekCalendar extends ConsumerStatefulWidget {
  final Function(DateTime) onDateSelected;
  const TaskitWeekCalendar({super.key, required this.onDateSelected});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TaskitWeekCalendar();
}

class _TaskitWeekCalendar extends ConsumerState<TaskitWeekCalendar> {
  DateTime _currentDate = DateTime.now();
  DateTime? _selectedDate;
  List<DateTime> getListDaysOfWeek(DateTime date) {
    final monday = date.subtract(Duration(days: date.weekday - 1));
    return List.generate(7, (index) => monday.add(Duration(days: index)));
  }

  void _goToPreviousWeek() {
    setState(() {
      _currentDate = _currentDate.subtract(const Duration(days: 7));
    });
  }

  void _goToNextWeek() {
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
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        color: color.secondaryContainer,
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
                      style: text.titleLarge?.copyWith(color: color.onSurface),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Container(
                    width: 36.0,
                    height: 36.0,
                    decoration: BoxDecoration(
                      color: color.secondaryContainer,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.calendar_today,
                        color: color.onSurface,
                        size: 20.0,
                      ),
                      onPressed: () => _goToCurrentWeek(),
                      padding: EdgeInsets.zero,
                      splashRadius: 20.0,
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Container(
                    width: 36.0,
                    height: 36.0,
                    decoration: BoxDecoration(
                      color: color.secondaryContainer,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: color.onSurface,
                        size: 20.0,
                      ),
                      onPressed: () => _goToPreviousWeek(),
                      padding: EdgeInsets.zero,
                      splashRadius: 20.0,
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Container(
                    width: 36.0,
                    height: 36.0,
                    decoration: BoxDecoration(
                      color: color.secondaryContainer,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: color.onSurface,
                        size: 20.0,
                      ),
                      onPressed: () => _goToNextWeek(),
                      padding: EdgeInsets.zero,
                      splashRadius: 20.0,
                    ),
                  ),
                  const SizedBox(width: 10.0),
                ]),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 0.0, 0, 10.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: weekDates.map((date) {
                final dayName =
                    DateFormat.E().format(date); // Mon, Tue, Wed, ...
                return Expanded(
                  child: GestureDetector(
                    onTap: () => _onSelectedDate(date),
                    child: Container(
                      width: 24.0,
                      height: 24.0,
                      alignment: AlignmentDirectional.center,
                      child: Center(
                          child: Text(
                        dayName,
                        style: text.bodyMedium?.copyWith(
                          color: color.onSurfaceVariant,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: 60,
              decoration: const BoxDecoration(),
              child: GridView(
                padding: const EdgeInsets.only(top: 5),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                  crossAxisSpacing: 0.0,
                  mainAxisSpacing: 0.0,
                  childAspectRatio: 1.5,
                ),
                scrollDirection: Axis.vertical,
                children: weekDates.map((date) {
                  return GestureDetector(
                    onTap: () => _onSelectedDate(date),
                    child: Container(
                        decoration: BoxDecoration(
                          color: _selectedDate?.day == date.day &&
                                  _selectedDate?.month == date.month &&
                                  _selectedDate?.year == date.year
                              ? color.primary
                              : color.secondaryContainer,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          date.day.toString(),
                          style: text.labelLarge?.copyWith(
                            color: _selectedDate?.day == date.day &&
                                    _selectedDate?.month == date.month &&
                                    _selectedDate?.year == date.year
                                ? color.onPrimary
                                : color.onSurface,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
