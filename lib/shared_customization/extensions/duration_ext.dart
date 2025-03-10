extension DurationExt on Duration {
  String get dayHourMinute {
    String result = "";
    int seconds = inSeconds;
    if (seconds ~/ Duration.secondsPerDay > 0) {
      result += "${seconds ~/ Duration.secondsPerDay} ngày ";
      seconds -= (seconds ~/ Duration.secondsPerDay) * Duration.secondsPerDay;
    }
    if (seconds ~/ Duration.secondsPerHour > 0) {
      result += "${seconds ~/ Duration.secondsPerHour} giờ ";
      seconds -= (seconds ~/ Duration.secondsPerHour) * Duration.secondsPerHour;
    }
    if (seconds ~/ Duration.secondsPerMinute > 0) {
      result += "${seconds ~/ Duration.secondsPerMinute} phút";
    }
    return result;
  }

  DateTime toDateTime({DateTime? startDate}) =>
      (startDate ?? DateTime.now()).add(this);
}
