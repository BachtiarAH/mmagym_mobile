// import 'package:flutter/material.dart';
// import 'package:menulatihan/pag/circle_page_indicator.dart';
// import 'item.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Menu Latihan',
//       theme: ThemeData(
//         primaryColorLight: Colors.white,
//       ),
//       home: CirclePageIndicatorDemo2(),
//     );
//   }
// }

// class CirclePageIndicatorDemo2 extends StatefulWidget {
//   // const CirclePageIndicatorDemo2({super.key});

//   @override
//   CirclePageIndicatorDemoState2 createState() {
//     return new CirclePageIndicatorDemoState2();
//   }
// }

// class CirclePageIndicatorDemoState2 extends State<CirclePageIndicatorDemo2> {
//   final _items = [
//     ListView.builder(
//       itemCount: items.length,
//       itemBuilder: (BuildContext context, int position) =>
//           _ItemListCellWidget(items[position]),
//     ),
//     GridView.count(
//       // Items in row
//       crossAxisCount: 2,
//       // Vertical spacing between rows
//       mainAxisSpacing: 5.0,
//       // Horizontal spacing between columns
//       crossAxisSpacing: 5.0,
//       // Padding of GridView
//       padding: const EdgeInsets.all(5.0),
//       // The ratio between the width and height of items
//       childAspectRatio: 0.75,
//       // List of items widgets
//       children:
//           items.map<Widget>((Item item) => _ItemGridCellWidget(item)).toList(),
//     ),
//     GridView.count(
//       // Items in row
//       crossAxisCount: 2,
//       // Vertical spacing between rows
//       mainAxisSpacing: 5.0,
//       // Horizontal spacing between columns
//       crossAxisSpacing: 5.0,
//       // Padding of GridView
//       padding: const EdgeInsets.all(5.0),
//       // The ratio between the width and height of items
//       childAspectRatio: 0.75,
//       // List of items widgets
//       children:
//           items.map<Widget>((Item item) => _ItemGridCellWidget(item)).toList(),
//     ),
//   ];
//   final _pageController = PageController();
//   final _currentPageNotifier = ValueNotifier<int>(0);
//   final _boxHeight = 705.0;

//   var onPageChanged;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           title: Text('Menu Latihan'),
//           leading: IconButton(
//             onPressed: () {
//               showSearch(context: context, delegate: CustomSearchDelegate());
//             },
//             icon: const Icon(Icons.search),
//           )),
//       body: _buildBody(),
//     );
//   }

//   _buildBody() {
//     return Column(
//       children: <Widget>[
//         Stack(
//           children: <Widget>[
//             _buildPageView(),
//             _buildCircleIndicator(),
//           ],
//         ),
//         Expanded(
//           child: ListView(
//             children: <Widget>[]
//                 .map((item) => Padding(
//                       child: item,
//                       padding: EdgeInsets.all(8.0),
//                     ))
//                 .toList(),
//           ),
//         ),
//       ],
//     );
//   }

//   _buildPageView() {
//     return Container(
//       color: Colors.black12,
//       height: _boxHeight,
//       child: PageView.builder(
//         controller: _pageController,
//         itemBuilder: (BuildContext context, int index) {
//           return TabBarView(
//             children: <Widget>[
//               ListView.builder(
//                 itemCount: items.length,
//                 itemBuilder: (BuildContext context, int position) =>
//                     _ItemListCellWidget(items[position]),
//               ),
//               // ListView tab content Widget
//               // GridView tab content Widget
//               GridView.count(
//                 // Items in row
//                 crossAxisCount: 2,
//                 // Vertical spacing between rows
//                 mainAxisSpacing: 5.0,
//                 // Horizontal spacing between columns
//                 crossAxisSpacing: 5.0,
//                 // Padding of GridView
//                 padding: const EdgeInsets.all(5.0),
//                 // The ratio between the width and height of items
//                 childAspectRatio: 0.75,
//                 // List of items widgets
//                 children: items
//                     .map<Widget>((Item item) => _ItemGridCellWidget(item))
//                     .toList(),
//               ),
//               GridView.count(
//                 // Items in row
//                 crossAxisCount: 2,
//                 // Vertical spacing between rows
//                 mainAxisSpacing: 5.0,
//                 // Horizontal spacing between columns
//                 crossAxisSpacing: 5.0,
//                 // Padding of GridView
//                 padding: const EdgeInsets.all(5.0),
//                 // The ratio between the width and height of items
//                 childAspectRatio: 0.75,
//                 // List of items widgets
//                 children: items
//                     .map<Widget>((Item item) => _ItemGridCellWidget(item))
//                     .toList(),
//               ),
//               onPageChanged[(int index) {
//                 _currentPageNotifier.value = index % _items.length;
//               }],
//             ],
//           );
//         },
//       ),
//     );
//   }

