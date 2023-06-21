import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ClockPainter extends CustomPainter {
  static double oneDegreeInRadian = 0.01745329252;

  final _secondsPointerColor = HexColor("#206080");
  final _otherPaintersColor = HexColor("#2060C0");

  Paint? _innerCircle;
  Paint? _innerCircle1;
  Paint? _outerArc;
  Paint? _outerArc1;
  Paint? _secondsLine;

  ClockPainter() {
    _innerCircle = Paint()
      ..color = HexColor("#2060C0").withOpacity(0.4)
      ..strokeWidth = 15
      ..style = PaintingStyle.fill;

    _innerCircle1 = Paint()
      ..color = HexColor("#2045C0")
      ..strokeWidth = 15
      ..style = PaintingStyle.fill;

    _outerArc = Paint()
      ..color = _otherPaintersColor
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke;
    _outerArc1 = Paint()
      ..color = Colors.grey[700]!
      ..strokeWidth = 15
      ..style = PaintingStyle.stroke;

    _secondsLine = Paint()
      ..color = Colors.white
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final center = Offset(centerX, centerY);
    final radius = min(centerX, centerY);
    const circleCircunferenceSize = pi * 2;

    final now = DateTime.now();
    final secondsLineWith = (radius / 1.25);
    final secondsRadians = degreeToRadian((360 / 60) * 15);

    canvas.drawArc(
      Rect.fromCenter(
        center: center,
        width: size.width,
        height: size.height,
      ),
      0,
      circleCircunferenceSize,
      false,
      _outerArc!,
    );

    canvas.drawArc(
      Rect.fromCenter(
        center: center,
        width: size.width * 1.5,
        height: size.height * 1.5,
      ),
      0,
      circleCircunferenceSize,
      false,
      _outerArc1!,
    );
    final centerX2 = size.width;
    final centerY2 = size.height;
    final center2 = Offset(centerX, centerY);
    final radius2 = min(centerX, centerY);
    canvas.drawCircle(
      center2,
      radius2,
      _innerCircle1!,
    );
    canvas.drawLine(
      Offset(
        centerX + cos(secondsRadians) * secondsLineWith * 2,
        centerX + sin(secondsRadians) * secondsLineWith * 2,
      ),
      const Offset(85, 168),
      _secondsLine!,
    );
  }

  double degreeToRadian(double degree) => oneDegreeInRadian * degree;

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
