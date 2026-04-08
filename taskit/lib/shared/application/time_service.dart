import 'package:flutter_riverpod/flutter_riverpod.dart';

final timeStreamProvider = StreamProvider.autoDispose<DateTime>((ref) async* {
  yield DateTime.now();

  await for (final _ in Stream.periodic(const Duration(minutes: 1))){
    yield DateTime.now();
  }
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