//   _buildCircleIndicator() {
//     return Positioned(
//       left: 0.0,
//       right: 0.0,
//       bottom: 680.0,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: CirclePageIndicator(
//           itemCount: _items.length,
//           currentPageNotifier: _currentPageNotifier,
//         ),
//       ),
//     );
//   }
// }

// class CustomSearchDelegate extends SearchDelegate {
//   List<String> searchTerms = ["Chest", "ABS", "Leg", "Back", "Arm", "Jump"];

//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//         onPressed: () {
//           query = '';
//         },
//         icon: Icon(Icons.clear),
//       ),
//     ];
//   }

//   // second overwrite to pop out of search menu
//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//       onPressed: () {
//         close(context, null);
//       },
//       icon: Icon(Icons.arrow_back),
//     );
//   }

//   // third overwrite to show query result
//   @override
//   Widget buildResults(BuildContext context) {
//     List<String> matchQuery = [];
//     for (var train in searchTerms) {
//       if (train.toLowerCase().contains(query.toLowerCase())) {
//         matchQuery.add(train);
//       }
//     }
//     return ListView.builder(
//       itemCount: matchQuery.length,
//       itemBuilder: (context, index) {
//         var result = matchQuery[index];
//         return ListTile(
//           title: Text(result),
//         );
//       },
//     );
//   }

//   // last overwrite to show the
//   // querying process at the runtime
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     List<String> matchQuery = [];
//     for (var train in searchTerms) {
//       if (train.toLowerCase().contains(query.toLowerCase())) {
//         matchQuery.add(train);
//       }
//     }
//     return ListView.builder(
//       itemCount: matchQuery.length,
//       itemBuilder: (context, index) {
//         var result = matchQuery[index];
//         return ListTile(
//           title: Text(result),
//         );
//       },
//     );
//   }
// }

// List<Item> items = [
//   Item(
//     "https://i.pinimg.com/originals/df/0a/3e/df0a3e2ec30abb1c92d145ef165b714f.gif",
//     "Nature 1",
//     """Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
//     tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
//     quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
//     consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
//     cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
//     proident, sunt in culpa qui officia deserunt mollit anim id est laborum.""",
//   ),
//   Item(
//     "https://i.pinimg.com/originals/40/c3/be/40c3bef82a8077e5c872808eefff5c6d.png",
//     "Nature 2",
//     "Description",
//   ),
//   Item(
//     "https://image.freepik.com/free-vector/flat-design-baby-shark-cartoon-style_52683-36255.jpg",
//     "Nature 3",
//     "Description",
//   ),
//   Item(
//     "https://image.freepik.com/free-vector/fairytale-concept-with-child-reading_23-2148472951.jpg",
//     "Sensetpier",
//     "Description",
//   ),
//   Item(
//     "https://img.freepik.com/free-vector/spring-landscape-scene_23-2148860692.jpg",
//     "Nature 5",
//     "Description",
//   ),
//   Item(
//     "https://pw.artfile.me/wallpaper/20-03-2017/650x366/vektornaya-grafika-priroda--nature-sneg--1143282.jpg",
//     "Night Nature",
//     "Description",
//   ),
// ];

// class _ItemFullScreenWidget extends StatelessWidget {
//   final Item _item;

//   _ItemFullScreenWidget(this._item);

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

// class _ItemGridCellWidget extends StatelessWidget {
//   final Item _item;

//   _ItemGridCellWidget(this._item);

//   void _selectItem(BuildContext context) {
//     Navigator.push(
//         context,
//         MaterialPageRoute<void>(
//           builder: (BuildContext context) => _ItemFullScreenWidget(_item),
//         ));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GridTile(
//         footer: GridTileBar(
//           title: Text(_item.name),
//           subtitle: Text(_item.description),
//           backgroundColor: Colors.black38,
//         ),
//         child: GestureDetector(
//           onTap: () => _selectItem(context),
//           child: Hero(
//             key: Key(_item.imageUrl),
//             tag: _item.name,
//             child: Image.network(
//               _item.imageUrl,
//               fit: BoxFit.cover,
//             ),
//           ),
//         ));
//   }
// }

// class _ItemListCellWidget extends StatelessWidget {
//   final Item _item;

//   _ItemListCellWidget(this._item);

//   void _selectItem(BuildContext context) {
//     Navigator.push(
//         context,
//         MaterialPageRoute<void>(
//           builder: (BuildContext context) => _ItemFullScreenWidget(_item),
//         ));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       onTap: () => _selectItem(context),
// //      isThreeLine: true,
//       title: Text(
//         _item.name,
//         style: TextStyle(
//           fontWeight: FontWeight.w500,
//           fontSize: 20,
//         ),
//       ),
//       subtitle: Text(
//         _item.description,
//         maxLines: 2,
//         style: TextStyle(),
//       ),
//       leading: Hero(
//         key: Key(_item.imageUrl),
//         tag: _item.name,
//         child: Image.network(
//           _item.imageUrl,
//           width: 50,
//           height: 50,
//           fit: BoxFit.cover,
//         ),
//       ),
//     );
//   }
// }
