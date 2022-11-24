import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mmagym_mobile/view/home/Profil.dart';
import 'package:mmagym_mobile/view/menulatihan/videoPlayer2.dart';
import 'package:mmagym_mobile/view/menulatihan/videomenulatihan.dart';
import 'package:video_player/video_player.dart';

class menulatihan extends StatefulWidget {
  const menulatihan({super.key});

  @override
  State<menulatihan> createState() => _menulatihanState();
}

class _menulatihanState extends State<menulatihan> {
  String? _valhari;

  List _listhari = [
    "senin",
    "selasa",
    "rabu",
    "kamis",
    "jumat",
    "sabtu",
    "minggu"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),

        //dropdown
        actions: [
          DropdownButton(
            icon: Icon(
              Icons.calendar_today_outlined,
              color: Colors.black,
            ),
            value: _valhari,
            items: _listhari.map((value) {
              return DropdownMenuItem(
                child: Text(value),
                value: value,
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _valhari = value as String?;
              });
            },
          ),
        ],
        title: const Text(
          "Nama Menu Latihan",
          style: TextStyle(fontSize: 23),
          textAlign: TextAlign.center,
        ),
        foregroundColor: Color.fromARGB(255, 0, 0, 0),
        centerTitle: false,
        backgroundColor: Color.fromARGB(255, 202, 202, 202),
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 110,
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
          Container(
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
                      color: Color.fromARGB(255, 255, 255, 255),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
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
                      color: Color.fromARGB(255, 255, 255, 255),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
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
                      color: Color.fromARGB(255, 255, 255, 255),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
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
                      color: Color.fromARGB(255, 255, 255, 255),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
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
                      color: Color.fromARGB(255, 255, 255, 255),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
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
                      color: Color.fromARGB(255, 255, 255, 255),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
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
                      color: Color.fromARGB(255, 255, 255, 255),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
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
                      color: Color.fromARGB(255, 255, 255, 255),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
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
                      color: Color.fromARGB(255, 255, 255, 255),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
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
