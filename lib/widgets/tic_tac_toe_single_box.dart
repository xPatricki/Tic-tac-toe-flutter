import 'package:flutter/material.dart';
import 'package:tictactoe/widgets/custom_painters.dart';

enum Shape { X, O, EMPTY }

class SingleBoxWidget extends StatelessWidget {
  final bool bottomBorder;
  final bool rightBorder;
  final Shape shape;
  final Function onTap;

  SingleBoxWidget(
      {this.shape = Shape.EMPTY,
      this.bottomBorder = true,
      this.rightBorder = true,
      @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
            border: Border(
          bottom: BorderSide(
              color: bottomBorder ? Colors.black : Colors.transparent,
              width: 3.0),
          right: BorderSide(
              color: rightBorder ? Colors.black : Colors.transparent,
              width: 3.0),
        )),
        child: ShapeWidget(shape: shape),
      ),
      onTap: onTap,
    );
  }
}

class ShapeWidget extends StatelessWidget {
  final Shape shape;

  const ShapeWidget({Key key, this.shape}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(end: 1, begin: 0),
      duration: Duration(milliseconds: 300),
      builder: (context, double fraction, _) {
        switch (shape) {
          case Shape.O:
            return CustomPaint(
              painter: CirclePainter(fraction),
            );
          case Shape.X:
            return CustomPaint(
              painter: CrossPainter(fraction),
            );
          default:
            return SizedBox.shrink();
        }
      },
    );
  }
}
