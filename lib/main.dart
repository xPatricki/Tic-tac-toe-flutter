import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gra tic tac toe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            "Kółko i krzyżyk",
            style: TextStyle(fontSize: 20),
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
                onPressed: () {},
                child: Text(
                  "Nowa gra",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
