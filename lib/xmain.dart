import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:neon/Break.dart';
import 'package:neon/Draw.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:core';

import 'package:neon/Vid.dart';
import 'package:neon/VideoApp.dart';

void main() {
  runApp(MainRun());
}

class MainRun extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "My Store",
      initialRoute: '/',
      routes: {
        '/': (context) => Home(
              title: "coba",
            ),
        '/video': (context) => VideoApp(),
        '/cewi': (context) => Vid(),

      },
    );
  }
}

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _HomeState createState() => _HomeState(title: "pimen");
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  _HomeState({this.title});
  final String title;
  final String url = 'http://192.168.0.112/creativeitem/index.php?Apii';
  List data = [];
  Future<String> getData() async {
    var res = await http
        .get(Uri.encodeFull(url), headers: {'accept': 'application/json'});
    setState(() {
      var content = json.decode(res.body);
      // data = content['hasil'];
      data = content;
    });
    return 'success!';
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Draw(),
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: Column(
        children: <Widget>[
          // Draw(),
          Expanded(
            child: new Container(
                child: new Center(
              child: ListView(
                  children: data == null
                      ? null
                      : data.map((d) {
                          return new Container(
                            child: Text(d['name'].toString()),
                          );
                        }).toList()),
            )),
          ),
          new RaisedButton(
              child: new Text("video"),
              onPressed: () {
                Navigator.pushNamed(context, "/video");
              }),
          new RaisedButton(
              child: new Text("cewi"),
              onPressed: () {
                Navigator.pushNamed(context, "/cewi");
              }),
          new Break(title: "halo",),
          new Break(title: "iman",),       

        ],
      ),
    );
  }
}
