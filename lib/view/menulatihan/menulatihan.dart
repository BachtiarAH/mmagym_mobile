import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mmagym_mobile/view/home/Profil.dart';
import 'package:mmagym_mobile/view/menulatihan/videoPlayer2.dart';
import 'package:video_player/video_player.dart';

class menulatihan extends StatefulWidget {
  const menulatihan({super.key});

  @override
  State<menulatihan> createState() => _menulatihanState();
}

class _menulatihanState extends State<menulatihan> {
  String? _valhari;

  final List _listhari = [
    "SENIN",
    "SELASA",
    "RABU",
    "KAMIS",
    "JUMAT",
    "SABTU",
    "MINGgu"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),

        //dropdown
        actions: [
          Row(
            children: [
              DropdownButton(
                icon: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.calendar_today_outlined,
                    color: Colors.black,
                    size: 26,
                  ),
                ),
                value: _valhari,
                items: _listhari.map((value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  // setState(() {
                  //   _valhari = value as String?;
                  // });
                },
              ),
            ],
          ),
        ],
        title: const Text(
          "Nama Menu Latihan",
          style: TextStyle(
            fontSize: 22,
          ),
          textAlign: TextAlign.center,
        ),
        foregroundColor: const Color.fromARGB(255, 0, 0, 0),
        centerTitle: false,
        backgroundColor: const Color.fromARGB(255, 202, 202, 202),
        bottom: PreferredSize(
          preferredSize: const Size(200, 4),
          child: Container(
            color: Colors.black,
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 15.89 / 100,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 202, 202, 202),
            ),
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(
                                right: 10,
                              ),
                              child: Text(
                                "PART   : ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 17),
                              ),
                            ),
                            Text(
                              "Chest",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(
                                right: 10,
                              ),
                              child: Text(
                                "LEVEL : ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 17),
                              ),
                            ),
                            Text(
                              "Intermade",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const videoPlayer2(),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 302,
            // height: MediaQuery.of(context).size.height,
            child: ListView(
              children: [
                Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      color: const Color.fromARGB(255, 255, 255, 255),
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.accessibility_new_sharp),
                          ),
                          Text(
                            "Brench Press",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ],
                      ),
                      // child: Text(
                      //   "Bench Press",
                      //   style: TextStyle(
                      //     fontWeight: FontWeight.bold,
                      //     fontSize: 20 ),
                      // ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      color: const Color.fromARGB(255, 255, 255, 255),
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.accessibility_new_sharp),
                          ),
                          Text(
                            "Brench Press",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      color: const Color.fromARGB(255, 255, 255, 255),
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.accessibility_new_sharp),
                          ),
                          Text(
                            "Brench Press",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      color: const Color.fromARGB(255, 255, 255, 255),
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.accessibility_new_sharp),
                          ),
                          Text(
                            "Brench Press",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      color: const Color.fromARGB(255, 255, 255, 255),
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.accessibility_new_sharp),
                          ),
                          Text(
                            "Brench Press",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      color: const Color.fromARGB(255, 255, 255, 255),
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.accessibility_new_sharp),
                          ),
                          Text(
                            "Brench Press",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      color: const Color.fromARGB(255, 255, 255, 255),
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.accessibility_new_sharp),
                          ),
                          Text(
                            "Brench Press",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      color: const Color.fromARGB(255, 255, 255, 255),
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.accessibility_new_sharp),
                          ),
                          Text(
                            "Brench Press",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      color: const Color.fromARGB(255, 255, 255, 255),
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.accessibility_new_sharp),
                          ),
                          Text(
                            "Brench Press",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
