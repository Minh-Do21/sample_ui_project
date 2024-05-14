import 'package:flutter/material.dart';
import 'package:mor_flutter_project/resources/barrel_const.dart';

class BackgroundHeader extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..shader = const LinearGradient(
        begin: FractionalOffset.topLeft,
        end: FractionalOffset.bottomCenter,
        colors: [
          COLOR_CONST.colorGradientHeader1,
          COLOR_CONST.colorGradientHeader2,
          COLOR_CONST.colorGradientHeader1,
        ],
      ).createShader(
          Offset(size.width / 2, 100) & Size(size.width / 3, size.width));
    final path = Path();

    path.lineTo(0, size.height * 0.26);
    path.quadraticBezierTo(
      size.width * 0.04,
      size.height * 0.34,
      size.width * 0.5,
      size.height * 0.25,
    );

    path.quadraticBezierTo(
      size.width * 0.87,
      size.height * 0.18,
      size.width * 1,
      size.height * 0.25,
    );
    path.lineTo(size.width, 0);

    path.lineTo(0, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(BackgroundHeader oldDelegate) => false;
}
