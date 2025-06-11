import 'package:intl/intl.dart';

class DateFormatUtils {
  static final _dateWithTimeFormatter = DateFormat('dd/MM/yyyy HH:mm');
  static final _dateFormatter = DateFormat('dd/MM/yyyy');
  static final _timeFormatter = DateFormat('HH:mm');
  static final _fullDateFormatter = DateFormat('EEEE, MMMM dd yyyy');

  static String formatDateAndTime(DateTime? date) {
    if (date == null) {
      return 'Any time';
    }
    return _dateWithTimeFormatter.format(date);
  }

  static String formatDate(DateTime? date) {
    if (date == null) {
      return 'Any time';
    }
    return _dateFormatter.format(date);
  }

  static String formatTime(DateTime? date) {
    if (date == null) {
      return 'Any time';
    }
    return _timeFormatter.format(date);
  }

  static String formatFullDate(DateTime? date) {
    if (date == null) {
      return 'Any time';
    }
    return _fullDateFormatter.format(date);
  }
}
