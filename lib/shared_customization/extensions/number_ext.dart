import '/app_common_data/common_data/global_variable.dart';

extension IntExt on int? {
  String toCurrency({String separatedPattern = ","}) {
    if (this == null) return "";
    String str = this!.toString();
    if (str.length <= 3) return str;
    return "${((this! ~/ 1000).toCurrency())}$separatedPattern${str.substring(str.length - 3, str.length)} $CURRENCY";
  }

  DateTime? get toDateTimeFromMilliseconds =>
      this != null ? DateTime.fromMillisecondsSinceEpoch(this!) : null;
}
