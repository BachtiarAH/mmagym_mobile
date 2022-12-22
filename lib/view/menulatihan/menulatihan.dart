import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mmagym_mobile/clien/isiMenuLatihanClient.dart';
import 'package:mmagym_mobile/models/IsiMenuModel.dart';
import 'package:mmagym_mobile/view/home/Profil.dart';
import 'package:mmagym_mobile/view/menulatihan/videoPlayer2.dart';
import 'package:mmagym_mobile/view/menulatihan/videomenulatihan.dart';
import 'package:video_player/video_player.dart';

class menulatihan extends StatefulWidget {
  var idMenu;
  
  menulatihan({super.key,required this.idMenu});


  @override
  State<menulatihan> createState() => _menulatihanState(idMenu);
}

class _menulatihanState extends State<menulatihan> {
  String? _valhari;
  late Future<IsiMenu> model;
  late IsiMEnuLatihanClient client = new IsiMEnuLatihanClient();
  late String idVideo = '';
  late videoPlayer2 video;
  late var _idMenu;

  _menulatihanState(id_menu){
    this._idMenu = id_menu;
  }

  final List _listhari = [
    "SENIN",
    "SELASA",
    "RABU",
    "KAMIS",
    "JUMAT",
    "SABTU",
    "MINGGU"
  ];

  @override
  void initState() {
    // TODO: implement initState
    model = client.getIsiMenu(idMenu: this._idMenu);
    super.initState();
  }

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
        title: FutureBuilder(
            future: model,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(
                  snapshot.data!.body.header[0].namaMenuLatihan,
                  style: TextStyle(
                    fontSize: 23,
                  ),
                  textAlign: TextAlign.center,
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('error: ' + snapshot.error.toString()),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
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
          ElevatedButton(
              onPressed: () {
                IsiMEnuLatihanClient().getIsiMenu();
              },
              child: Text('data')),
          FutureBuilder(
              future: model,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
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
                                  children: [
                                    const Padding(
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
                                      snapshot.data!.body.header[0].headerPart,
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
                                  children: [
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
                                      snapshot.data!.body.header[0].level,
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
                  );
                } else if (snapshot.hasError) {
                  print(snapshot.error);
                  return Center(
                    child: Text('error: ' + snapshot.error.toString()),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
          FutureBuilder(
            future: model,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                video = videoPlayer2(idVideo: snapshot.data!.body.isi[0].video);
                return video;
              } else if (snapshot.hasError) {
                print(snapshot.error);
                return Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Icon(Icons.play_arrow_sharp),
                  ),
                );
              } else {
                return Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Icon(Icons.play_arrow_sharp),
                  ),
                );
              }
            },
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 302,
            // height: MediaQuery.of(context).size.height,
            child: FutureBuilder(
                future: model,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.body.isi.length,
                      itemBuilder: (context, index) {
                        try {
                          return ListTile(
                            leading: Image.network(
                              'https://drive.google.com/uc?export=view&id=${snapshot.data!.body.isi[index].gambar}',
                              height: 30,
                              width: 30,
                            ),
                            title: Text(
                                snapshot.data!.body.isi[index].namaGerakan),
                            subtitle: Text(snapshot.data!.body.isi[index].note),
                            trailing: Column(
                              children: [
                                Text(snapshot.data!.body.isi[index].repetisi
                                    .toString()),
                                Text(snapshot.data!.body.isi[index].setLatihan
                                    .toString())
                              ],
                            ),
                            onTap: () {
                              setState(() {
                                idVideo = snapshot.data!.body.isi[index].video;
                                video = videoPlayer2(idVideo: idVideo);
                                print(idVideo);
                              });
                            },
                          );
                        } catch (e) {
                          return Text('error: ${e.toString()}');
                        }
                      },
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          )
        ],
      ),
    );
  }
}
