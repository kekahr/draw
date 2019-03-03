import 'package:draw/painter.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class DrawPage extends StatefulWidget {
  @override
  _DrawPageState createState() => _DrawPageState();
}

class _DrawPageState extends State<DrawPage> with TickerProviderStateMixin {
  AnimationController controller;
  var points = List<Offset>();

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
      );
    super.initState();
  }

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
          onPanEnd: (_) => points.add(null),
          child: CustomPaint(
            painter: Painter(points: points),
            size: Size.infinite,
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize:MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 70,
            width: 56,
            alignment: Alignment.topCenter,
            child: ScaleTransition(
              scale: CurvedAnimation(
                parent: controller,
                curve: Curves.easeInOutCubic
              ),
              child: FloatingActionButton(
                child: const Icon(Icons.clear),
                mini: true,
                onPressed: () => points.clear(),
              ),
            )
          ),
          FloatingActionButton(
            child: AnimatedBuilder(
              animation: controller,
              builder: (_, __) {
                return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationZ(controller.value / 2 * math.pi),
                  child: const Icon(Icons.brush),
                  );
              },
            ),
            onPressed: () {
              if(controller.isDismissed) {
                controller.forward();
              } else {
                controller.reverse();
              }
            },
          ),
        ],
      )
    );
  }
}
