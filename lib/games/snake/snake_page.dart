import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tictactoe/games/snake/widgets/direction_button.dart';
import 'package:tictactoe/games/snake/widgets/snake_board.dart';
import 'dart:math';

import 'package:tictactoe/main.dart';

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
  int snakeLength;
  Direction _direction;
  int score;
  Timer timer;
  bool tryAgain;
  bool lengthChanged = false;

  @override
  void initState() {
    resetSnake();
    timer = Timer.periodic(Duration(milliseconds: 400), (Timer t) => move());
    super.initState();
  }

  void resetSnake() {
    tryAgain = false;
    snake[7][3] = 4;
    snake[7][4] = 3;
    snake[7][5] = 2;
    snake[7][6] = 1; // head of the snake
    snake[7][11] = -1; // an apple
    snakeLength = 4;
    score = 0;
    _direction = Direction.RIGHT;
  }

  randomApple(List<List<int>> tab) {
    final Random random = Random();

    int randomNumber = random.nextInt(225);
    while (snakeValue(randomNumber, tab) >= 1) {
      randomNumber = random.nextInt(225);
    }
    tab[(randomNumber / 15).floor()][(randomNumber - (randomNumber / 15).floor() * 15)] = -1;
  }

  int snakeValue(i, List<List<int>> tab) => tab[(i / 15).floor()][(i - (i / 15).floor() * 15)];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            'Your score: $score',
            style: TextStyle(
              fontSize: 24.0,
            ),
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: SnakeBoardWidget(snake),
          ),
        ),
        tryAgain ? Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: CustomButton(
            text: 'Try again',
            color: Colors.green,
            textColor: Colors.white,
            onTap: () => resetSnake(),
          ),
        ) : SizedBox(height: 56),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 32),
          child: Row(
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
          ),
        )
      ],
    );
  }

  void move() {
    List<List<int>> snakeTemp = List.generate(15, (index) => List.generate(15, (i) => 0));
    bool isAppleEaten = false;
    final int appleRow = snake.indexWhere((element) => element.contains(-1));
    final int appleCol = snake[appleRow].indexWhere((element) => element == -1);
    snakeTemp[appleRow][appleCol] = -1;

    for (int i = 1; i < snakeLength; i++) {
      final int fRow = snake.indexWhere((element) => element.contains(i));
      if (fRow == -1) {
        tryAgain = true;
        break;
      }
      tryAgain = false;
      final int fCol = snake[fRow].indexWhere((element) => element == i);

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

        if(snake[headRow > 14
            ? 0
            : headRow < 0
            ? 14
            : headRow][headCol > 14
            ? 0
            : headCol < 0
            ? 14
            : headCol] == -1){
          isAppleEaten = true;
        }

        snakeTemp[headRow > 14 ? 0 : headRow < 0 ? 14 : headRow][headCol > 14
            ? 0
            : headCol < 0
            ? 14
            : headCol] = 1;
      }
      if (i == snakeLength - 1 && lengthChanged) {
        final int r = snake.indexWhere((element) => element.contains(i + 1));
        final int c = snake[r].indexWhere((element) => element == i + 1);
        snakeTemp[r][c] = i + 1;

      } else {


      }
        snakeTemp[fRow][fCol] = i + 1;
    }
    if (lengthChanged) {
      snakeLength += 1;
    }
    if (isAppleEaten) {
      score += 1;
      lengthChanged = true;
      randomApple(snakeTemp);
    } else {
      lengthChanged = false;
    }
    setState(() {
      snake.clear();
      snake.addAll(snakeTemp);
    });
  }

  void _goUp() {
      if (_direction != Direction.BOTTOM && _direction != Direction.TOP) {
        _direction = Direction.TOP;
      }
  }

  void _goDown() {
      if (_direction != Direction.BOTTOM && _direction != Direction.TOP) {
        _direction = Direction.BOTTOM;
      }
  }

  void _goRight() {
      if (_direction != Direction.RIGHT && _direction != Direction.LEFT) {
        _direction = Direction.RIGHT;
      }
  }

  void _goLeft() {
      if (_direction != Direction.RIGHT && _direction != Direction.LEFT) {
        _direction = Direction.LEFT;
      }
  }
}
