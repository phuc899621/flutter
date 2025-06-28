import 'package:taskit/features/task/domain/entities/filter_date_option_enum.dart';

import '../../features/task/domain/entities/order_option_enum.dart';

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
      case FilterDateOption.thisWeek:
        return 'This Week';
      case FilterDateOption.thisMonth:
        return 'This Month';
      case FilterDateOption.custom:
        return 'Custom';
    }
  }
}

extension OrderByOptionString on OrderByOption {
  String get optionString {
    switch (this) {
      case OrderByOption.titleAtoZ:
        return 'Title A-Z';
      case OrderByOption.titleZtoA:
        return 'Title Z-A';
      case OrderByOption.dueDateSoonToLate:
        return 'Due Date Soon-Late';
      case OrderByOption.dueDateLateToSoon:
        return 'Due Date Late-Soon';
      case OrderByOption.priorityLowToHigh:
        return 'Priority Low-High';
      case OrderByOption.priorityHighToLow:
        return 'Priority High-Low';
      case OrderByOption.categoryAtoZ:
        return 'Category A-Z';
      case OrderByOption.categoryZtoA:
        return 'Category Z-A';
      case OrderByOption.defaultOption:
        return 'Default';
    }
  }
}
