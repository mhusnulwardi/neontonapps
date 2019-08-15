import 'package:flutter/material.dart';
import 'ChewieListItem.dart';
import 'package:video_player/video_player.dart';

class Vid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Test Play Video"),
      ),
      body: new Column(
        children: <Widget>[
          Expanded(
            child: new Container(
              child: new ListView(
                scrollDirection: Axis.horizontal,
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
