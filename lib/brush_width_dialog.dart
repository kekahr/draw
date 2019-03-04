import 'package:flutter/material.dart';

class BrushWidthDialog extends StatefulWidget {
  final double brushWidth;

  BrushWidthDialog({this.brushWidth});

  @override
  State<StatefulWidget> createState() => BrushWidthDialogState();
}

class BrushWidthDialogState extends State<BrushWidthDialog> {
  double brushWidth;

  @override
  void initState() {
    super.initState();
    brushWidth = widget.brushWidth;
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
        title: Text("Brush thickness"),
        contentPadding: const EdgeInsets.all(12.0),
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Container(
                width: brushWidth,
                height: brushWidth,
                decoration:
                    BoxDecoration(color: Colors.black, shape: BoxShape.circle),
              )),
          Slider(
            value: brushWidth,
            min: 1.0,
            max: 20.0,
            onChanged: (newValue) {
              setState(() {
                brushWidth = newValue;
              });
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                  child: Text(
                    "CANCEL",
                    style: TextStyle(color: Theme.of(context).accentColor),
                  ),
                  onPressed: () async {
                    Navigator.pop(context);
                  }),
              FlatButton(
                  child: Text(
                    "ACCEPT",
                    style: TextStyle(color: Theme.of(context).accentColor),
                  ),
                  onPressed: () async {
                    Navigator.pop(context, brushWidth);
                  }),
            ],
          )
        ]);
  }
}
