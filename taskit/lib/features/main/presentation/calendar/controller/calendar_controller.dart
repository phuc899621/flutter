import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/main/presentation/calendar/state/calendar_state.dart';

final calendarControllerProvider =
    NotifierProvider<CalendarController, CalendarState>(CalendarController.new);

class CalendarController extends Notifier<CalendarState> {
  @override
  CalendarState build() {
    return CalendarState();
  }
}
