import 'package:flutter/material.dart';
class Break extends StatefulWidget {
  final String title;
   Break({Key key, this.title}) : super(key: key);
  @override
  _BreakState createState() => _BreakState(title: title);
}

class _BreakState extends State<Break> {
  _BreakState({this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: new Row(children: <Widget>[
          new Text(title)
        ],),
    );
  }
}