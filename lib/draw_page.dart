import 'package:draw/brush_color_dialog.dart';
import 'package:draw/brush_width_dialog.dart';
import 'package:draw/fab_menu.dart';
import 'package:draw/fab_menu_item_data.dart';
import 'package:draw/painter.dart';
import 'package:draw/painter_settings.dart';
import 'package:flutter/material.dart';

class DrawPage extends StatefulWidget {
  @override
  _DrawPageState createState() => _DrawPageState();
}

class _DrawPageState extends State<DrawPage> with TickerProviderStateMixin {
  AnimationController controller;
  PainterSettings painterSettings;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    painterSettings = PainterSettings();
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
                painterSettings = PainterSettings.from(painterSettings,
                    newOffset: localOffset);
              });
            },
            onPanEnd: (_) => painterSettings.points.add(null),
            child: CustomPaint(
              painter: Painter(settings: painterSettings),
              size: Size.infinite,
            ),
          ),
        ),
        floatingActionButton: FABMenu(
          controller,
          menuIcon: Icons.brush,
          menuList: [
            FABMenuItemData(icon: Icons.clear, callback: clearCanvas),
            FABMenuItemData(icon: Icons.lens, callback: changeBrushWidth),
            FABMenuItemData(icon: Icons.color_lens, callback: changeBrushColor),
          ],
        ));
  }

  Future<void> clearCanvas() async => painterSettings.reset();

  Future<void> changeBrushWidth() async {
    double newWidth = await showDialog(
        context: context,
        builder: (context) =>
            BrushWidthDialog(brushWidth: painterSettings.brushWidth));
    if (newWidth != null) {
      setState(() {
        painterSettings.brushWidth = newWidth;
      });
    }
  }

  Future<void> changeBrushColor() async {
    Color newColor =
        await showDialog(context: context, builder: (context) => ColorDialog());
    if (newColor != null) {
      setState(() {
        painterSettings.brushColor = newColor;
      });
    }
  }
}
