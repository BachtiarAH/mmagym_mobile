// import 'dart:html';
// import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:mmagym_mobile/view/mainMenu/alat.dart';
import 'package:mmagym_mobile/view/mainMenu/gerakan.dart';
// import 'package:mmagym_mobile/models/MenuLatihanModel.dart';
// import 'package:mmagym_mobile/models/menulatihan_model.dart';
import 'package:mmagym_mobile/view/mainMenu/latihan.dart';
import 'MenuAlat.dart';
import 'item.dart';
import 'package:mmagym_mobile/view/home/home.dart';
// import 'package:mmagym_mobile/view/mainMenu/video.dart';
import 'package:video_player/video_player.dart';

const List<String> lists = <String>[
  'Beginner',
  'Pro',
  'Advance',
  'Intermediate',
  'Extreme'
];
const List<String> list1 = <String>['Chest', 'Back', 'Leg', 'Arm', 'ABS'];
List<Item> items = [
  Item("assets/images/dada.jpg", "Chest", "Chest", "Beginner"),
  Item("assets/images/sikil.jpg", "Leg", "Leg", "Pro"),
  Item("assets/images/back.jpg", "Back", "Chest", "Intermediate"),
  Item("assets/images/arm.jpg", "Arm", "Arm", "Advance"),
];
List<Item> gerakan = [
  Item("assets/images/dada.jpg", "Chest", "Chest", "Beginner"),
  Item("assets/images/sikil.jpg", "Leg", "Leg", "Pro"),
  Item("assets/images/back.jpg", "Back", "Chest", "Intermediate"),
  Item("assets/images/arm.jpg", "Arm", "Arm", "Advance"),
];
List<Alat> item = [
  Alat(
    "assets/images/chest.jpg",
    "Chest Press",
    """Alat ini untuk membesarkan otot data.""",
  ),
  Alat(
    "assets/images/squatpress.jpg",
    "Leg Press",
    "Alat ini untuk membesarkan otot paha, betis belakang & depan",
  ),
  Alat(
    "assets/images/backtrain.jpg",
    "Back",
    "Alat ini untuk membesarkan otot bagian punggung",
  ),
  Alat(
    "assets/images/dumbbellalat.jpg",
    "Dumbbell",
    "Alat ini untuk membesarkan otot bagian tangan, bahu, & dada ",
  ),
  Alat(
    "assets/images/barbellalat.jpg",
    "Barbell",
    "Alat ini untuk membesarkan otot bagian punggung, tangan, & dada ",
  ),
  Alat(
    "assets/images/treadmill.jpg",
    "Treadmill",
    "Alat ini untuk melatih kesehatan jantung dan melatih stamina",
  ),
];
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu Latihan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.grey,
      ),
      home: MenuLatihan(),
    );
  }
}

class MenuLatihan extends StatefulWidget {
  MenuLatihan({Key? key}) : super(key: key);

  final _pageController = PageController();
  final _currentPageNotifier = ValueNotifier<int>(0);
  final _boxHeight = 705.0;
  @override
  _MenuLatihanState createState() => _MenuLatihanState();
}

class _MenuLatihanState extends State<MenuLatihan> {
  String dropdownValue = lists.first;
  String dropdownValue1 = list1.first;

  int _selectedIndex = 0;
  // ignore: prefer_final_fields
  static List<Widget> _widgetOption = <Widget>[
    const Latihan(),
    Gerakan(),
    AlatView(),
    // GridView tab content Widget
    GridView.count(
      // Items in row
      crossAxisCount: 2,
      // Vertical spacing between rows
      mainAxisSpacing: 5.0,
      // Horizontal spacing between columns
      crossAxisSpacing: 5.0,
      // Padding of GridView
      padding: const EdgeInsets.all(5.0),
      // The ratio between the width and height of items
      childAspectRatio: 0.75,
      // List of items widgets
      children: items.map<Widget>((Item items) => _Gerakan(items)).toList(),
    ),
    GridView.count(
      // Items in row
      crossAxisCount: 2,
      // Vertical spacing between rows
      mainAxisSpacing: 5.0,
      // Horizontal spacing between columns
      crossAxisSpacing: 5.0,
      // Padding of GridView
      padding: const EdgeInsets.all(5.0),
      // The ratio between the width and height of items
      childAspectRatio: 0.75,
      // List of items widgets
      children: item.map<Widget>((Alat item) => _Alat(item)).toList(),
    ),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 53, 53, 53),
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Home(),
                ));
              },
              icon: const Icon(
                Icons.arrow_back_rounded,
                color: Colors.white70,
              ),
            ),
            title: IconButton(
                alignment: AlignmentDirectional.centerStart,
                onPressed: () {
                  showSearch(
                      context: context, delegate: CustomSearchDelegate());
                },
                icon: const Icon(
                  Icons.search_outlined,
                  color: Colors.white70,
                )),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    icon: const Center(
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Icon(
                          Icons.arrow_drop_up_sharp,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                    style: const TextStyle(
                        color: Color.fromARGB(255, 208, 208, 208)),
                    dropdownColor: Colors.black87,
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        dropdownValue = value!;
                      });
                    },
                    items: lists.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: dropdownValue1,
                    icon: Center(
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Icon(
                          Icons.arrow_drop_up_rounded,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                    style: const TextStyle(
                        color: Color.fromARGB(255, 208, 208, 208)),
                    dropdownColor: Colors.black87,
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        dropdownValue1 = value!;
                      });
                    },
                    items: list1.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.playlist_add_outlined,
                    color: Colors.white70,
                  )),
            ]),
        body: Center(
          child: _widgetOption.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.sports_gymnastics), label: 'Latihan'),
            BottomNavigationBarItem(
                icon: Icon(Icons.sports_martial_arts_sharp), label: 'Gerakan'),
            BottomNavigationBarItem(icon: Icon(Icons.handyman), label: 'Alat'),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: const Color.fromARGB(255, 98, 98, 98),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({Key? key}) : super(key: key);

  // const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = lists.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(
        Icons.arrow_downward,
        color: Colors.white70,
      ),
      elevation: 5,
      style: const TextStyle(color: Color.fromARGB(255, 208, 208, 208)),
      // underline: Container(
      //   height: 5,
      //   color: Color.fromARGB(255, 219, 219, 219),
      // ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: lists.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

