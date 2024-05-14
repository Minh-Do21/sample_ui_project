import 'package:easy_localization/easy_localization.dart';

enum SpaOrderBy {
  PRIORITY,
  FAVORITE,
  NEAR_BY,
}

extension SpaOrderByExtension on SpaOrderBy {
  int get type {
    switch (this) {
      case SpaOrderBy.PRIORITY:
        return 1;
      case SpaOrderBy.FAVORITE:
        return 2;
      default:
        return 3;
    }
  }

  String get name {
    switch (this) {
      case SpaOrderBy.PRIORITY:
        return 'msg_outstanding'.tr();
      case SpaOrderBy.FAVORITE:
        return 'msg_favourite'.tr();
      case SpaOrderBy.NEAR_BY:
        return 'msg_near_you'.tr();
      default:
        return '';
    }
  }
}
