import 'package:draw/painter_settings.dart';
import 'package:flutter/material.dart';

class Painter extends CustomPainter {
  PainterSettings settings;

  Painter({this.settings});

  @override
  void paint(Canvas canvas, _) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = settings.brushWidth;

    for (int i = 0; i < settings.points.length - 1; i++) {
      if (settings.points[i] != null && settings.points[i + 1] != null) {
        canvas.drawLine(settings.points[i], settings.points[i + 1], paint);
      }
    }
  }

  @override
  bool shouldRepaint(Painter oldDelegate) =>
      oldDelegate.settings.points != settings.points;
}