// class _ItemFullScreenWidget extends StatelessWidget {
//   final Item _items;
//   final Alat _item;

//   const _ItemFullScreenWidget(this._item, this._items);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(_item.name),
//       ),
//       body: SizedBox.expand(
//         child: Hero(
//           tag: _item.name,
//           child: Image.network(
//             _item.imageUrl,
//             fit: BoxFit.cover,
//           ),
//         ),
//       ),
//     );
//   }
// }

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = ["Chest", "ABS", "Leg", "Back", "Arm"];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  // second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back),
        color: Colors.black54);
  }

  // third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var train in searchTerms) {
      if (train.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(train);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  // last overwrite to show the
  // querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var train in searchTerms) {
      if (train.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(train);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}

class _Latihan extends StatelessWidget {
  final Item _item;

  // final String level;

  const _Latihan(
    this._item,
    // this.level
  );

  void _selectItem(BuildContext context) {
    // Navigator.push(
    //     context,
    //     MaterialPageRoute<void>(
    //       builder: (BuildContext context) => _ItemFullScreenWidget(_item),
    //     ));
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => _selectItem(context),
      //  isThreeLine: true,
      title: Text(
        _item.name,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(left: 365.0),
        child: Text(
          _item.description,
          maxLines: 2,
          style: const TextStyle(),
        ),
      ),

      leading: Hero(
        key: Key(_item.imageUrl),
        tag: _item.name,
        child: Image.network(
          _item.imageUrl,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class VideoApp extends StatefulWidget {
  const VideoApp({Key? key}) : super(key: key);

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/lilnas.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
        body: Center(
          child: _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : Container(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

class _Gerakan extends StatelessWidget {
  final Item _gerakan;
  VideoPlayerController _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/lilnas.mp4');
  _Gerakan(this._gerakan);
  void initState() {
    // super.initState();
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/lilnas.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  void _selectItem(BuildContext context) {
    // Navigator.push(
    //     context,
    //     MaterialPageRoute<void>(
    //       builder: (BuildContext context) => _ItemFullScreenWidget(_items),
    //     ));
  }

  insialisasiVideo() {
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/lilnas.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return GridTile(
        footer: GridTileBar(
          title: Text(_gerakan.name),
          subtitle: Text(_gerakan.description),
          backgroundColor: Colors.black38,
        ),
        child: GestureDetector(
          onTap: () {
            this.insialisasiVideo();
            showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('AlertDialog Title'),
                content: Center(
                    child: AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: Column(
                    children: [
                      Text('data'),
                      Container(height: 100, child: VideoPlayer(_controller)),
                      Icon(Icons.play_arrow)
                    ],
                  ),
                )),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'OK'),
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
          },
          child: Hero(
            key: Key(_gerakan.imageUrl),
            tag: _gerakan.name,
            child: Image.network(
              _gerakan.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ));
  }

  void setState(Null Function() param0) {}
}

class _Alat extends StatelessWidget {
  final Alat _item;

  const _Alat(this._item);

  void _selectItem(BuildContext context) {
    // Navigator.push(
    //     context,
    //     MaterialPageRoute<void>(
    //       builder: (BuildContext context) => _ItemFullScreenWidget(_item),
    //     ));
  }

  @override
  Widget build(BuildContext context) {
    return GridTile(
      footer: GridTileBar(
        title: Text(_item.name),
        subtitle: Text(_item.description),
        backgroundColor: Colors.black38,
      ),
      child: GestureDetector(
        onTap: () => _selectItem(context),
        child: Hero(
          key: Key(_item.imageUrl),
          tag: _item.name,
          child: Image.network(
            _item.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
