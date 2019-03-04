import 'package:flutter/material.dart';

class PainterSettings {
  PainterSettings() {
    this.points = List<Offset>();
    this.brushColor = Colors.black;
    this.brushWidth = 5;
  }

  PainterSettings.from(PainterSettings settings, Offset newOffset) {
    this.points = List.from(settings.points)..add(newOffset);
    this.brushColor = settings.brushColor;
    this.brushWidth = settings.brushWidth;
  }

  List<Offset> points;
  Color brushColor;
  double brushWidth;

  void reset() {
    points.clear();
  }
}
