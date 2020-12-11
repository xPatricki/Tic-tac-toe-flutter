import 'package:flutter/material.dart';
import 'package:tictactoe/pages/board_page.dart';
import 'package:tictactoe/games/snake/snake_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      title: 'Gra tic tac toe',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gry"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomButton(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => BoardPage())),
              color: Colors.purple,
              text: 'Kółko i krzyżyk',
              textColor: Colors.white,
            ),
            SizedBox(height: 16,),
            CustomButton(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SnakePage())),
              color: Colors.pink,
              text: 'Snake',
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final Function onTap;
  final Color color;
  final Color textColor;

  const CustomButton({Key key, @required this.text, @required this.onTap, this.color, this.textColor}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        color: color ?? Colors.blue,
        onPressed: onTap,
        child: Text(
          text,
          style: TextStyle(fontSize: 20, color: textColor ?? Colors.black),
        ),
      ),
    );
  }
}
