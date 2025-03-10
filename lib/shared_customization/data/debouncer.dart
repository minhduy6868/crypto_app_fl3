import 'dart:async';

class Debouncer {
  final Duration? delay;
  Timer? _timer;

  Debouncer({this.delay});

  void call(void Function() action) {
    _timer?.cancel();
    _timer = Timer(delay ?? const Duration(milliseconds: 0), action);
  }

  bool get isRunning => _timer?.isActive ?? false;

  void cancel() => _timer?.cancel();
}
