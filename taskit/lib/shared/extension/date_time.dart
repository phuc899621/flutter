import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension FormatDateTime on DateTime {
  toFormatDate() {
    final dateFormat = DateFormat('dd/MM/yyyy');
    return dateFormat.format(this);
  }

  toFormatTime() {
    final timeFormat = DateFormat('HH:mm');
    return timeFormat.format(this);
  }
}

extension FormatTime on TimeOfDay {
  toTimeFormat() {
    final timeFormat = DateFormat('HH:mm');
    return timeFormat.format(DateTime(0, 0, 0, hour, minute));
  }
}
