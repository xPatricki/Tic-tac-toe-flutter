import 'package:flutter/material.dart';
import 'package:tictactoe/main.dart';
import 'package:tictactoe/widgets/tic_tac_toe_single_box.dart';

class BoardWidget extends StatefulWidget {
  final bool circleTurn;
  final Function changeTurn;

  BoardWidget(this.circleTurn, this.changeTurn);

  @override
  _BoardWidgetState createState() => _BoardWidgetState();
}

class _BoardWidgetState extends State<BoardWidget> {
  void haha(int index) {
    setState(() {
      bool isEmpty = tablica[index] == Shape.EMPTY;
      if (isEmpty) {
        if (widget.circleTurn) {
          tablica[index] = Shape.O;
        } else {
          tablica[index] = Shape.X;
        }
        print(tablica);
        widget.changeTurn();
      }
    });
  }

  final List<Shape> tablica = [
    Shape.EMPTY,
    Shape.EMPTY,
    Shape.EMPTY,
    Shape.EMPTY,
    Shape.EMPTY,
    Shape.EMPTY,
    Shape.EMPTY,
    Shape.EMPTY,
    Shape.EMPTY,
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(24.0),
      crossAxisCount: 3,
      shrinkWrap: true,
      children: [
        SingleBoxWidget(
            shape: tablica[0],
            onTap: () {
              haha(0);
            }),
        SingleBoxWidget(shape: tablica[1], onTap: () => haha(1)),
        SingleBoxWidget(
            shape: tablica[2], onTap: () => haha(2), rightBorder: false),
        SingleBoxWidget(shape: tablica[3], onTap: () => haha(3)),
        SingleBoxWidget(shape: tablica[4], onTap: () => haha(4)),
        SingleBoxWidget(
            shape: tablica[5], onTap: () => haha(5), rightBorder: false),
        SingleBoxWidget(
            shape: tablica[6], onTap: () => haha(6), bottomBorder: false),
        SingleBoxWidget(
            shape: tablica[7], onTap: () => haha(7), bottomBorder: false),
        SingleBoxWidget(
            shape: tablica[8],
            onTap: () => haha(8),
            bottomBorder: false,
            rightBorder: false),
      ],
    );
  }
}

class BoardPage extends StatefulWidget {
  @override
  _BoardPageState createState() => _BoardPageState();
}

class _BoardPageState extends State<BoardPage> {
  bool circleTurn = true;
  void changeTurn() {
    setState(() {
      circleTurn = !circleTurn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text("Name's turn", style: TextStyle(fontSize: 40)),
            BoardWidget(circleTurn, changeTurn),
            Center(
              child: SizedBox(
                width: 200.0,
                height: 80.0,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.green, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                  ),
                  color: Colors.green,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyHomePage()),
                    );
                  },
                  child: Text(
                    "Go back",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
