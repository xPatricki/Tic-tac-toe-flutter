import 'package:flutter/material.dart';
import 'package:tictactoe/main.dart';
import 'package:tictactoe/widgets/tic_tac_toe_single_box.dart';

class BoardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text("Name's turn", style: TextStyle(fontSize: 40)),
            GridView.count(
              physics: NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(24.0),
              crossAxisCount: 3,
              shrinkWrap: true,
              children: [
                SingleBoxWidget(shape: Shape.EMPTY),
                SingleBoxWidget(shape: Shape.EMPTY),
                SingleBoxWidget(shape: Shape.EMPTY, rightBorder: false),
                SingleBoxWidget(shape: Shape.EMPTY),
                SingleBoxWidget(shape: Shape.EMPTY),
                SingleBoxWidget(shape: Shape.EMPTY, rightBorder: false),
                SingleBoxWidget(shape: Shape.EMPTY, bottomBorder: false),
                SingleBoxWidget(shape: Shape.EMPTY, bottomBorder: false),
                SingleBoxWidget(
                    shape: Shape.EMPTY,
                    bottomBorder: false,
                    rightBorder: false),
              ],
            ),
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
