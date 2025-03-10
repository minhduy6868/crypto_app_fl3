import '/shared_customization/data/screen_value.dart';
import '/shared_customization/enums/screen_status.dart';

extension ScreenValueExt on ScreenValue? {
  bool get isSuccess =>
      this == null ? false : this!.status == ScreenStatus.success;

  bool get isFailed =>
      this == null ? false : this!.status == ScreenStatus.failed;
}
