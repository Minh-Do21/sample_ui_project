import 'package:units_converter/units_converter.dart';
import 'dart:core';

extension UnitEx on LENGTH {
  String get unit {
    switch (this) {
      case LENGTH.kilometers:
        return 'km';
      case LENGTH.meters:
        return 'm';
      case LENGTH.centimeters:
        return 'cm';
      case LENGTH.millimeters:
        return 'mm';
      default:
        return '';
    }
  }
}

extension SublitEx on List {
  List<dynamic> mySublist(int start, [int end = 0]) {
    var max = end > length ? length : end;
    return sublist(start, max);
  }
}
