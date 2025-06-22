import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension FormatDateTime on DateTime {
  toFormatDate() {
    if (isToday()) return 'Today';
    if (isYesterday()) return 'Yesterday';
    if (isTomorrow()) return 'Tomorrow';

    final dateFormat = DateFormat('dd/MM/yyyy');
    return dateFormat.format(this);
  }

  toFormatTime() {
    final timeFormat = DateFormat('HH:mm');
    return timeFormat.format(this);
  }

  toFormatDateAndTime() {
    if (isToday()) return 'Today, ${toFormatTime()}';
    if (isYesterday()) return 'Yesterday, ${toFormatTime()}';
    if (isTomorrow()) return 'Tomorrow, ${toFormatTime()}';

    final dateFormat = DateFormat('dd/MM/yyyy HH:mm');
    return dateFormat.format(this);
  }

  toDisplayFormatDate() {
    final dateFormat = DateFormat('EEEE, MMM d,yyyy');
    return dateFormat.format(this);
  }
}

extension FormatTime on TimeOfDay {
  toTimeFormat() {
    final timeFormat = DateFormat('HH:mm');
    return timeFormat.format(DateTime(0, 0, 0, hour, minute));
  }
}

extension DateCheck on DateTime {
  bool isToday() {
    final now = DateTime.now();
    return now.year == year && now.month == month && now.day == day;
  }

  bool isYesterday() {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return yesterday.year == year &&
        yesterday.month == month &&
        yesterday.day == day;
  }

  bool isTomorrow() {
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    return tomorrow.year == year &&
        tomorrow.month == month &&
        tomorrow.day == day;
  }

  bool isSameDay(DateTime date) {
    return year == date.year && month == date.month && day == date.day;
  }

  bool isSameMonth(DateTime date) {
    return year == date.year && month == date.month;
  }

  bool isSameYear(DateTime date) {
    return year == date.year;
  }

  bool isThisWeek() {
    final now = DateTime.now();
    final startOfWeek = DateTime(now.year, now.month, now.day)
        .subtract(Duration(days: now.weekday - 1));
    final endOfWeek = startOfWeek.add(Duration(days: 7));
    return !isBefore(startOfWeek) && isBefore(endOfWeek);
  }

  bool isSameWeek(DateTime date) {
    final startOfWeek = DateTime(date.year, date.month, date.day)
        .subtract(Duration(days: date.weekday - 1));
    final endOfWeek = startOfWeek.add(Duration(days: 7));

    return !isBefore(startOfWeek) && isBefore(endOfWeek);
  }

  bool isDateAfter(DateTime date) {
    return year > date.year ||
        (year == date.year && month > date.month) ||
        (year == date.year && month == date.month && day > date.day);
  }

  bool isDateBefore(DateTime date) {
    return year < date.year ||
        (year == date.year && month < date.month) ||
        (year == date.year && month == date.month && day < date.day);
  }
}
