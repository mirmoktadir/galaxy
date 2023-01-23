import 'package:flutter/material.dart';

class MIRCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.3527287, size.height * 0.003373584);
    path_0.lineTo(size.width * 0.00004675027, size.height * 0.003373584);
    path_0.lineTo(size.width * 0.00004675027, size.height * 0.9970948);
    path_0.lineTo(size.width * 0.9979787, size.height * 0.9970948);
    path_0.lineTo(size.width * 0.9979787, size.height * 0.003373584);
    path_0.lineTo(size.width * 0.6603723, size.height * 0.003373584);
    path_0.lineTo(size.width * 0.6349894, size.height * 0.003373584);
    path_0.cubicTo(
        size.width * 0.6055638,
        size.height * 0.003373584,
        size.width * 0.5877367,
        size.height * 0.1211825,
        size.width * 0.5805957,
        size.height * 0.1714740);
    path_0.cubicTo(
        size.width * 0.5192606,
        size.height * 0.6034571,
        size.width * 0.4464787,
        size.height * 0.3826208,
        size.width * 0.4240239,
        size.height * 0.2024455);
    path_0.cubicTo(
        size.width * 0.4023617,
        size.height * 0.07018234,
        size.width * 0.3949149,
        size.height * 0.01014296,
        size.width * 0.3766835,
        size.height * 0.003373584);
    path_0.lineTo(size.width * 0.3674388, size.height * 0.003373584);
    path_0.lineTo(size.width * 0.3605319, size.height * 0.003373584);
    path_0.lineTo(size.width * 0.3527287, size.height * 0.003373584);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
