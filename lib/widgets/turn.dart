import 'package:flutter/material.dart';

import './custom_painters.dart';

class Turn extends StatefulWidget {
  final int turn;

  Turn(this.turn);
  @override
  State<StatefulWidget> createState() {
    return _Turn();
  }
}

class _Turn extends State<Turn> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          margin: const EdgeInsets.all(10.0),
          color: Colors.green,
          width: 35,
          height: 35,
          child: Row(children: <Widget>[
            Text('Names turn ', style: TextStyle(fontSize: 15)),
            CustomPaint(
              size: Size(25.0, 25.0),
              painter: widget.turn == 1
                  ? CirclePainter(1.0)
                  : CrossPainter(1.0),
            )
          ])),
    );
  }
}
