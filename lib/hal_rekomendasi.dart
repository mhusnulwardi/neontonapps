import 'package:flutter/material.dart';

class Rekomendasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Center(
        child: new Column(
          children: <Widget>[
            new Padding(padding: new EdgeInsets.all(10.0),),
            new Text("Rekomendasi", style: new TextStyle(fontSize: 30.0),),
          ],
        ),
      ),
    );
  }
}