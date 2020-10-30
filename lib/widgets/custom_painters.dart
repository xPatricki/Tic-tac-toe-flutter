import 'dart:math';
import 'package:flutter/material.dart';

class CirclePainter extends CustomPainter {
  double _fraction;
  CirclePainter(this._fraction);

  @override
  void paint(Canvas canvas, Size size) {
    final circlePaint = Paint()
      ..color = Colors.green
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    var rect = Offset(size.width/4, size.width/4) & size/2;

    canvas.drawArc(rect, -pi /2 , pi * 2 * _fraction, false, circlePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class CrossPainter extends CustomPainter {
  double _fraction;
  CrossPainter(this._fraction);

  @override
  void paint(Canvas canvas, Size size) {
    final _paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double firstLine, secondLine;

    if (_fraction < .5) {
      firstLine = _fraction / .5;
      secondLine = 0.0;
    } else {
      firstLine = 1.0;
      secondLine = (_fraction - .5) / .5;
    }

    double x = size.width/2;
    double y = size.height/2;

    canvas.drawLine(Offset(x/2,y/2), Offset(x/2 + x*firstLine , y/2 + y*firstLine), _paint);
    if (_fraction >= .5) {
      canvas.drawLine(Offset(x / 2 * 3, y / 2), Offset(x / 2 + (x * (1 - secondLine)), y / 2 + y * secondLine), _paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}