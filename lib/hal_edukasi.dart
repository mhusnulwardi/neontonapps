import 'package:flutter/material.dart';
import 'package:neon/ChewieListItem.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:core';

class HalEdukasi extends StatefulWidget {
  @override
  _HalEdukasiState createState() => _HalEdukasiState();
}

class _HalEdukasiState extends State<HalEdukasi> {
  final String url = 'http://192.168.0.112/creativeitem/index.php?Apii/getMovie';
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
      body: new Column(
        children: <Widget>[
           Expanded(
            child: new Container(
                child: new Center(
              child: ListView(
                  children: data == null
                      ? null
                      : data.map((d) {
                          return new Container(
                            child: Text(d['title'].toString()),
                          );
                        }).toList()),
            )),
          ),
          Expanded(
            child: new Container(
              child: new ListView(
                // scrollDirection: Axis.horizontal,
                children: <Widget>[
                  ChewieListItem(
                    videoPlayerController: VideoPlayerController.asset(
                      'videos/IntroVideo.mp4',
                    ),
                    looping: true,
                  ),
                  ChewieListItem(
                    videoPlayerController: VideoPlayerController.network(
                      'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
                    ),
                  ),
                  ChewieListItem(
                    videoPlayerController: VideoPlayerController.network(
                      'http://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4',
                    ),
                  ),
                  ChewieListItem(
                    // This URL doesn't exist - will display an error
                    videoPlayerController: VideoPlayerController.network(
                      'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/error.mp4',
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
