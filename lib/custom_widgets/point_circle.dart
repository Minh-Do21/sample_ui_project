import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../resources/barrel_const.dart';
import '../utils/utils.dart';

class PointCircleContainer extends StatelessWidget {
  const PointCircleContainer(
      {super.key,
      required this.point,
      this.beforeDiscountPoint,
      this.boxDecoration,
      this.gradientColorText,
      this.textStyleColor,
      this.borderBoxDecoration});
  final String point;
  final int? beforeDiscountPoint;
  final BoxDecoration? boxDecoration;
  final BoxDecoration? borderBoxDecoration;
  final List<Color>? gradientColorText;
  final TextStyle? textStyleColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: borderBoxDecoration ??
          const BoxDecoration(
            gradient: appDefaultGradient,
            shape: BoxShape.circle,
          ),
      child: Container(
        height: 45,
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: boxDecoration ??
            const BoxDecoration(
                color: COLOR_CONST.white, shape: BoxShape.circle),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            beforeDiscountPoint != null && beforeDiscountPoint! != 0
                ? Text(
                    '$beforeDiscountPoint P',
                    style: FONT_CONST.bold(
                        color: Colors.grey,
                        fontSize: 12,
                        textDecoration: TextDecoration.lineThrough),
                  )
                : const SizedBox.shrink(),
            GradientText(
              point,
              style: textStyleColor ??
                  FONT_CONST.semoBold(
                    color: COLOR_CONST.purpleHeart,
                    fontSize: 12,
                  ),
              colors: gradientColorText ??
                  const [
                    COLOR_CONST.purpleHeart,
                    COLOR_CONST.jaffa,
                  ],
            ),
          ],
        ),
      ),
    );
  }
}
