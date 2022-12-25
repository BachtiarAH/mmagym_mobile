// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
// // import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Video Player',
//       home: VideoPlayerPage(),
//     );
//   }
// }

// class VideoPlayerPage extends StatefulWidget {
//   @override
//   _VideoPlayerPageState createState() => _VideoPlayerPageState();
// }

// class _VideoPlayerPageState extends State<VideoPlayerPage> {
//   // List of video URLs
//   final List<String> _videoUrls = [    'https://www.example.com/video1.mp4',    'https://www.example.com/video2.mp4',    'https://www.example.com/video3.mp4',    'https://www.example.com/video4.mp4',    'https://www.example.com/video5.mp4',  ];

//   // Video player controller
//   late VideoPlayerController _videoPlayerController;

//   // Index of the currently playing video
//   int _currentVideoIndex = 0;

//   @override
//   void initState() {
//     super.initState();
//     // Initialize the video player controller with the first video in the list
//     _videoPlayerController = VideoPlayerController.network(_videoUrls[0]);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flutter Video Player'),
//       ),
//       body: Column(
//         children: <Widget>[
//           // Video player
//           Container(
//             height: 300,
//             child: VideoPlayer(_videoPlayerController),
//           ),
//           // List of videos
//           Expanded(
//             child: StaggeredGridView.countBuilder(
//               crossAxisCount: 2,
//               itemCount: _videoUrls.length,
//               itemBuilder: (context, index) {
//                 return InkWell(
//                   onTap: () {
//                     // Update the video player controller with the selected video
//                     setState(() {
//                       _currentVideoIndex = index;
//                       _videoPlayerController = VideoPlayerController.network(_videoUrls[index]);
//                     });
//                   },
//                   child: Container(
//                     color: Colors.blue,
//                     child: Center(
//                       child: Text('Video $index'),
//                     ),
//                   ),
//                 );
//               },
//               staggeredTileBuilder: (index) => StaggeredTile.fit(1),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
