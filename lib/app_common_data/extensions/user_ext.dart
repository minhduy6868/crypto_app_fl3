import 'package:crypto_app/models/user_model/user_model.dart';

import '/models/user/user.dart';
import '/shared_customization/extensions/string_ext.dart';

extension UserExt on User? {
  String get fullname {
    if (this == null ||
        (this!.firstName.isNotEmptyOrNull && this!.lastName.isEmptyOrNull)) {
      return "";
    }
    return "${this!.firstName.isNotEmptyOrNull ? "${this!.firstName} " : ""}${this!.lastName}";
  }
}

extension UserModelExt on UserModel? {
  String get fullname {
    if (this == null ||
        (this!.firstName.isNotEmptyOrNull && this!.lastName.isEmptyOrNull)) {
      return "";
    }
    return "${this!.firstName.isNotEmptyOrNull ? "${this!.firstName} " : ""}${this!.lastName}";
  }
}
