import 'package:flutter/material.dart';

import '../resources/barrel_const.dart';
import '../../../../utils/utils.dart';

class OrderByItem extends StatelessWidget {
  const OrderByItem(
      {super.key,
      required this.title,
      required this.isSelected,
      required this.onTap});
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
              gradient: isSelected ? appDefaultGradient : null,
              borderRadius: BorderRadius.circular(30)),
          child: Text(
            title,
            style: FONT_CONST.bold(
              color:
                  isSelected ? COLOR_CONST.white : COLOR_CONST.charlestonGreen,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
