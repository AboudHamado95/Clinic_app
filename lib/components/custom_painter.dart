import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.8285714);
    path_0.quadraticBezierTo(size.width * 0.0016667, size.height * 0.9171429,
        size.width * 0.2000000, size.height * 0.9142857);
    path_0.cubicTo(
        size.width * 0.5016667,
        size.height * 0.9150000,
        size.width * 0.6683333,
        size.height * 0.9135714,
        size.width * 0.8333333,
        size.height * 0.9142857);
    path_0.quadraticBezierTo(size.width * 1.0100000, size.height * 0.9164286,
        size.width, size.height);
    path_0.lineTo(size.width, size.height * 0.3714286);
    path_0.quadraticBezierTo(size.width * 1.0050000, size.height * 0.2885714,
        size.width * 0.7833333, size.height * 0.2857143);
    path_0.cubicTo(
        size.width * 0.6291667,
        size.height * 0.2871429,
        size.width * 0.4958333,
        size.height * 0.2864286,
        size.width * 0.2000000,
        size.height * 0.2857143);
    path_0.quadraticBezierTo(size.width * 0.0016667, size.height * 0.2821429, 0,
        size.height * 0.1857143);
    path_0.lineTo(0, size.height * 0.8285714);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
