import 'package:flutter/material.dart';

import '../resources/barrel_const.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget(
      {super.key, this.avgRating, this.totalReview, this.textStyle});
  final double? avgRating;
  final int? totalReview;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ...List.generate(
          5,
          (index) => avgRating != null && avgRating! >= index + 1
              ? const Icon(
                  Icons.star,
                  size: 16,
                  color: COLOR_CONST.seaBuckthorn,
                )
              : const Icon(
                  Icons.star_border,
                  size: 16,
                  color: COLOR_CONST.seaBuckthorn,
                ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            '(${totalReview ?? 0})',
            style: textStyle ??
                FONT_CONST.regular(color: COLOR_CONST.white, fontSize: 14),
          ),
        ),
      ],
    );
  }
}
