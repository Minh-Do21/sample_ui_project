import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../resources/barrel_const.dart';

enum ServiceCategory {
  MASSAGE,
  MANICURE,
  WAXING,
  HAIR,
  SKIN_CARE,
  OTHER,
}

extension ServiceCategoryExtension on ServiceCategory {
  int? get type {
    switch (this) {
      case ServiceCategory.MASSAGE:
        return 1;
      case ServiceCategory.MANICURE:
        return 2;
      case ServiceCategory.WAXING:
        return 3;
      case ServiceCategory.HAIR:
        return 4;
      case ServiceCategory.SKIN_CARE:
        return 5;
      case ServiceCategory.OTHER:
        return 6;
      default:
        return null;
    }
  }

  String get name {
    switch (this) {
      case ServiceCategory.MASSAGE:
        return 'title_massage'.tr();
      case ServiceCategory.MANICURE:
        return 'title_manicure'.tr();
      case ServiceCategory.WAXING:
        return 'title_waxxing'.tr();
      case ServiceCategory.HAIR:
        return 'title_make_hair'.tr();
      case ServiceCategory.SKIN_CARE:
        return 'title_body'.tr();
      case ServiceCategory.OTHER:
        return 'title_other'.tr();
      default:
        return '';
    }
  }

  Color get color {
    switch (this) {
      case ServiceCategory.MASSAGE:
        return COLOR_CONST.tickleMePink;
      case ServiceCategory.MANICURE:
        return COLOR_CONST.malibu;
      case ServiceCategory.WAXING:
        return COLOR_CONST.fuchsiaPink;
      case ServiceCategory.HAIR:
        return COLOR_CONST.cornflowerBlue;
      case ServiceCategory.SKIN_CARE:
        return COLOR_CONST.macaroniCheese;
      case ServiceCategory.OTHER:
        return COLOR_CONST.sulu;
      default:
        return COLOR_CONST.sulu;
    }
  }
}
