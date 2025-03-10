class MyDateTime {
  final int year;
  final int month;
  final int day;
  final int hour;
  final int minute;
  final int second;
  final int millisecond;
  final int microsecond;

  const MyDateTime({
    this.year = -1,
    this.month = -1,
    this.day = -1,
    this.hour = -1,
    this.minute = -1,
    this.second = -1,
    this.millisecond = -1,
    this.microsecond = -1,
  });

  MyDateTime copyWith({
    int? year,
    int? month,
    int? day,
    int? hour,
    int? minute,
    int? second,
    int? millisecond,
    int? microsecond,
  }) =>
      MyDateTime(
        year: year ?? this.year,
        month: month ?? this.month,
        day: day ?? this.day,
        hour: hour ?? this.hour,
        minute: minute ?? this.minute,
        second: second ?? this.second,
        millisecond: millisecond ?? this.millisecond,
        microsecond: microsecond ?? this.microsecond,
      );

  bool get isValidDate {
    if (year < 0 || (month < 0 || month > 12) || (day < 0 || day > 31)) {
      return false;
    }
    int maxDay = 31;
    if ((year % 400 == 0 || (year % 4 == 0 && year % 100 != 0)) && month == 2) {
      maxDay = 29;
    } else if (month == 2) {
      maxDay = 28;
    } else if ((month <= 7 && month % 2 == 0) ||
        (month >= 8 && month % 2 == 1)) {
      maxDay = 30;
    }
    return day <= maxDay;
  }

  static MyDateTime get empty => const MyDateTime();
}
