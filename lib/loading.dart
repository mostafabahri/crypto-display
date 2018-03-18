import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text('Loading...',
            style: new TextStyle(
                color: Colors.teal[900],
                fontSize: 18.0
            ),)
        ],
      ),
    );
  }
}
