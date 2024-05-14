import 'package:flutter/material.dart';
import 'package:mor_flutter_project/resources/barrel_const.dart';

enum ToastMessageType {
  SUCCESS,
  ERROR,
}

extension ToastMessageTypeExtension on ToastMessageType {
  LinearGradient get gradient {
    switch (this) {
      case ToastMessageType.SUCCESS:
        return const LinearGradient(
          colors: [COLOR_CONST.purpleHeart, COLOR_CONST.jaffa],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
      case ToastMessageType.ERROR:
        return const LinearGradient(
          colors: [COLOR_CONST.white, COLOR_CONST.white],
        );
    }
  }

  String get icon {
    switch (this) {
      case ToastMessageType.SUCCESS:
        return ICON_CONST.icSuccess.path;
      case ToastMessageType.ERROR:
        return ICON_CONST.icFailure.path;
    }
  }

  Color get textColor {
    switch (this) {
      case ToastMessageType.SUCCESS:
        return COLOR_CONST.white;
      case ToastMessageType.ERROR:
        return COLOR_CONST.carnation;
    }
  }
}
