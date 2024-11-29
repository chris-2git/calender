class CalendarDateUtils {
  static final List<String> weekdays = [
    'Sun',
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat'
  ];

  static List<DateTime> getDaysInMonth(DateTime date) {
    final first = DateTime(date.year, date.month, 1);
    final daysBefore = first.weekday % 7;
    final firstToDisplay = first.subtract(Duration(days: daysBefore));

    final last = DateTime(date.year, date.month + 1, 0);
    final daysAfter = 7 - last.weekday % 7;
    final lastToDisplay = last.add(Duration(days: daysAfter));

    final days = <DateTime>[];
    for (var i = firstToDisplay;
        i.isBefore(lastToDisplay);
        i = i.add(const Duration(days: 1))) {
      days.add(i);
    }
    return days;
  }

  static bool isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  static String formatMonth(DateTime date) {
    final months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return '${months[date.month - 1]} ${date.year}';
  }
}
