import 'package:easy_localization/easy_localization.dart';

enum Gender {
  FEMALE,
  MALE,
}

extension GenderExtension on Gender {
  int get type {
    switch (this) {
      case Gender.MALE:
        return 1;
      default:
        return 2;
    }
  }

  String get value {
    switch (this) {
      case Gender.MALE:
        return 'male'.tr();
      case Gender.FEMALE:
        return 'female'.tr();
      default:
        return '';
    }
  }
}

class GenderHelper {
  static Gender convertType(int type) {
    if (type == Gender.MALE.type) {
      return Gender.MALE;
    }
    return Gender.FEMALE;
  }
}
