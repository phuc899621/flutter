import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension FormatDateTime on DateTime {
  String get threeCharMonth {
    final dateFormat = DateFormat('MMM');
    return dateFormat.format(this);
  }

  String get threeCharDayOfWeek {
    final dateFormat = DateFormat('EEE');
    return dateFormat.format(this);
  }

  String formatToRelativeDateString() {
    if (isToday()) return 'Today';
    if (isYesterday()) return 'Yesterday';
    if (isTomorrow()) return 'Tomorrow';

    final dateFormat = DateFormat('dd/MM/yyyy');
    return dateFormat.format(this);
  }

  String formatToDateString() {
    final dateFormat = DateFormat('dd/MM/yyyy');
    return dateFormat.format(this);
  }

  String toFormatTime() {
    final timeFormat = DateFormat('HH:mm');
    return timeFormat.format(this);
  }

  String toFormatDateAndTime() {
    if (isToday()) return 'Today, ${toFormatTime()}';
    if (isYesterday()) return 'Yesterday, ${toFormatTime()}';
    if (isTomorrow()) return 'Tomorrow, ${toFormatTime()}';

    final dateFormat = DateFormat('dd/MM/yyyy HH:mm');
    return dateFormat.format(this);
  }

  String toDisplayFullFormatDate() {
    final dateFormat = DateFormat('EEEE, MMM d, yyyy');
    return dateFormat.format(this);
  }

  String toDisplayFormatDate() {
    final dateFormat = DateFormat('MMM yyyy');
    return dateFormat.format(this);
  }

  TimeOfDay toTimeOfDay() => TimeOfDay.fromDateTime(this);
}

extension FormatTime on TimeOfDay {
  String toTimeFormat() {
    final timeFormat = DateFormat('HH:mm');
    return timeFormat.format(DateTime(0, 0, 0, hour, minute));
  }
}

extension DateTimeDayUtils on DateTime {
  //region Today
  DateTime toStartOfDay() => DateTime(year, month, day);

  DateTime toEndOfDay() => DateTime(year, month, day, 23, 59, 59, 999);

  //endregion
  //region Yesterday
  DateTime toStartOfYesterday() => DateTime(year, month, day - 1);

  DateTime toEndOfYesterday() =>
      DateTime(year, month, day - 1, 23, 59, 59, 999);

  //endregion
  //region Tomorrow
  DateTime toStartOfTomorrow() => DateTime(year, month, day + 1);

  DateTime toEndOfTomorrow() => DateTime(year, month, day + 1, 23, 59, 59, 999);

  //endregion
  //region Week
  DateTime toStartOfWeek() =>
      DateTime(year, month, day).subtract(Duration(days: weekday - 1));

  DateTime toEndOfWeek() => toStartOfWeek().add(Duration(
      days: 6, hours: 23, minutes: 59, seconds: 59, milliseconds: 999));

  DateTime toStartOfNextWeek() => toStartOfWeek().add(Duration(days: 7));

  DateTime toEndOfNextWeek() => toStartOfNextWeek().add(Duration(
      days: 6, hours: 23, minutes: 59, seconds: 59, milliseconds: 999));

  DateTime toStartOfLastWeek() => toStartOfWeek().subtract(Duration(days: 7));

  DateTime toEndOfLastWeek() => toStartOfLastWeek().add(Duration(
      days: 6, hours: 23, minutes: 59, seconds: 59, milliseconds: 999));

  //endregion
  //region Month
  DateTime toStartOfMonth() => DateTime(year, month, 1);

  DateTime toEndOfMonth() {
    final nextMonth = month + 1;
    final nextMonthYear = nextMonth > 12 ? year + 1 : year;
    final nextMonthValue = nextMonth > 12 ? 1 : nextMonth;
    return DateTime(nextMonthYear, nextMonthValue, 0, 23, 59, 59, 999);
  }

  DateTime toStartOfNextMonth() => DateTime(year, month + 1, 1);

  DateTime toEndOfNextMonth() => DateTime(year, month + 1, 0, 23, 59, 59, 999);

  DateTime toStartOfLastMonth() => DateTime(year, month - 1, 1);

  DateTime toEndOfLastMonth() => DateTime(year, month - 1, 0, 23, 59, 59, 999);

  //endregion
  //region Year

  DateTime toStartOfYear() => DateTime(year, 1, 1);

  DateTime toEndOfYear() => DateTime(year, 12, 31, 23, 59, 59, 999);

  DateTime toStartOfNextYear() => DateTime(year + 1, 1, 1);

  DateTime toEndOfNextYear() => DateTime(year + 1, 12, 31, 23, 59, 59, 999);

//endregion
}

//region DateTimeCompareUtils
extension DateTimeDayCompare on DateTime {
  bool isBetweenInclusive(DateTime start, DateTime end) =>
      isSameDayOrAfter(start) && isSameDayOrBefore(end);

  bool isSameDay(DateTime date) =>
      year == date.year && month == date.month && day == date.day;

  bool isSameDayOrAfter(DateTime date) =>
      isSameDay(date) || isAfter(date.toStartOfDay());

  bool isDayBefore(DateTime date) =>
      year < date.year ||
      (year == date.year && month < date.month) ||
      (year == date.year && month == date.month && day < date.day);

  bool isDayAfter(DateTime date) =>
      year > date.year ||
      (year == date.year && month > date.month) ||
      (year == date.year && month == date.month && day > date.day);

  bool isSameDayOrBefore(DateTime date) =>
      isSameDay(date) || isBefore(date.toEndOfDay());

  bool isSameWeek(DateTime date) =>
      isBetweenInclusive(date.toStartOfWeek(), date.toEndOfWeek());

  bool isSameMonth(DateTime date) => year == date.year && month == date.month;

  bool isSameYear(DateTime date) => year == date.year;
}
//endregion

extension DateTimeDayCheck on DateTime {
  //region check
  bool isToday() => isSameDay(DateTime.now());

  bool isYesterday() => isBetweenInclusive(
      DateTime.now().toStartOfYesterday(), DateTime.now().toEndOfYesterday());

  bool isTomorrow() => isBetweenInclusive(
      DateTime.now().toStartOfTomorrow(), DateTime.now().toEndOfTomorrow());

  bool isThisWeek() => DateTime.now().isSameWeek(this);

  bool isNextWeek() => isBetweenInclusive(
      DateTime.now().toStartOfNextWeek(), DateTime.now().toEndOfNextWeek());

  bool isLastWeek() => isBetweenInclusive(
      DateTime.now().toStartOfLastWeek(), DateTime.now().toEndOfLastWeek());

  bool isThisMonth() => DateTime.now().isSameMonth(this);

  bool isNextMonth() => isBetweenInclusive(
      DateTime.now().toStartOfNextMonth(), DateTime.now().toEndOfNextMonth());

  bool isLastMonth() => isBetweenInclusive(
      DateTime.now().toStartOfLastMonth(), DateTime.now().toEndOfLastMonth());

  bool isThisYear() => DateTime.now().isSameYear(this);

//endregion
}
