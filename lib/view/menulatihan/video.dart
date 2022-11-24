import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Video {
  String name;
  String url;
  String thumbnail;

  Video({
    required this.name,
    required this.url,
    required this.thumbnail,
  }){}
}

var videos = [
  Video(
    name: 'Elephant Dream',
    url: 'https://youtu.be/A3X2V89PKts',
    thumbnail:'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.alodokter.com%2Finilah-cara-merawat-anak-kucing-yang-tepat&psig=AOvVaw1z6BnYO0OHps_gx_0kGfXn&ust=1669211557088000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCJjRweP3wfsCFQAAAAAdAAAAABAE',
  ),
];

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({super.key});

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  late VideoPlayerController _controller;
  int _currentIndex = 0;

  void _playvideo({int index = 0, bool init = false}) {
    if (index < 0 || index >= videos.length)return;

    _controller = VideoPlayerController.network(videos[_currentIndex].url);
    // ..addListerner(setstate());
  }
    

  @override
  void initState() {
    // TODO: implement initState
    
    _playvideo(init: true);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: videos.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.network(
                        videos[index].thumbnail,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Text(videos[index].name,
                    style: const TextStyle(fontSize: 25),
                    )
                  ]),
                );
            },
            )
            )
      ],
    );
  }
}