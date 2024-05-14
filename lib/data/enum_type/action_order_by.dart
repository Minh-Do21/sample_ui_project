import 'package:easy_localization/easy_localization.dart';

enum ActionOrderBy {
  UPCOMING,
  TOOK_PLACE,
}

extension ActionOrderByExtension on ActionOrderBy {
  int get type {
    switch (this) {
      case ActionOrderBy.UPCOMING:
        return 1;
      default:
        return 2;
    }
  }

  String get name {
    switch (this) {
      case ActionOrderBy.UPCOMING:
        return 'msg_upcoming'.tr();
      case ActionOrderBy.TOOK_PLACE:
        return 'msg_took_place'.tr();
      default:
        return '';
    }
  }
}
