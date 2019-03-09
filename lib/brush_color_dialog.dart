import 'package:flutter/material.dart';

class ColorDialog extends StatefulWidget {
  @override
  _ColorDialogState createState() => _ColorDialogState();
}

class _ColorDialogState extends State<ColorDialog> {
  List<Color> colorPalette = [
    Colors.pink,
    Colors.red,
    Colors.deepOrange,
    Colors.orange,
    Colors.amber,
    Colors.yellow,
    Colors.lightGreen,
    Colors.green,
    Colors.teal,
    Colors.cyan,
    Colors.lightBlue,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
    Colors.deepPurple,
    Colors.blueGrey,
    Colors.brown,
    Colors.grey,
    Colors.black,
    Colors.white
  ];

  List<Widget> colorRows() {
    const rowLength = 4;
    int paletteRows = colorPalette.length ~/ rowLength;
    var rows = List<Widget>();
    for (int i = 0; i < paletteRows; i++) {
      int sublistStart = i * rowLength;
      int sublistEnd = i * rowLength + rowLength;
      var colors = colorPalette.sublist(sublistStart, sublistEnd);
      var colorPickers = List<Widget>();
      colors.forEach((color) => colorPickers.add(colorSelectionButton(color)));
      rows.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: colorPickers,
      ));
    }
    return rows;
  }

  Widget colorSelectionButton(Color color) {
    return FloatingActionButton(
        mini: true,
        backgroundColor: color,
        elevation: 1.0,
        onPressed: () {
          Navigator.pop(context, color);
        });
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text('Brush Color'),
      contentPadding: const EdgeInsets.all(12),
      children: colorRows(),
    );
  }
}
