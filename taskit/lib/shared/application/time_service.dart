import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';

final timeStreamProvider = StreamProvider.autoDispose<DateTime>((ref) {
  return Stream<DateTime>.periodic(
    const Duration(minutes: 1),
    (_) => DateTime.now(),
  ).startWith(DateTime.now());
});

final timeServiceProvider = Provider<TimeService>((ref) {
  return TimeService();
});

class TimeService {
  DateTime startOfDay(DateTime date) =>
      DateTime(date.year, date.month, date.day);

  DateTime theNextDay(DateTime date) => startOfDay(date).add(Duration(days: 1));

  bool isTheSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  bool isLargerDay(DateTime date1, DateTime date2) {
    return date1.year > date2.year ||
        (date1.year == date2.year && date1.month > date2.month) ||
        (date1.year == date2.year &&
            date1.month == date2.month &&
            date1.day > date2.day);
  }
}
