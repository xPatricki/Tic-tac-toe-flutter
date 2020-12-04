import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tictactoe/games/snake/widgets/direction_button.dart';
import 'package:tictactoe/games/snake/widgets/snake_board.dart';

class SnakePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SnakeView(),
      ),
    );
  }
}

class SnakeView extends StatefulWidget {
  @override
  _SnakeViewState createState() => _SnakeViewState();
}

enum Direction { LEFT, TOP, RIGHT, BOTTOM }

class _SnakeViewState extends State<SnakeView> {
  List<List<int>> snake = List.generate(15, (index) => List.generate(15, (i) => 0));
  int snakeLength = 4;
  Direction _direction = Direction.RIGHT;
  Timer timer;

  @override
  void initState() {
    timer = Timer.periodic(Duration(milliseconds: 400), (Timer t) => move());
    snake[7][3] = 4;
    snake[7][4] = 3;
    snake[7][5] = 2;
    snake[7][6] = 1; // head of the snake
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SnakeBoardWidget(snake),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DirectionButton(
              onTap: _goLeft,
              icon: Icons.arrow_back,
            ),
            DirectionButton(
              onTap: _goDown,
              icon: Icons.arrow_downward,
            ),
            DirectionButton(
              onTap: _goRight,
              icon: Icons.arrow_forward,
            ),
            DirectionButton(
              onTap: _goUp,
              icon: Icons.arrow_upward,
            ),
          ],
        )
      ],
    );
  }

  void move() {
    List<List<int>> snakeTemp = List.generate(15, (index) => List.generate(15, (i) => 0));
    for (int i = 1; i < snakeLength; i++) {
      int fRow = snake.indexWhere((element) => element.contains(i));
      int fCol = snake[fRow].indexWhere((element) => element == i);

      if (i == 1) {
        int headCol = fCol;
        int headRow = fRow;
        switch (_direction) {
          case Direction.LEFT:
            headCol--;
            break;
          case Direction.TOP:
            headRow--;
            break;
          case Direction.RIGHT:
            headCol++;
            break;
          case Direction.BOTTOM:
            headRow++;
            break;
        }
        snakeTemp[headRow > 14 ? 0 : headRow < 0 ? 14 : headRow][headCol > 14 ? 0 : headCol < 0 ? 14 : headCol] = 1;
      }
      snakeTemp[fRow][fCol] = i + 1;
    }
    setState(() {
      snake.clear();
      snake.addAll(snakeTemp);
    });
  }

  void _goUp() {
    setState(() {
      if (_direction != Direction.BOTTOM && _direction != Direction.TOP) {
        _direction = Direction.TOP;
      }
    });
  }

  void _goDown() {
    setState(() {
      if (_direction != Direction.BOTTOM && _direction != Direction.TOP) {
        _direction = Direction.BOTTOM;
      }
    });
  }

  void _goRight() {
    setState(() {
      if (_direction != Direction.RIGHT && _direction != Direction.LEFT) {
        _direction = Direction.RIGHT;
      }
    });
  }

  void _goLeft() {
    setState(() {
      if (_direction != Direction.RIGHT && _direction != Direction.LEFT) {
        _direction = Direction.LEFT;
      }
    });
  }
}