import 'package:flutter/material.dart';
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
                SingleBoxWidget(shape: Shape.X,),
                SingleBoxWidget(shape: Shape.O),
                SingleBoxWidget(shape: Shape.EMPTY, rightBorder: false),

                SingleBoxWidget(shape: Shape.O),
                SingleBoxWidget(shape: Shape.X),
                SingleBoxWidget(shape: Shape.O, rightBorder: false),

                SingleBoxWidget(shape: Shape.O, bottomBorder: false),
                SingleBoxWidget(shape: Shape.EMPTY, bottomBorder: false),
                SingleBoxWidget(shape: Shape.O, bottomBorder: false, rightBorder: false),
              ],
            ),
          ],
        ),
      ),
    );
  }
}





