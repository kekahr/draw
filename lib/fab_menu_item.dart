import 'package:draw/fab_menu_item_data.dart';
import 'package:flutter/material.dart';

class FABMenuItem extends StatelessWidget {
  FABMenuItem(this.controller, {this.data});

  final AnimationController controller;
  final FABMenuItemData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 56,
      alignment: Alignment.topCenter,
      child: ScaleTransition(
        scale:
            CurvedAnimation(parent: controller, curve: Curves.easeInOutCubic),
        child: FloatingActionButton(
          child: Icon(data.icon),
          mini: true,
          onPressed: data.callback,
        ),
      ),
    );
  }
}
