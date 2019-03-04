import 'package:draw/fab_menu_item.dart';
import 'package:draw/fab_menu_item_data.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class FABMenu extends StatelessWidget {
  FABMenu(this.controller, {this.menuIcon, this.menuList});

  final AnimationController controller;
  final IconData menuIcon;
  final List<FABMenuItemData> menuList;

  List<Widget> getMenuItems() {
    var widgets = List<Widget>();
    menuList.forEach((menuItem) {
      widgets.add(FABMenuItem(controller, data: menuItem));
    });
    widgets.add(FloatingActionButton(
      child: AnimatedBuilder(
        animation: controller,
        builder: (_, __) {
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationZ(controller.value / 2 * math.pi),
            child: Icon(menuIcon),
          );
        },
      ),
      onPressed: () {
        if (controller.isDismissed) {
          controller.forward();
        } else {
          controller.reverse();
        }
      },
    ));
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: getMenuItems());
  }
}
