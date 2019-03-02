import 'package:draw/painter.dart';
import 'package:flutter/material.dart';

class DrawPage extends StatefulWidget {
  @override
  _DrawPageState createState() => _DrawPageState();
}

class _DrawPageState extends State<DrawPage> {
  List<Offset> points = List<Offset>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: GestureDetector(
          onPanUpdate: (DragUpdateDetails details) {
            setState(() {
              RenderBox renderBox = context.findRenderObject();
              Offset localOffset =
                  renderBox.globalToLocal(details.globalPosition);
              points = List.from(points)..add(localOffset);
            });
          },
          onPanEnd: (DragEndDetails details) => points.add(null),
          child: CustomPaint(
            painter: Painter(points: points),
            size: Size.infinite,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => points.clear(),
        child: Icon(Icons.clear),
      ),
    );
  }
}
