import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sample_ui_project/resources/barrel_const.dart';

const appDefaultGradient = LinearGradient(
  colors: [COLOR_CONST.purpleHeart, COLOR_CONST.jaffa],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

class Utils {
  static String formatDateTimeToString(
      {required DateTime time, required DateFormat dateFormat}) {
    return dateFormat.format(time);
  }

  static String formatPrice({required double price}) {
    final nf = NumberFormat('###,##0');
    return nf.format(price).replaceAll(RegExp(','), '.');
  }
}
