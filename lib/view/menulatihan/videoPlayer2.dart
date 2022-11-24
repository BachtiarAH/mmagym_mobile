import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:video_player/video_player.dart';

class videoPlayer2 extends StatefulWidget {
  const videoPlayer2({super.key});

  @override
  State<videoPlayer2> createState() => _videoPlayer2State();
}

class _videoPlayer2State extends State<videoPlayer2> {
  late VideoPlayerController controller;

  @override
  void initState() {
    loadVideoPlayer();
    super.initState();
  }

  loadVideoPlayer() {
    
    controller = VideoPlayerController.network(
        'https://www.fluttercampus.com/video.mp4');
    controller.addListener(() {
      setState(() {});
    });
    controller.initialize().then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      AspectRatio(
        aspectRatio: controller.value.aspectRatio,
        child: VideoPlayer(controller),
      ),
      VideoProgressIndicator(controller,
          allowScrubbing: true,
          colors: VideoProgressColors(
            backgroundColor: Color.fromARGB(255, 227, 227, 227),
            playedColor: Color.fromARGB(255, 255, 0, 0),
            bufferedColor: Color.fromARGB(255, 153, 153, 153),
          )),
      Container(
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  if (controller.value.isPlaying) {
                    controller.pause();
                  } else {
                    controller.play();
                  }

                  setState(() {});
                },
                icon: Icon(controller.value.isPlaying
                    ? Icons.pause
                    : Icons.play_arrow)),
            IconButton(
                onPressed: () {
                  controller.seekTo(Duration(seconds: 0));

                  setState(() {});
                },
                icon: Icon(Icons.stop))
          ],
        ),
      )
    ]));
  }
}
