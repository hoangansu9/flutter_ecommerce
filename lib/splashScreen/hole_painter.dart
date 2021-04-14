import 'package:flutter/material.dart';

class HolePainter extends CustomPainter {
  HolePainter({
    @required this.color,
    @required this.holeSize,
  });
   MaterialColor splashRimColor = const MaterialColor(
    0xFF010035,
    const <int, Color>{
      50: const Color(0xFF010035),
      100: const Color(0xFF010035),
      200: const Color(0xFF010035),
      300: const Color(0xFF010035),
      400: const Color(0xFF010035),
      500: const Color(0xFF010035),
      600: const Color(0xFF010035),
      700: const Color(0xFF010035),
      800: const Color(0xFF010035),
      900: const Color(0xFF010035),
    },
  );
  Color color;
  double holeSize;

  @override
  void paint(Canvas canvas, Size size) {
    double radius = holeSize / 2;
    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    Rect outerCircleRect = Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: radius);
    Rect innerCircleRect = Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: radius / 2);

    Path transparentHole = Path.combine(
      PathOperation.difference,
      Path()..addRect(
          rect
      ),
      Path()
        ..addOval(outerCircleRect)
        ..close(),
    );

    Path halfTransparentRing = Path.combine(
      PathOperation.difference,
      Path()
        ..addOval(outerCircleRect)
        ..close(),
      Path()
        ..addOval(innerCircleRect)
        ..close(),
    );

    canvas.drawPath(transparentHole, Paint()..color = color);
    canvas.drawPath(halfTransparentRing, Paint()..color = splashRimColor.withOpacity(0.5));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}