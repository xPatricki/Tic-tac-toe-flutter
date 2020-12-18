import 'package:flutter/material.dart';

class SnakeBoardWidget extends StatelessWidget {
  final List<List<int>> board;

  SnakeBoardWidget(this.board);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: board.length * board[0].length,
      itemBuilder: (context, i) => Container(
        color: _getColor(i),
        child: boardValue(i) == -1
            ? Image.asset('assets/apple.png')
            : SizedBox.shrink(),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 15,
      ),
      shrinkWrap: true,
    );
  }

  Color _getColor(int i) {
    if (boardValue(i) == 0 || boardValue(i) == -1) {
      // check if value is just a board
      return i.isOdd ? Color(0xFF34ba67) : Color(0xFF52dd87);
    } else if (boardValue(i) == 1) {
      // check if value is the head of snake
      return Colors.blueGrey;
    } else {
      // value is body of the snake
      return Colors.black;
    }
  }

  int boardValue(i) => board[(i / 15).floor()][(i - (i / 15).floor() * 15)];
}
