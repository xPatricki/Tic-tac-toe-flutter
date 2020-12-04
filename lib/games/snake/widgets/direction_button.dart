import 'package:flutter/material.dart';

class DirectionButton extends StatelessWidget {
  final Function onTap;
  final IconData icon;

  const DirectionButton({Key key, this.onTap, this.icon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RaisedButton(
        onPressed: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            icon,
            size: 40,
          ),
        ),
      ),
    );
  }
}
