import 'package:flutter/material.dart';

import './hal_rekomendasi.dart' as rekomendasi;
import './hal_edukasi.dart' as edukasi;
import './hal_entertaiment.dart' as entertaiment;

void main() {
  runApp(new MaterialApp(
    title: "Neonton",
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    controller = new TabController(vsync: this, length: 3);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.lightBlueAccent,
        leading: new Icon(Icons.list),
        title: new Center(child: new Text("NEONTON"),),
        actions: <Widget>[
          new Icon(Icons.search)
        ],
        bottom: new TabBar(
          controller: controller,
          tabs: <Widget>[
            new Tab(
              icon: new Icon(Icons.event), text: "Rekomendasi",
            ),
            new Tab(
              icon: new Icon(Icons.event), text: "Edukasi",
            ),
            new Tab(
              icon: new Icon(Icons.event), text: "Entertaiment",
            ),
          ],
        ),
      ),
      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          new rekomendasi.Rekomendasi(),
          new edukasi.Edukasi(),
          new entertaiment.Entertaiment(),
        ],
      ),
    );
  }
}
