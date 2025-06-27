import 'package:taskit/features/task/domain/entities/filter_date_option_enum.dart';

extension FilterDateOptionExtension on FilterDateOption {
  String get optionString {
    switch (this) {
      case FilterDateOption.noDateFilter:
        return 'No date filter';
      case FilterDateOption.today:
        return 'Today';
      case FilterDateOption.lastWeek:
        return 'Last Week';
      case FilterDateOption.lastMonth:
        return 'Last Month';
      case FilterDateOption.yesterday:
        return 'Yesterday';
      case FilterDateOption.nextWeek:
        return 'Next Week';
      case FilterDateOption.nextMonth:
        return 'Next Month';
      case FilterDateOption.tomorrow:
        return 'Tomorrow';
      case FilterDateOption.custom:
        return 'Custom';
    }
  }
}
